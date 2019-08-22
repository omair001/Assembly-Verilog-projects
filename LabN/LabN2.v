module labN;

 reg[31:0] entryPoint;
 reg  clk,  INT ;
 reg [2:0] op;
 wire [31:0] wd, rd1, rd2, imm, ins, PCp4, z, memOut, wb, PCin;
 wire [25:0] jTarget;
 wire zero, ALUSrc, MemRead, MemWrite, Mem2Reg, RegDst, RegWrite, jump, branch ;
 
 yIF myIF(ins, PCp4, PCin, clk);
 yID myID(rd1, rd2, imm, jTarget, ins, wd, RegDst, RegWrite, clk);
 yEX myEx(z, zero, rd1, rd2, imm, op, ALUSrc);
 yDM myDM(memOut, z, rd2, clk, MemRead, MemWrite);
 yWB myWB(wb, z, memOut, Mem2Reg);
 yPC myPC(PCin, PCp4,INT,entryPoint,imm,jTarget,zero,branch,jump);
 assign wd = wb;
 yC1 myC1(rtype, lw, sw, jump, branch, opCode);
 yC2 myC2(RegDst, ALUSrc, RegWrite, Mem2Reg, MemRead, MemWrite,
 rtype, lw, sw, branch);

initial
begin
 //------------------------------------Entry point
 entryPoint = 128; INT = 1; #1;


 //------------------------------------Run program
 repeat (43)
 begin
 //---------------------------------Fetch an ins
 clk = 1;
 #1; 
 INT = 0;

 //---------------------------------Set control signals
op = 3'b010;
 if (ins[31:26] == 0) //r type
   begin         
      else if(ins[5:0] == 'h22)//sub
     	 op = 2;
      else if (ins[5:0] == 'h25)//or
         op = 3'b001;
      else if (ins[5:0] == 36) // and
	 op = 0;
	 
   end
 


 //---------------------------------Execute the ins
 clk = 0; #1;

 //---------------------------------View results
$display("%h: rd1=%2d rd2=%2d z=%3d zero=%b wb=%2d",
                      ins, rd1, rd2, z, zero, wb);




 end
 $finish;
end
endmodule 
