module vga2(
input clk,

output wire[2:0] rgb,//vga rgb output
output wire vsync=1'b0,//vga vsync output
output wire hsync=1'b0////vga hsync output
);



reg vga_clk=0;//divided clk to 25mhz
reg[9:0] vertc=0;
reg[9:0] horc=0;



always @(posedge clk)begin
    vga_clk=~vga_clk;  //divide 50 mhz to 2=25mhz
 
end




//vga timings get from http://tinyvga.com/vga-timing/640x480@60Hz

//vsync must be 1 in "Sync pulse"	clock tange in vertical timings 
assign vsync = vertc> (480+10) && vertc <= (480 + 10 + 2);

//hsync must be 1 in Sync pulse	clock tange in hotizontal timings
assign hsync = horc > (640 + 16) && horc <= (640 + 16 + 96);



//pixel data must be writen when hitozontal and vertical clock counter is in that range(0,640),(0,480)
//if not in range, data must be blank
//3'b010 that data fill all screen to green
assign rgb=(horc<640 && vertc<480)?3'b010:3'b000; 




always @(posedge vga_clk) begin
      //clock counter for vertical and horizontal sync
		if (horc<799) begin
			 horc<=horc+1;
			end
		else begin
			  horc<=0;
			  if(vertc<524) begin
					vertc<=vertc+1;
				  end
			  else begin
					vertc<=0;
				    end   	
			 end	 
				
end








		





endmodule












