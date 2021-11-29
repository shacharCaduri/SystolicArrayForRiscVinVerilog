//==================================================================
// Systolic_Array_top module
//==================================================================
module row_orginizer
	#(parameter DATA_WIDTH = 32, DATA_SIZE = 8, DIM_SIZE = 4)
	(i0,i1,i2,i3,
	 out0,out1,out2,out3,out4,out5,out6,out7,out8,out9); // port list
	
	//==================================================================
	// Declarations
	//==================================================================
	
	// I/O declarations
	input wire [DATA_WIDTH-1:0]i0,i1,i2,i3; // 
	output reg [DATA_WIDTH-1:0]out0,out1,out2,out3,out4,out5,out6,out7,out8,out9; //write enable

	
	// end I/O declarations
	
	// inner wiring declarations

	// end inner wiring declarations
	
	//inner registers declarations

	
	
	//end inner registers declarations
	//assign initial values
	initial begin
		
		out0[DATA_WIDTH-1:0] = 0;
		out1[DATA_WIDTH-1:0] = 0;
		out2[DATA_WIDTH-1:0] = 0;
		out3[DATA_WIDTH-1:0] = 0;
		out4[DATA_WIDTH-1:0] = 0;
		out5[DATA_WIDTH-1:0] = 0;
		out6[DATA_WIDTH-1:0] = 0;
		out7[DATA_WIDTH-1:0] = 0;
		out8[DATA_WIDTH-1:0] = 0;
		out9[DATA_WIDTH-1:0] = 0;
		
		
	end 
	//end assigning initial values

	//==================================================================
	// End Declarations
	//==================================================================
	
	//==================================================================
	// Structural coding
	//==================================================================

	//==================================================================
	// End Structural coding
	//==================================================================
	
	
	//==================================================================
	// Structural Behavior
	//==================================================================
	always @* begin
		out0 <= (i0[31:24]<<24);
		out1 <= (i0[23:16]<<24) + (i1[31:24]<<16);
		out2 <= (i0[15:8]<<24) + (i1[23:16]<<16) + (i2[31:24]<<8);
		out3 <= (i0[7:0]<<24) + (i1[15:8]<<16) + (i2[23:16]<<8) + i3[31:24];
		out4 <= (i1[7:0]<<16)+(i2[15:8]<<8) + i3[23:16];
		out5 <= (i2[7:0]<<8) + i3[15:8];
		out6 <= i3[7:0];
	end
		
	//==================================================================
	// End Structural Behavior
	//==================================================================	

endmodule
//==================================================================
// End Systolic_Array_top module
//==================================================================