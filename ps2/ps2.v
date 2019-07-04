module ps2(

input ps2_clk,
input ps2_data,
output[3:0] led

);

reg[7:0] data;
reg[7:0] data2;
reg skip=1'b0;
integer counter=0;
integer counter2=0;

always @(negedge ps2_clk)begin

  if(counter!=10)begin
		  if(counter>0 && counter<8)begin
		  
				
				
				data2[counter2]=ps2_data;
				counter2=counter2+1;
				
			end
			

		 
				counter<=counter+1;
	end
	else begin
	  counter=0;
	  counter2=0;
	  data=data2;
	  data2=8'b0;
	 end
	
		
end
		  
    
	

assign led=data;



endmodule