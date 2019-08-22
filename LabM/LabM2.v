module labM;
reg clk, enable, flag;
reg [31:0] d;
wire [31:0] z;
register #(32) mine(z, d, clk, enable);

initial
     begin
        flag = $value$plusargs("enable=%b", enable);
        clk = 0;
        $monitor("%5d: clk=%b,d=%d,z=%d", $time, clk, d, z);

        repeat (20)
          begin
             #2 d = $random;
          end

        $finish;
     end

   always
     begin
        #5 clk = ~clk;
     end


endmodule 
