## Not implemented optimizations:

# Copy value in other cell(s)
# BF: [->+>+<<]
# mem[p+1] += mem[p];
# mem[p+2] += mem[p];
# mem[p] = 0;
reg = r'\[\-(\>\+)+(\<)+\]'

# Multiplication loops
# BF: [->+++>+++++++<<]
# mem[p+1] += mem[p] * 3;
# mem[p+2] += mem[p] * 7;
# mem[p] = 0;
reg = r'\[\-(\>\++)+(\<)+\]'

# Remove loops just after a loop (cell must be 0 to leave the first loop,
# second loop will never entered)
# BF: ][>+++>+++<<-]
reg = r'\](\[.+?\])'
