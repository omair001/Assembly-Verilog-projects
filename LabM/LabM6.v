module labM;
reg clk, read, write;
reg [31:0] address, memIn;
wire [31:0] memOut;
mem data(memOut, address, memIn, clk, read, write);
initial
  begin
     
     address = 128; write = 0; read = 1;
     repeat (11)

 	 #2           

	   if (memOut[31:26] == 0)
               $display("%0d %0d %0d %0d %0d", memOut[31:26], memOut[25:21], memOut[20:16], memOut[15:11], memOut[5:0]);
             else if (memOut[31:26] == 2)
               $display("%0d %0d", memOut[31:26], memOut[25:0]);
             else
               $display("%0d %0d %0d %0d", memOut[31:26], memOut[25:21], memOut[20:16], memOut[15:0]);
     $finish;
  end

endmodule