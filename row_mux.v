//==================================================================
// Systolic_Array_top module
//==================================================================
module row_mux
	#(parameter DATA_WIDTH = 32, DATA_SIZE = 8, DIM_SIZE = 4)
	(i0,
	 i1,
	 i2,
	 i3,
	 i4,
	 i5,
	 i6,
	 i7,
	 i8,
	 i9,
	 sel,
	 ena,
	 out); // port list
	
	//==================================================================
	// Declarations
	//==================================================================
	
	// I/O declarations
	input wire [DATA_WIDTH-1:0]i0; // 
	input wire [DATA_WIDTH-1:0]i1; // 
	input wire [DATA_WIDTH-1:0]i2; //
	input wire [DATA_WIDTH-1:0]i3; //
	input wire [DATA_WIDTH-1:0]i4; // 
	input wire [DATA_WIDTH-1:0]i5; // 
	input wire [DATA_WIDTH-1:0]i6; // 
	input wire [DATA_WIDTH-1:0]i7; // 
	input wire [DATA_WIDTH-1:0]i8; // 
	input wire [DATA_WIDTH-1:0]i9; // 
	input wire [3:0]sel; //write enable
	input wire ena; //write enable

	
	output reg [DATA_WIDTH-1:0]out; // done bit
	// end I/O declarations
	
	// inner wiring declarations

	// end inner wiring declarations
	
	//inner registers declarations

	initial begin
		
		out[DATA_WIDTH-1:0] = 0;
		
		
	end 
	
	//end inner registers declarations
	//assign initial values

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
	
	always @ * begin
		case (sel)
		4'b0000: 
			out = i0;
		4'b0001 :
			out = i1;
		4'b0010: 
			out = i2;
		4'b0011 :
			out = i3;
		4'b0100: 
			out = i4;
		4'b0101 :
			out = i5;
		4'b0110: 
			out = i6;
		4'b1000 :
			out = i7;
		4'b1001 :
			out = i8;
		4'b1010 :
			out = i9;
		endcase
		if (!ena) begin
			out = 0;
		end
	end	
	//==================================================================
	// End Structural Behavior
	//==================================================================	

endmodule
//==================================================================
// End Systolic_Array_top module
//==================================================================