module labM4;
reg [31:0] address, memIn;
reg clk, read, write;
wire [31:0] memOut;
mem data(memOut, address, memIn, clk, read, write); integer i;

initial
     begin

	clk =0;
	address = 16;
	memIn = 32'h12345678;
	write =1;
	clk =1;
	#5;
	clk =0;
	address = 24;
	memIn = 32'h89abcdef;
	clk =1;
	#5;

	write = 0; read = 1; address = 16;
	repeat (3)
	begin
 		#1 $display("Address %d contains %h", address, memOut);
 		address = address + 4;
	end
	$finish;
     end 

endmodule 
