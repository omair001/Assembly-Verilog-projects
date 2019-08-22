module yAlu(z, ex, a, b, op);
input [31:0] a, b;
input [2:0] op;
output [31:0] z;
output ex;
assign slt = 0; // not supported
assign ex = 0; // not supported
// instantiate the components and connect them
// Hint: about 4 lines of code 