/*
*
* Lab: LabM02
* Name: Syed Omair Anwar
* Student Number: 214729131
* EECS 2021
*
*/
module labM;
// reg declarations
reg [31:0] PCin;
reg RegDst, RegWrite, clk, ALUSrc, MemRead, MemWrite, Mem2Reg;
reg [2:0] op;
//wire declarations
wire [31:0] wd, rd1, rd2, imm, ins, PCp4, z, memOut, wb, imm1;
wire [25:0] jTarget, jTarget1;
wire zero;

//yIF, yID, yEX, yDM, yWb initializations
yIF myIF(ins, PCp4, PCin, clk);
yID myID(rd1, rd2, imm, jTarget, ins, wd, RegDst, RegWrite, clk);
yEX myEx(z, zero, rd1, rd2, imm, op, ALUSrc);
yDM myDM(memOut, z, rd2, clk, MemRead, MemWrite);
yWB myWB(wb, z, memOut, Mem2Reg);

// wire assignment, used wires for shift in part 10 of prelab
assign wd = wb, jTarget1= jTarget<<2, imm1 = imm << 2;


initial
begin
 //------------------------------------Entry point
 PCin = 128;

 //------------------------------------Run program
 repeat (43)
 begin
 //---------------------------------Fetch an ins
 clk = 1; #1;

 //---------------------------------Set control signals
 RegDst = 0; RegWrite = 0; ALUSrc = 1; op = 3'b010;
 if (ins[31:26] == 0) // this checks for an R type instruction to set control statements accordingly
   begin
      RegDst = 1; RegWrite = 1; ALUSrc = 0; MemRead =0; MemWrite = 0; Mem2Reg = 0;
      //checks for add or or instruction to ensure op value is correctly assigned
      if (ins[5:0] == 'h20)
         op = 3'b010;
      else if (ins[5:0] == 'h25)//or
         op = 3'b001;
   end
 else if (ins[31:26] == 'h2) //this checks for an J type instruction to set control statements accordingly
   begin
      RegDst = 0;RegWrite = 0; ALUSrc = 1; MemRead =0; MemWrite = 0; Mem2Reg = 0;
   end
else if (ins[31:26] == 'h4) //this checks for a beq instruction to set control statements accordingly 
   begin
       RegDst = 0;RegWrite = 0; ALUSrc = 0; MemRead =0; MemWrite = 0; Mem2Reg = 0;
   end
 else  if (ins[31:26] == 'h23) // this checks for a load word instruction to set control statements accordingly
   begin  
      RegDst = 0; RegWrite = 1; ALUSrc = 1; MemRead =1; MemWrite = 0; Mem2Reg = 1;
   end
 else if (ins[31:26] == 'h2b) //this checks for a store word instruction to set control statements accordingly
   begin
      RegDst = 0; RegWrite = 0; ALUSrc = 1; MemRead = 0; MemWrite = 1; Mem2Reg = 0;
   end
 else if (ins[31:26] == 'h8) //this checks for an add immediate instruction to set control statements accordingly
   begin
      RegDst = 0; RegWrite = 1; ALUSrc = 1; MemRead = 0; MemWrite = 0; Mem2Reg = 0;
   end
 //---------------------------------Execute the ins
 clk = 0; #1;

 //---------------------------------View results
 if (ins[31:26] == 'h2) // if instruction is a jump, write j followed by the jump target	
     begin		
        $display("j JTarget = %h", jTarget);		
     end

 else if (ins[31:26] == 0)// for R type instructions	
    begin		
       if (ins[5:0] == 'h24) //if instruction is an and, write add followed by rd1, rd2 and result		
       	begin		
          $display("and rd1 = %8h rd2 = %8h result = %8h", rd1, rd2, wb);	
   	end		
       else if (ins[5:0] == 'h20) ////if instruction is an add, write add followed by rd1, rd2 and result	
       begin		
   	  $display("add rd1 = %8h rd2 = %8h result = %8h", rd1, rd2, wb);		
       end	
 end		
		
				

 //---------------------------------Prepare for the next ins
 if (ins[31:26] == 'h4 && zero == 1)
	begin	
 PCin = PCp4 + imm1; // imm shifted by 2
end
else if (ins[31:26] == 'h2)
 PCin = jTarget1; // jtarget shifted by 2
else
 PCin = PCp4;

 end
 $finish;
end
endmodule 
