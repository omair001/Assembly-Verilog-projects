module Lab2L;

reg [1:0] a1, b1, expect, expect1, expect2;
reg c1;
wire [1:0]z1;
integer i, j, k, x;
yMux #(.SIZE(2)) my_mux(z1, a1, b1, c1); 

initial

	begin
	//  a1 = 1; b1 = 0; c1 = 0; 
	 #1; 
	// #10 $display("notC = %b, andOneOutput = %b, andTwoOutput = %b, z = %b", andOneInput, andOneOutput, andTwoOutput, z);
	  #10 $display("a = %b, b = %b, c = %b, z = %b", a1, b1, c1, z1);
	  x = 0;
	for (i = 0; i < 4; i = i + 1)
	   begin
		  for (j = 0; j < 4; j = j + 1)
		  begin
			for (k = 0; k < 2; k = k + 1)
			begin
				a1 = i; b1 = j; c1 = k;
				expect1[0] = i[0] & ~c1;
				expect2[0] = j[0] & c1;
				expect1[1] = i[1] & ~c1;
				expect2[1] = j[1] & c1;
				expect =  expect1 | expect2; 
				
				#1; // wait for z
				if (expect === z1)
					$display("PASS: a=%b b=%b c=%b z=%b x=%d", a1, b1, c1, z1, x);
				else
					$display("FAIL: a=%b b=%b c=%b z=%b", a1, b1, c1, z1);
				x = x+1;
			end
		  end
	   end
	  $finish;
	end


endmodule