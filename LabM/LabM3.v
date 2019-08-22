module labM3;
reg [31:0] wd;
reg [4:0] rn1, rn2, wn;
reg clk, w, flag;
wire [31:0] rd1, rd2;
rf myRF(rd1, rd2, rn1, rn2, wn, wd, clk, w);

integer i;
initial
     begin
       flag = $value$plusargs("w=%b", w);
	for (i = 0; i < 32; i = i + 1)
	begin
 		clk = 0;
 		wd = i * i;
 		wn = i;
 		clk = 1;
		 #1;
	end         


       

        repeat(10)
          begin
             #5 rn1 = $random;
	     #5 rn2 = $random;
	     #2;
 	     $display("%5d: clk=%b, rn1=%d, rn2=%d, rd1=%d, rd2=%d", $time, clk, rn1, rn2, rd1, rd2);
          end

        $finish;
     end

   always
     begin
        #5 clk = ~clk;
     end


endmodule 
