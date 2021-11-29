//==================================================================
// Systolic_Array_top module
//==================================================================
module systolic_array_top
	#(parameter DATA_WIDTH = 32, DATA_SIZE = 8, DIM_SIZE = 4)
	(rowA,
	 rowB,
     systolic_clk,
     rst_n,    
	 enable,
	 clk_count,	 
	 reg_matrix_rowC0,
	 reg_matrix_rowC1,
	 reg_matrix_rowC2,
	 reg_matrix_rowC3,
     done); // port list
	
	//==================================================================
	// Declarations
	//==================================================================
	
	// I/O declarations
	input wire [DATA_WIDTH-1:0]rowA;
	input wire [DATA_WIDTH-1:0]rowB;
	input wire systolic_clk;
	input wire rst_n;
	input wire enable;
	input [3:0]clk_count;
	
	output reg [DATA_WIDTH-1:0]reg_matrix_rowC0;
	output reg [DATA_WIDTH-1:0]reg_matrix_rowC1;
	output reg [DATA_WIDTH-1:0]reg_matrix_rowC2;
	output reg [DATA_WIDTH-1:0]reg_matrix_rowC3;
	output reg done;
	
	// end I/O declarations
	
	// inner wiring declarations
	wire [DATA_SIZE-1:0]wire_sum_val [DIM_SIZE*DIM_SIZE-1:0]; // 16 registers with size of 8 bit each
	wire [DATA_SIZE-1:0]wire_out_a [DIM_SIZE*DIM_SIZE-1:0]; // 16 registers with size of 8 bit each
	wire [DATA_SIZE-1:0]wire_out_b [DIM_SIZE*DIM_SIZE-1:0]; // 16 registers with size of 8 bit each
	// end inner wiring declarations
	
	//inner registers declarations

	//end inner registers declarations
	
	//assign initial values
	initial begin
		
		reg_matrix_rowC0[DATA_WIDTH-1:0] = 0;
		reg_matrix_rowC1[DATA_WIDTH-1:0] = 0;
		reg_matrix_rowC2[DATA_WIDTH-1:0] = 0;
		reg_matrix_rowC3[DATA_WIDTH-1:0] = 0;
		done = 0;
		
	end 
	//end assigning initial values

	//==================================================================
	// End Declarations
	//==================================================================
	
	//==================================================================
	// Structural coding
	//==================================================================
	genvar i;
	generate
		for (i = 0 ; i < DIM_SIZE*DIM_SIZE ; i = i + 1) begin : dpu_inst
			case(i)
				0:	begin 
						dpu dpu_inst(
							.rst_n (rst_n),
							.enable (enable),
							.data_out_sum (wire_sum_val[i]),
							.data_in_a (rowA[31:24]),
							.data_in_b (rowB[31:24]),
							.data_out_a (wire_out_a[i]), // 1 byte wire for output of data_out_a of pe[i]
							.data_out_b (wire_out_b[i]), // 1 byte wire for output of data_out_b of pe[i]
							.clk (systolic_clk)
						);
					end // end case i%4
				4: 	begin
						dpu dpu_inst(
							.rst_n (rst_n),
							.enable (enable),
							.data_out_sum (wire_sum_val[i]),
							.data_in_a (rowA[23:16]),
							.data_in_b (wire_out_b[i-DIM_SIZE]),
							.data_out_a (wire_out_a[i]), // 1 byte wire for output of data_out_a of pe[i]
							.data_out_b (wire_out_b[i]), // 1 byte wire for output of data_out_b of pe[i]
							.clk (systolic_clk)
						);
					end
				8: 	begin
						dpu dpu_inst(
							.rst_n (rst_n),
							.enable (enable),
							.data_out_sum (wire_sum_val[i]),
							.data_in_a (rowA[15:8]),
							.data_in_b (wire_out_b[i-DIM_SIZE]),
							.data_out_a (wire_out_a[i]), // 1 byte wire for output of data_out_a of pe[i]
							.data_out_b (wire_out_b[i]), // 1 byte wire for output of data_out_b of pe[i]
							.clk (systolic_clk)
						);
					end
				12: begin
						dpu dpu_inst(
							.rst_n (rst_n),
							.enable (enable),
							.data_out_sum (wire_sum_val[i]),
							.data_in_a (rowA[7:0]),
							.data_in_b (wire_out_b[i-DIM_SIZE]),
							.data_out_a (wire_out_a[i]), // 1 byte wire for output of data_out_a of pe[i]
							.data_out_b (wire_out_b[i]), // 1 byte wire for output of data_out_b of pe[i]
							.clk (systolic_clk)
						);
					end
				1: 	begin
						dpu dpu_inst(
							.rst_n (rst_n),
							.enable (enable),
							.data_out_sum (wire_sum_val[i]),
							.data_in_a (wire_out_a[i-1]),
							.data_in_b (rowB[23:16]),
							.data_out_a (wire_out_a[i]), // 1 byte wire for output of data_out_a of pe[i]
							.data_out_b (wire_out_b[i]), // 1 byte wire for output of data_out_b of pe[i]
							.clk (systolic_clk)
						);
					end
				2: 	begin
						dpu dpu_inst(
							.rst_n (rst_n),
							.enable (enable),
							.data_out_sum (wire_sum_val[i]),
							.data_in_a (wire_out_a[i-1]),
							.data_in_b (rowB[15:8]),
							.data_out_a (wire_out_a[i]), // 1 byte wire for output of data_out_a of pe[i]
							.data_out_b (wire_out_b[i]), // 1 byte wire for output of data_out_b of pe[i]
							.clk (systolic_clk)
						);
					end
				3: 	begin
						dpu dpu_inst(
							.rst_n (rst_n),
							.enable (enable),
							.data_out_sum (wire_sum_val[i]),
							.data_in_a (wire_out_a[i-1]),
							.data_in_b (rowB[7:0]),
							.data_out_a (wire_out_a[i]), // 1 byte wire for output of data_out_a of pe[i]
							.data_out_b (wire_out_b[i]), // 1 byte wire for output of data_out_b of pe[i]
							.clk (systolic_clk)
						);
					end
				default: begin // all the other cells
							dpu dpu_inst(
								.rst_n (rst_n),
								.enable (enable),
								.data_out_sum (wire_sum_val[i]),
								.data_in_a (wire_out_a[i-1]), // because the one to the left is the i-1
								.data_in_b (wire_out_b[i-DIM_SIZE]), // because the one to his top is the i-4 in the array cause it is DIM_SIZE*DIM_SIZE array
								.data_out_a (wire_out_a[i]), // 1 byte wire for output of data_out_a of pe[i]
								.data_out_b (wire_out_b[i]), // 1 byte wire for output of data_out_b of pe[i]
								.clk (systolic_clk)
							);
						end
			endcase
		end // end for loop rows
	endgenerate // end generate
	//==================================================================
	// End Structural coding
	//==================================================================
	
	
	//==================================================================
	// Structural Behavior
	//==================================================================
	always @(posedge systolic_clk or negedge rst_n) begin
		if(!rst_n) begin
			reg_matrix_rowC0[DATA_WIDTH-1:0] = 0;
			reg_matrix_rowC1[DATA_WIDTH-1:0] = 0;
			reg_matrix_rowC2[DATA_WIDTH-1:0] = 0;
			reg_matrix_rowC3[DATA_WIDTH-1:0] = 0;
			done = 0;
		end//end if rst_n
		else begin
			if (clk_count == 3*DIM_SIZE - 2) begin
					reg_matrix_rowC0[DATA_SIZE-1:0] <= wire_sum_val[3];
					reg_matrix_rowC0[2*DATA_SIZE-1:DATA_SIZE] <= wire_sum_val[2]; 
					reg_matrix_rowC0[3*DATA_SIZE-1:2*DATA_SIZE] <= wire_sum_val[1];
					reg_matrix_rowC0[4*DATA_SIZE-1:3*DATA_SIZE] <= wire_sum_val[0];
					reg_matrix_rowC1[DATA_SIZE-1:0] <= wire_sum_val[7];
					reg_matrix_rowC1[2*DATA_SIZE-1:DATA_SIZE] <= wire_sum_val[6];
					reg_matrix_rowC1[3*DATA_SIZE-1:2*DATA_SIZE] <= wire_sum_val[5];
					reg_matrix_rowC1[4*DATA_SIZE-1:3*DATA_SIZE] <= wire_sum_val[4];
					reg_matrix_rowC2[DATA_SIZE-1:0] <= wire_sum_val[11];
					reg_matrix_rowC2[2*DATA_SIZE-1:DATA_SIZE] <= wire_sum_val[10];
					reg_matrix_rowC2[3*DATA_SIZE-1:2*DATA_SIZE] <= wire_sum_val[9];
					reg_matrix_rowC2[4*DATA_SIZE-1:3*DATA_SIZE] <= wire_sum_val[8];
					reg_matrix_rowC3[DATA_SIZE-1:0] <= wire_sum_val[15];
					reg_matrix_rowC3[2*DATA_SIZE-1:DATA_SIZE] <= wire_sum_val[14];
					reg_matrix_rowC3[3*DATA_SIZE-1:2*DATA_SIZE] <= wire_sum_val[13];
					reg_matrix_rowC3[4*DATA_SIZE-1:3*DATA_SIZE] <= wire_sum_val[12];
					done <= 1;
			end
			if (done) begin
				done <= 0;
			end
		end // end if rst_n == 1
	end // end always
	//==================================================================
	// End Structural Behavior
	//==================================================================	

endmodule
//==================================================================
// End Systolic_Array_top module
//==================================================================