//==================================================================
// Systolic_Array_top module
//==================================================================
module tpu_top
	#(parameter DATA_WIDTH = 32, DATA_SIZE = 8, DIM_SIZE = 4)
	(clk,
	 rst_n,    
	 go_bit,
	 done_bit,
	 rowA0,rowA1,rowA2,rowA3,
	 colB0,colB1,colB2,colB3,
	 rowC0,rowC1,rowC2,rowC3); // port list
	
	//==================================================================
	// Declarations
	//==================================================================
	
	// I/O declarations
	input wire [DATA_WIDTH-1:0]rowA0,rowA1,rowA2,rowA3;
	input wire [DATA_WIDTH-1:0]colB0,colB1,colB2,colB3;
	input wire clk;
	input wire rst_n;
	input wire go_bit;
	
	output [DATA_WIDTH-1:0]rowC0,rowC1,rowC2,rowC3;
	
	output done_bit;
	// end I/O declarations
	
	// inner wiring declarations
	wire arr_ena;
	wire [3:0]clk_count;
	wire [DATA_WIDTH-1:0]acc_rowA,acc_rowB;
	wire [DATA_WIDTH-1:0]row_A0,row_A1,row_A2,row_A3,row_A4,row_A5,row_A6,row_A7,row_A8,row_A9;
	wire [DATA_WIDTH-1:0]row_B0,row_B1,row_B2,row_B3,row_B4,row_B5,row_B6,row_B7,row_B8,row_B9;
	// end inner wiring declarations
	
	//inner registers declarations
	
	//end inner registers declarations
	
	//assign initial values
	initial begin
		
		
		
	end 
	//end assigning initial values

	//==================================================================
	// End Declarations
	//==================================================================
	
	//==================================================================
	// Structural coding
	//==================================================================
	
	
	systolic_array_controller systolic_array_controller_inst(
		.clk(clk), //clock
		.rst_n(rst_n), //Async reset
		.sys_arr_ena(arr_ena), //enable for array sended by controller
		.clk_count(clk_count), //counter for num of clocks, sended as sel for the row muxes
		.go_bit(go_bit), //go_bit sended by tpu/processor
		.done_bit(done_bit) //done bit sended by controller		
	);
	
	systolic_array_top systolic_array_top_inst(
	 .rowA(acc_rowA),
	 .rowB(acc_rowB),
     .systolic_clk(clk),
     .rst_n(rst_n),    
	 .enable(arr_ena),
	 .clk_count(clk_count),	 
	 .reg_matrix_rowC0(rowC0),
	 .reg_matrix_rowC1(rowC1),
	 .reg_matrix_rowC2(rowC2),
	 .reg_matrix_rowC3(rowC3),
     .done(done_bit)
	 ); // port list
	
	row_mux row_mux_inst0(
		//the rows in order
		.i0(row_A0), 
		.i1(row_A1),
		.i2(row_A2),
		.i3(row_A3),
		.i4(row_A4),
		.i5(row_A5),
		.i6(row_A6),
		.i7(row_A7),
		.i8(row_A8),
		.i9(row_A9),
		.ena(arr_ena),
		.sel(clk_count), //counter for num of clocks, sended as sel for the row muxes
		.out(acc_rowA) //the row the enters the array
	);
	row_mux row_mux_inst1(
		//the rows in order
		.i0(row_B0),
		.i1(row_B1),
		.i2(row_B2),
		.i3(row_B3),
		.i4(row_B4),
		.i5(row_B5),
		.i6(row_B6),
		.i7(row_B7),
		.i8(row_B8),
		.i9(row_B9),
		.ena(arr_ena),
		.sel(clk_count), //counter for num of clocks, sended by controller
		.out(acc_rowB)//the row the enters the array
	);
	
	row_orginizer row_orginizer_inst0(
		.i0(rowA0),.i1(rowA1),.i2(rowA2),.i3(rowA3),
		.out0(row_A0),.out1(row_A1),.out2(row_A2),.out3(row_A3),.out4(row_A4),
		.out5(row_A5),.out6(row_A6),.out7(row_A7),.out8(row_A8),.out9(row_A9)
	);
	row_orginizer row_orginizer_inst1(
		.i0(colB0),.i1(colB1),.i2(colB2),.i3(colB3),
		.out0(row_B0),.out1(row_B1),.out2(row_B2),.out3(row_B3),.out4(row_B4),
		.out5(row_B5),.out6(row_B6),.out7(row_B7),.out8(row_B8),.out9(row_B9)
	);

	//==================================================================
	// End Structural coding
	//==================================================================
	
	
	//==================================================================
	// Structural Behavior
	//==================================================================
	//always @(posedge clk or negedge rst_n) begin
	//	if(!rst_n) begin
	//		done_bit <= 0;
	//		  
	//	end//end if rst_n
	//	else begin
	//		done_bit <= done;	
	//	end // end if rst_n == 1
	//end // end always
	//==================================================================
	// End Structural Behavior
	//==================================================================	

endmodule
//==================================================================
// End Systolic_Array_top module
//==================================================================