
module segd(
input clk,
output reg[7:0] sg,
output reg[3:0] digclk=4'b0000

);


reg [7:0] digsegmap[0:9];



reg [3:0] state[0:3];
reg cary=1'b0;


integer counter2=0;
integer counter3=0;

initial begin

	digsegmap[0] <= 8'hc0; //"0"
	digsegmap[1] <= 8'hf9; //"1"
	digsegmap[2] <= 8'ha4; //"2"
	digsegmap[3] <= 8'hb0; //"3"
	digsegmap[4] <= 8'h99; //"4"
	digsegmap[5] <= 8'h92; //"5"
	digsegmap[6] <= 8'h82; //"6"
	digsegmap[7] <= 8'hf8; //"7"
	digsegmap[8] <= 8'h80; //"8"
	digsegmap[9] <= 8'h90; //"9"
	
end
 
 
 

 
 always @(posedge clk)begin
  counter3=counter3+1;
  if (counter3==19000000)
  begin
	  counter3=0;
	  
	  if(state[0]==9)begin
		  state[0]=0;
		  cary=1'b1;
		end
		
		else begin
		state[0]=state[0]+1'b1;
		end
		
		
		
	  if(state[1]==9 & cary)begin
		  state[1]=0;
		  cary=1'b1;
		end
		else begin
		state[1]=state[1]+cary;
		cary=0;
		end
		
		 if(state[2]==9 & cary)begin
		  state[2]=0;
		  cary=1'b1;
		end
		else begin
		state[2]=state[2]+cary;
		cary=0;
		end
		
		
		 if(state[3]==9 & cary)begin
		  state[3]=0;
		  cary=1'b1;
		end
		else begin
		state[3]=state[3]+cary;
		cary=0;
		end
		 
  
  end
  end
 
 
  
 always @(posedge clk)begin
 
 if (counter2<=5000)
 begin
 digclk=4'b1110;
 sg=digsegmap[state[0]];
 end
 
 
 else if (counter2>5000 &counter2<=10000)
 begin
 digclk=4'b1101;
 sg=digsegmap[state[1]];
 
 end
 
 else if (counter2>10000&counter2<=15000)
 begin
 digclk=4'b1011;
 sg=digsegmap[state[2]];
 
 end
 
 else if (counter2>15000&counter2<20000)
 begin
 digclk=4'b0111;
 sg=digsegmap[state[3]];
 
 end
 
 else if(counter2==20000)
 begin
 counter2=0;
 
 end
 
 
 counter2=counter2+1;
 
 
 

 end
 
 
 
 
 
 
endmodule