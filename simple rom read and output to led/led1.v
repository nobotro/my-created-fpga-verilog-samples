

module led1(
	input clk,
 
	output[3:0] led
	);
	
	 
	 
	reg[3:0] rom[0:4];
	integer counter=0;
	integer counter2=0;
	
	
	initial begin
	$readmemb("rom.txt", rom);
	end
	
//	  rom c(
//	  .address(addr),
//	  .clock(clk),
//	  .q(line));
//	
	 
	always @(posedge clk) begin
	

	
	  if(counter==25000000)begin
	  
	  
	  counter=0;
	  counter2=counter2+1;
	  
	  
	  end
	  counter=counter+1;
	 
	  
	end
	
	  assign led=rom[counter2%5];
		 
	
                           
endmodule

