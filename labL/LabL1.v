module LabL1;
reg a1, b1, c1, expect, expect1, expect2;
wire z1;
integer i, j, k;
	yMux1 n (.z(z1), .a(a1), .b(b1), .c(c1));
   
   	initial

	begin
	  a1 = 1; b1 = 0; c1 = 0; 
	 #1; 
	// #10 $display("notC = %b, andOneOutput = %b, andTwoOutput = %b, z = %b", andOneInput, andOneOutput, andTwoOutput, z);
	  #10 $display("a = %b, b = %b, c = %b, z = %b", a1, b1, c1, z1);
	for (i = 0; i < 2; i = i + 1)
	   begin
		  for (j = 0; j < 2; j = j + 1)
		  begin
			for (k = 0; k < 2; k = k + 1)
			begin
				a1 = i; b1 = j; c1 = k;
				expect1 = i & ~c1;
				expect2 = j & c1;
				expect =  expect1 | expect2; 
				#1; // wait for z
				if (expect === z1)
					$display("PASS: a=%b b=%b c=%b z=%b", a1, b1, c1, z1);
				else
					$display("FAIL: a=%b b=%b c=%b z=%b", a1, b1, c1, z1);
			end
		  end
	   end
	  $finish;
	end
	

endmodule