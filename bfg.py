#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys

from pathlib import Path
from PyQt5 import QtCore, QtWidgets, uic


PATH = Path(__file__).parent.resolve()
MAIN_UI_FILE = PATH / 'bfg.ui'
INPUT_UI_FILE = PATH / 'bfg_input.ui'
TAPE_START_SIZE = 50
TAPE_EXTEND_SIZE = 50


def _strip(bf_program, commands):
    return ''.join([x for x in bf_program if x in commands])


class BFInputDialog(QtWidgets.QDialog):

    def __init__(self, parent=None):
        super(BFInputDialog, self).__init__(parent)
        uic.loadUi(str(INPUT_UI_FILE), self)

    @property
    def value(self):
        if self.ascii_value.text().strip():
            return ord(self.ascii_value.text().strip())
        else:
            return self.byte_value.value()


class BFInterpreterGUI(QtWidgets.QMainWindow):

    def __init__(self):
        super(BFInterpreterGUI, self).__init__()
        uic.loadUi(str(MAIN_UI_FILE), self)
        self.progress = QtWidgets.QProgressBar(self)
        self.status.addPermanentWidget(self.progress)
        self.program_input.editingFinished.connect(self._load_program)
        self.btn_load.clicked.connect(self._load_program)
        self.btn_load_file.clicked.connect(self._load_file)
        self.btn_clear_tape.clicked.connect(self._clear_tape)
        self.btn_stop.clicked.connect(self._stop)
        self.btn_run.clicked.connect(self.run)
        self.btn_step.clicked.connect(self.step)
        self.delay_ms.valueChanged.connect(self._set_delay)
        self.tape.itemChanged.connect(self._tape_edited)
        self.tape.itemDoubleClicked.connect(self._user_change)
        self.timer = None
        self.code = ''
        self.commands = {
            '+': (self.bf_increment, 'INCREMENT'),
            '-': (self.bf_decrement, 'DECREMENT'),
            '>': (self.bf_move_right, 'MOVE RIGHT'),
            '<': (self.bf_move_left, 'MOVE LEFT'),
            ',': (self.bf_read, 'READ CHARACTER'),
            '.': (self.bf_write, 'WRITE CHARACTER'),
            '[': (self.bf_loop_start, 'LOOP START'),
            ']': (self.bf_loop_end, 'LOOP END'),
        }
        self._stack = []
        self.data = [0] * TAPE_START_SIZE
        self.pc = 0
        self.ptr = 0
        self.tape_changed_by_user = False
        self._old_value = None
        self.stop = False
        self.delay = 0

    def _show(self, message, timeout=5000):
        self.status.showMessage(message, timeout)

    def _set_delay(self, value):
        self.delay = value

    def _stop(self):
        self.stop = True

    def _load_file(self):
        filename, _ = QtWidgets.QFileDialog.getOpenFileName(
            self, 'Datei öffnen', '.', 'Brainfuck Quellen (*.b *.bf)'
        )
        if filename:
            with open(filename) as fp:
                source = fp.read().strip()
            self.program_input.setText(_strip(source, self.commands))

    def _clear_tape(self):
        self.data = [0] * TAPE_START_SIZE
        self._update_tape()

    def _update_tape(self):
        self.tape.clear()
        self.tape.setRowCount(2)
        self.tape.setColumnCount(len(self.data))
        labels = list(map(str, range(len(self.data))))
        self.tape.setHorizontalHeaderLabels(labels)
        self.tape.setVerticalHeaderLabels(['Inhalt', 'ASCII'])
        for i, value in enumerate(self.data):
            val_item = QtWidgets.QTableWidgetItem(str(value))
            val_item.setTextAlignment(QtCore.Qt.AlignCenter)
            self.tape.setItem(0, i, val_item)
            ascii_item = QtWidgets.QTableWidgetItem(chr(int(value)))
            ascii_item.setTextAlignment(QtCore.Qt.AlignCenter)
            self.tape.setItem(1, i, ascii_item)
        self.tape.resizeColumnsToContents()

    def _user_change(self, item):
        self._show('Geben Sie den neuen Wert ein und drücken sie Enter', 0)
        self._old_value = item.text()
        self.tape_changed_by_user = True

    def _tape_edited(self, item):
        if not self.tape_changed_by_user:
            return
        self.tape_changed_by_user = False
        print('Tape changed by user')
        column = item.column()
        if item.row() == 0:
            self._byte_changed(item, column)
        else:
            self._ascii_changed(item, column)
        self.tape.resizeColumnToContents(column)
        print('Reloading data')
        for col in range(self.tape.columnCount()):
            self.data[col] = int(self.tape.item(0, col).text())

    def _byte_changed(self, item, col):
        value = int(item.text())
        ascii_item = self.tape.item(1, col)
        old = ascii_item.text()
        ascii_item.setText(chr(value))
        self._show(
            f'Tape[{col}]: {self._old_value} (ASCII: {old}) '
            f'-> {value} (ASCII: {chr(value)})'
        )

    def _ascii_changed(self, item, col):
        ascii = item.text()
        val_item = self.tape.item(0, col)
        old = val_item.text()
        val_item.setText(str(ord(ascii)))
        self._show(
            f'Tape[{col}]: {old} (ASCII: {self._old_value}) '
            f'-> {val_item.text()} (ASCII: {ascii})'
        )

    def _load_program(self):
        self.code = self.program_input.text().strip()
        if not self.code:
            self._show('Kein Programm')
            return
        self.code = _strip(self.code, self.commands)
        if not self.code:
            self._show('Kein gültiges Programm')
        self.stop = False
        self._stack = []
        self.pc = 0
        self.ptr = 0
        self._load()
        self._clear_tape()
        for box in (self.output, self.stack, self.journal):
            box.clear()
        self.update_gui()

    def _load(self):
        self.program.clear()
        count = len(self.code)
        self.progress.reset()
        self.progress.setRange(0, count)
        self.program.setColumnCount(count)
        self.program.setRowCount(1)
        labels = list(map(str, range(1, count + 1)))
        self.program.setHorizontalHeaderLabels(labels)
        self.program.setVerticalHeaderLabels(['Code'])
        for i, command in enumerate(self.code):
            item = QtWidgets.QTableWidgetItem(command)
            item.setTextAlignment(QtCore.Qt.AlignCenter)
            self.program.setItem(0, i, item)
        self.program.resizeColumnsToContents()

    def update_gui(self):
        self.program.selectColumn(self.pc)
        self.tape.selectColumn(self.ptr)
        self.progress.setValue(self.pc)
        self.tape.item(0, self.ptr).setText(str(self.data[self.ptr]))
        self.tape.item(1, self.ptr).setText(chr(self.data[self.ptr]))
        self.tape.resizeColumnToContents(self.ptr)
        self.stack.clear()
        for addr in self._stack:
            self.stack.appendPlainText(str(addr))
        try:
            command = self.code[self.pc]
            text = f'{self.pc+1:04d} | {self.commands[command][1]}'
        except IndexError:
            text = 'PROGRAM END'
        self.journal.appendPlainText(text)
        if self.timer is not None and self.timer.isActive():
            if self.stop:
                self.timer.stop()
                self.timer = None
                return
            if self.timer.interval() != self.delay:
                self.timer.setInterval(self.delay)

    def run(self):
        if self.delay:
            self.timer = QtCore.QTimer(self)
            self.timer.timeout.connect(self.step)
            self.timer.start(self.delay)
        else:
            while self.pc < len(self.code) and not self.stop:
                self.step()

    def _check_tape(self):
        if self.ptr >= len(self.data):
            self.data.extend([0] * TAPE_EXTEND_SIZE)
            self._update_tape()

    def step(self):
        try:
            command = self.code[self.pc]
        except IndexError:
            self._show('Programm beendet')
            if self.timer is not None:
                self.timer.stop()
                self.timer = None
            return
        self.commands[command][0]()
        self.pc += 1
        self._check_tape()
        self.update_gui()

    # Brainfuck methods
    def bf_increment(self):
        self.data[self.ptr] += 1
        self.data[self.ptr] %= 256

    def bf_decrement(self):
        self.data[self.ptr] -= 1
        self.data[self.ptr] %= 256

    def bf_move_right(self):
        self.ptr += 1

    def bf_move_left(self):
        self.ptr -= 1

    def bf_read(self):
        dlg = BFInputDialog(self)
        if dlg.exec_() == QtWidgets.QDialog.Accepted:
            self.data[self.ptr] = dlg.value
        else:
            self.data[self.ptr] = 0

    def bf_write(self):
        out = chr(self.data[self.ptr])
        text = self.output.toPlainText()
        self.output.appendPlainText(f'{text}{out}')

    def bf_loop_start(self):
        if self.data[self.ptr] == 0:
            count = 0
            while True:
                command = self.code[self.pc]
                if command == '[':
                    count += 1
                elif command == ']':
                    count -= 1
                if not count:
                    break
                self.pc += 1
        else:
            self._stack.append(self.pc)

    def bf_loop_end(self):
        if self.data[self.ptr] != 0:
            self.pc = self._stack.pop() - 1
        else:
            self._stack.pop()


def main():
    app = QtWidgets.QApplication(sys.argv)
    window = BFInterpreterGUI()
    window.show()
    sys.exit(app.exec_())


if __name__ == '__main__':
    main()
