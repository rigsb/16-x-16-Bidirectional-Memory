module tbm ();
reg [15:0] tiop;
reg [3:0] addr;
reg en;
integer i,j;
reg clk=1;
wire [15:0] op;

l4q4 tb1 (op,clk,en,addr);
assign op=en?tiop:16'bzzzzzzzzzzzzzzzz;

always 
begin
 #5;  clk=~clk;
end

initial
begin
en=1; addr=0; tiop=0; #9
for (i=1; i<16; i=i+1)
begin
addr=i; tiop=i; #10;
end

tiop=16'bzzzzzzzzzzzzzzzz; #0                                                                                                                                                                                                                                                                                                                                                                          
en=0; addr=0; #9
for (j=1; j<16; j=j+1)
begin
addr=j; #10;  
end
end
endmodule