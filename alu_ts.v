`timescale 1ns / 1ps
`include "alu.v"
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:23:16 10/13/2021
// Design Name:   alu
// Module Name:   D:/Verilogprogram/alu/alu_ts.v
// Project Name:  alu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
// $monitor("a=%b, b=%b, y=%b", a, b, y);
//     $dumpfile("and2.vcd");  // 导出vcd文件
//     $dumpvars(0, and2_tb);  // 导出and2_tb模块中的所有变量
//     a = 0; b = 0; #10;
//     a = 0; b = 1; #10;
//     a = 1; b = 0; #10;
//     a = 1; b = 1; #10;
//     $finish;
module alu_ts;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;
	reg Cin;
	reg [4:0] Card;

	// Outputs
	wire [31:0] F;
	wire Cout;
	wire Zero;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.A(A), 
		.B(B), 
		.Cin(Cin), 
		.Card(Card), 
		.F(F), 
		.Cout(Cout), 
		.Zero(Zero)
	);

	initial begin
		$monitor("A=%b, B=%b, Cin=%b,Card=%b,F=%d,Cout=%d,Zero=%d", A, B, Cin,Card,F,Cout,Zero);
	    $dumpfile("alu.vcd");  // 导出vcd文件
		$dumpvars(0, alu_ts);  // 导出and2_tb模块中的所有变量
		// Initialize Inputs
		Card=5'b00001;
		A=(1<<<32)-1;
		B=1;
		Cin=1;
		// Wait 100 ns for global reset to finish  op2
		#10;
		Card=5'b00010;
		A=(1<<<32)-1;
		B=1;
		// Wait 100 ns for global reset to finish  op3
		#10;
		Card=5'b00011;
		A=(1<<<32)-1;
		B=1;
		// Wait 100 ns for global reset to finish  op4
		#10;
		Card=5'b00100;
		A=(1<<<32)-1;
		B=1;
		// Wait 100 ns for global reset to finish  op5
		#10;
		Card=5'b00101;	
		A=(1<<<32)-1;
		B=1;		
		// Wait 100 ns for global reset to finish  op6
		#10;
		Card=5'b00110;
		A=(1<<<32)-1;
		B=1;
		// Wait 100 ns for global reset to finish  op7
		#10;
		Card=5'b00111;
		A=(1<<<32)-1;
		B=1;	
		// Wait 100 ns for global reset to finish  op8
		#10;
		Card=5'b01000;
		A=(1<<<32)-1;
		B=1;	
		// Wait 100 ns for global reset to finish  op9
		#10;
		Card=5'b01001;
		A=(1<<<32)-1;
		B=1;	
		// Wait 100 ns for global reset to finish  op10
		#10;
		Card=5'b01010;
		A=(1<<<32)-1;
		B=1;		
		// Wait 100 ns for global reset to finish  op11
		#10;
		Card=5'b01011;
		A=(1<<<32)-1;
		B=1;		
		// Wait 100 ns for global reset to finish  op12
		#10;
		Card=5'b01100;
		A=(1<<<32)-1;
		B=1;	
		// Wait 100 ns for global reset to finish  op13
		#10;
		Card=5'b01101;
		A=(1<<<32)-1;
		B=1;	
		// Wait 100 ns for global reset to finish  op14
		#10;
		Card=5'b01110;
		A=(1<<<32)-1;
		B=1;		
		// Wait 100 ns for global reset to finish  op15
		#10;
		Card=5'b01111;
		A=(1<<<32)-1;
		B=1;	
		// Wait 100 ns for global reset to finish  op16
		#10;
		Card=5'b10000;
		A=(1<<<32)-1;
		B=1;	
		#10;	
		$finish;
    end
      
endmodule

