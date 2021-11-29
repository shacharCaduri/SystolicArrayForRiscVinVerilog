//==================================================================
// Systolic_Array_top module
//==================================================================
module systolic_array_controller
	#(parameter DATA_WIDTH = 32, DATA_SIZE = 8, DIM_SIZE = 4)
	(clk,
	 rst_n,
	 sys_arr_ena,
	 clk_count,
	 go_bit,	 
     done_bit); // port list
	
	//==================================================================
	// Declarations
	//==================================================================
	
	// I/O declarations


	input wire clk; // clock
	input wire rst_n; //Async reset
	
	input wire go_bit; //go bit from riskv
	
	output reg [3:0]clk_count;
	input wire done_bit;
	output reg sys_arr_ena; //enable to systolic array
	// end I/O declarations
	
	// inner wiring declarations

	// end inner wiring declarations
	
	//inner registers declarations

	
	//end inner registers declarations
	
	//assign initial values
	initial begin
		
		sys_arr_ena = 0;
		
		clk_count[3:0] = 0;
		
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
	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) begin
			 clk_count[3:0] <= 4'b0000; 
			 sys_arr_ena <= 0;
		end//end if rst_n
		else begin
			if(go_bit && sys_arr_ena==0 && done_bit == 0) begin
				sys_arr_ena <= 1;
				clk_count[3:0] <= 4'b0000;
			end
			else if	(sys_arr_ena) begin
				clk_count <= clk_count+1;
			end
			if (done_bit) begin
				sys_arr_ena <= 0;
				clk_count[3:0] <= 4'b0000;
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