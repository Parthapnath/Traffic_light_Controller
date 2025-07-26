module traffic_light_controller(input clk,rst,output reg rlight,ylight,glight);
parameter s1=4'b0000,s2=4'b0001,s3=4'b0010;
parameter sec5=5,sec15=15,sec20=20;
reg [4:0]state;
reg [4:0]count;
always@(clk or rst)begin
if(rst)begin
state<=0;
count<=0;
rlight<=0;
ylight<=0;
glight<=0;
end
else begin
case(state)
s1:begin
if(count<sec20)begin
state<=s1;
count<=count+1;
rlight<=1;
ylight<=0;
glight<=0;
end
else begin
state<=s2;
count<=0;
end
end
s2:begin
if(count<sec5)begin
state<=s2;
count<=count+1;
rlight<=0;
ylight<=1;
glight<=0;
end
else begin
state<=s3;
count<=0;
end
end
s3:begin
if(count<sec15)begin
state<=s3;
count<=count+1;
rlight<=0;
ylight<=0;
glight<=1;
end
else begin
state<=s1;
count<=0;
end
end
endcase
end
end
endmodule

//testbench

module traffic_light_controller_tb();
reg clk,rst;
wire rlight,ylight,glight;
traffic_light_controller kk(.clk(clk),.rst(rst),.rlight(rlight),.ylight(ylight),.glight(glight));
initial begin
clk=0;rst=1;#50;
rst=0;
end
always #25 clk=~clk;
always@(posedge clk)begin
$display("rlight=%0d  ylight=%0d  glight=%0d",rlight,ylight,glight);
end
endmodule
