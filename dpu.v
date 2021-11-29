
//dpu
module dpu
#(parameter DATA_WIDTH = 8)
(rst_n,
enable,
data_out_sum,
data_in_a,
data_in_b,
data_out_a,
data_out_b,
clk
);



input [DATA_WIDTH-1:0] data_in_a;
input [DATA_WIDTH-1:0] data_in_b;
input enable;
input clk;
input rst_n;

output reg [DATA_WIDTH-1:0]data_out_sum = 0;
output reg [DATA_WIDTH-1:0]data_out_a = 0;
output reg [DATA_WIDTH-1:0]data_out_b = 0;

always @(posedge clk) begin
	if (!rst_n) begin
		data_out_sum <= 8'b0;
		data_out_b <= 8'b0;
		data_out_a <= 8'b0;
	end //if
	else if(enable) begin
		data_out_sum[DATA_WIDTH-1:0] <= data_out_sum[DATA_WIDTH-1:0] + ( data_in_a[DATA_WIDTH-1:0] * data_in_b[DATA_WIDTH-1:0] ) ;
		data_out_b[DATA_WIDTH-1:0] <= data_in_b[DATA_WIDTH-1:0];
		data_out_a[DATA_WIDTH-1:0] <= data_in_a[DATA_WIDTH-1:0];
	end // if
	else if(!enable) begin
		data_out_sum[DATA_WIDTH-1:0] <= 0;
		data_out_b[DATA_WIDTH-1:0] <= 0;
		data_out_a[DATA_WIDTH-1:0] <= 0;
	end
end //always

endmodule