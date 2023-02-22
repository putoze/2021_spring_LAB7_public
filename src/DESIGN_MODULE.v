module CLK_1_MODULE(
/* ----------------------- Input signals ----------------------- */
	clk_1,
	clk_2,
	rst_n,
	in_valid,
	in,
	mode,
	operator,
/* ---------------------- Output signals ----------------------- */
	clk1_in_0,  clk1_in_1,  clk1_in_2,  clk1_in_3,  clk1_in_4,  clk1_in_5,  clk1_in_6,  clk1_in_7,  clk1_in_8,  clk1_in_9, 
	clk1_in_10, clk1_in_11, clk1_in_12, clk1_in_13, clk1_in_14, clk1_in_15, clk1_in_16, clk1_in_17, clk1_in_18, clk1_in_19,
	clk1_op_0,  clk1_op_1,  clk1_op_2,  clk1_op_3,  clk1_op_4,  clk1_op_5,  clk1_op_6,  clk1_op_7,  clk1_op_8,  clk1_op_9, 
	clk1_op_10, clk1_op_11, clk1_op_12, clk1_op_13, clk1_op_14, clk1_op_15, clk1_op_16, clk1_op_17, clk1_op_18, clk1_op_19,
	clk1_expression_0, clk1_expression_1, clk1_expression_2,
	clk1_operators_0, clk1_operators_1, clk1_operators_2,
	clk1_mode,
	clk1_control_signal,
	clk1_flag_0,  clk1_flag_1,  clk1_flag_2,  clk1_flag_3,  clk1_flag_4,  clk1_flag_5,  clk1_flag_6,  clk1_flag_7, 
	clk1_flag_8,  clk1_flag_9,  clk1_flag_10, clk1_flag_11, clk1_flag_12, clk1_flag_13, clk1_flag_14, clk1_flag_15, 
	clk1_flag_16, clk1_flag_17, clk1_flag_18, clk1_flag_19
);
//================================================================
//  INPUT AND OUTPUT DECLARATION                         
//================================================================		
/* ----------------------- Input signals ----------------------- */
// global signals
input clk_1, clk_2, rst_n;
// design
input in_valid, operator, mode;
input [2:0] in;
/* ---------------------- Output signals ----------------------- */
// in
output reg [2:0] clk1_in_0,  clk1_in_1,  clk1_in_2,  clk1_in_3,  clk1_in_4,  clk1_in_5,  clk1_in_6,  clk1_in_7,  clk1_in_8,  clk1_in_9, 
				 clk1_in_10, clk1_in_11, clk1_in_12, clk1_in_13, clk1_in_14, clk1_in_15, clk1_in_16, clk1_in_17, clk1_in_18, clk1_in_19;
// operatior
output reg clk1_op_0,  clk1_op_1,  clk1_op_2,  clk1_op_3,  clk1_op_4,  clk1_op_5,  clk1_op_6,  clk1_op_7,  clk1_op_8,  clk1_op_9, 
		   clk1_op_10, clk1_op_11, clk1_op_12, clk1_op_13, clk1_op_14, clk1_op_15, clk1_op_16, clk1_op_17, clk1_op_18, clk1_op_19;
// in (20 cycles)
output reg [59:0] clk1_expression_0, clk1_expression_1, clk1_expression_2;
// operator (20 cycles)
output reg [19:0] clk1_operators_0, clk1_operators_1, clk1_operators_2;
// mode
output reg clk1_mode;
// 
output reg [19:0] clk1_control_signal;
// a flag signal to inform CLK_2_MODULE that it can read input signal from CLK_1_MODULE.
output reg clk1_flag_0,  clk1_flag_1,  clk1_flag_2,  clk1_flag_3,  clk1_flag_4,  clk1_flag_5,  clk1_flag_6,  clk1_flag_7, 
	   	   clk1_flag_8,  clk1_flag_9,  clk1_flag_10, clk1_flag_11, clk1_flag_12, clk1_flag_13, clk1_flag_14, clk1_flag_15, 
	   	   clk1_flag_16, clk1_flag_17, clk1_flag_18, clk1_flag_19;
//================================================================
//  integer / genvar / parameter
//================================================================
integer i;
genvar idx;
//================================================================
//  Wire & Reg
//================================================================
reg in_valid_r, operator_r, mode_r;
reg [2:0] in_r;
reg is_finish_r;
// 
wire in_valid_w, operator_w, mode_w;
wire [2:0] in_w;
wire is_finish_w;
//================================================================
//  DESIGN                         
//================================================================
//---------------------------------------------------------------------
//   TA hint:
//	  Please write a synchroniser using syn_XOR or doubole flop synchronizer design in CLK_1_MODULE to generate a flag signal to inform CLK_2_MODULE that it can read input signal from CLK_1_MODULE.
//	  You don't need to include syn_XOR.v file or synchronizer.v file by yourself, we have already done that in top module CDC.v
//	  example:
//   syn_XOR syn_1(.IN(inflag_clk1),.OUT(clk1_flag_0),.TX_CLK(clk_1),.RX_CLK(clk_2),.RST_N(rst_n));             
//---------------------------------------------------------------------	
//================================================================
//  STEP 1 : Filter Unknown Value
//================================================================
always @(posedge clk_1 or negedge rst_n) begin
	if (!rst_n) 	in_valid_r <= 0 ;
	else 			in_valid_r <= in_valid ;
end
always @(posedge clk_1 or negedge rst_n) begin
	if (!rst_n) 			operator_r <= 0 ;
	else begin
		if (in_valid==1)	operator_r <= operator ;
		else 				operator_r <= 0 ;
	end
end
always @(posedge clk_1 or negedge rst_n) begin
	if (!rst_n) 			mode_r <= 0 ;
	else begin
		if (in_valid==1 && in_valid_r==0)	mode_r <= mode ;
		else 				mode_r <= 0 ;
	end
end
always @(posedge clk_1 or negedge rst_n) begin
	if (!rst_n) 			in_r <= 0 ;
	else begin
		if (in_valid==1)	in_r <= in ;
		else 				in_r <= 0 ;
	end
end
always @(posedge clk_1 or negedge rst_n) begin
	if (!rst_n) 			is_finish_r <= 0 ;
	else begin
		if (in_valid==0 && in_valid_r==1)	is_finish_r <= 1 ;
		else 				is_finish_r <= 0 ;
	end
end
//================================================================
//  STEP 2 : Double Flop (2-FF) Synchronizer
//================================================================
syn_XOR syn_in_valid( .IN(in_valid_r) , .OUT(in_valid_w) , .TX_CLK(clk_1) , .RX_CLK(clk_2) , .RST_N(rst_n) );
syn_XOR syn_operator( .IN(operator_r) , .OUT(operator_w) , .TX_CLK(clk_1) , .RX_CLK(clk_2) , .RST_N(rst_n) );
syn_XOR syn_mode( .IN(mode_r) , .OUT(mode_w) , .TX_CLK(clk_1) , .RX_CLK(clk_2) , .RST_N(rst_n) );
generate
for( idx=0 ; idx<3 ; idx=idx+1 )
	syn_XOR syn_in( .IN(in_r[idx]) , .OUT(in_w[idx]) , .TX_CLK(clk_1) , .RX_CLK(clk_2) , .RST_N(rst_n) );
endgenerate
syn_XOR syn_is_finish( .IN(is_finish_r) , .OUT(is_finish_w) , .TX_CLK(clk_1) , .RX_CLK(clk_2) , .RST_N(rst_n) );
//================================================================
//  STEP 3 : Output
//================================================================
always @(posedge clk_2 or negedge rst_n) begin
	if (!rst_n) 	clk1_flag_0 <= 0 ;
	else 			clk1_flag_0 <= in_valid_w ;
end

always @(posedge clk_2 or negedge rst_n) begin
	if (!rst_n)		clk1_op_0 <= 0 ;
	else 			clk1_op_0 <= operator_w ;
end

always @(posedge clk_2 or negedge rst_n) begin
	if (!rst_n) 	clk1_mode <= 0 ;
	else 			clk1_mode <= mode_w ;
end

always @(posedge clk_2 or negedge rst_n) begin
	if (!rst_n) 	clk1_in_0 <= 0 ;
	else 			clk1_in_0 <= in_w ;
end

always @(posedge clk_2 or negedge rst_n) begin
	if (!rst_n) 	clk1_flag_1 <= 0 ;
	else 			clk1_flag_1 <= is_finish_w ;
end

endmodule

module CLK_2_MODULE(// Input signals
			clk_2,
			clk_3,
			rst_n,
			clk1_in_0, clk1_in_1, clk1_in_2, clk1_in_3, clk1_in_4, clk1_in_5, clk1_in_6, clk1_in_7, clk1_in_8, clk1_in_9, 
			clk1_in_10, clk1_in_11, clk1_in_12, clk1_in_13, clk1_in_14, clk1_in_15, clk1_in_16, clk1_in_17, clk1_in_18, clk1_in_19,
			clk1_op_0, clk1_op_1, clk1_op_2, clk1_op_3, clk1_op_4, clk1_op_5, clk1_op_6, clk1_op_7, clk1_op_8, clk1_op_9, 
			clk1_op_10, clk1_op_11, clk1_op_12, clk1_op_13, clk1_op_14, clk1_op_15, clk1_op_16, clk1_op_17, clk1_op_18, clk1_op_19,
			clk1_expression_0, clk1_expression_1, clk1_expression_2,
			clk1_operators_0, clk1_operators_1, clk1_operators_2,
			clk1_mode,
			clk1_control_signal,
			clk1_flag_0, clk1_flag_1, clk1_flag_2, clk1_flag_3, clk1_flag_4, clk1_flag_5, clk1_flag_6, clk1_flag_7, 
			clk1_flag_8, clk1_flag_9, clk1_flag_10, clk1_flag_11, clk1_flag_12, clk1_flag_13, clk1_flag_14, 
			clk1_flag_15, clk1_flag_16, clk1_flag_17, clk1_flag_18, clk1_flag_19,
			
			// output signals
			clk2_out_0, clk2_out_1, clk2_out_2, clk2_out_3,
			clk2_mode,
			clk2_control_signal,
			clk2_flag_0, clk2_flag_1, clk2_flag_2, clk2_flag_3, clk2_flag_4, clk2_flag_5, clk2_flag_6, clk2_flag_7
			);
//---------------------------------------------------------------------
//   INPUT AND OUTPUT DECLARATION                         
//---------------------------------------------------------------------			
input clk_2, clk_3, rst_n;

input [2:0] clk1_in_0, clk1_in_1, clk1_in_2, clk1_in_3, clk1_in_4, clk1_in_5, clk1_in_6, clk1_in_7, clk1_in_8, clk1_in_9, 
	 	    clk1_in_10, clk1_in_11, clk1_in_12, clk1_in_13, clk1_in_14, clk1_in_15, clk1_in_16, clk1_in_17, clk1_in_18, clk1_in_19;
input clk1_op_0, clk1_op_1, clk1_op_2, clk1_op_3, clk1_op_4, clk1_op_5, clk1_op_6, clk1_op_7, clk1_op_8, clk1_op_9, 
  	  clk1_op_10, clk1_op_11, clk1_op_12, clk1_op_13, clk1_op_14, clk1_op_15, clk1_op_16, clk1_op_17, clk1_op_18, clk1_op_19;
input [59:0] clk1_expression_0, clk1_expression_1, clk1_expression_2;
input [19:0] clk1_operators_0, clk1_operators_1, clk1_operators_2;
input clk1_mode;
input [19 :0] clk1_control_signal;
input clk1_flag_0, clk1_flag_1, clk1_flag_2, clk1_flag_3, clk1_flag_4, clk1_flag_5, clk1_flag_6, clk1_flag_7, 
	  clk1_flag_8, clk1_flag_9, clk1_flag_10, clk1_flag_11, clk1_flag_12, clk1_flag_13, clk1_flag_14, 
	  clk1_flag_15, clk1_flag_16, clk1_flag_17, clk1_flag_18, clk1_flag_19;


output reg [63:0] clk2_out_0, clk2_out_1, clk2_out_2, clk2_out_3;
output reg clk2_mode;
output reg [8:0] clk2_control_signal;
output reg clk2_flag_0, clk2_flag_1, clk2_flag_2, clk2_flag_3, clk2_flag_4, clk2_flag_5, clk2_flag_6, clk2_flag_7;

//================================================================
//  Integer / genvar / parameter
//================================================================
integer i;
genvar idx;
//FSM
localparam IDLE    = 4'b0000;
localparam RD      = 4'b0001;
localparam OP_SR   = 4'b0010;  //search is_op/ load data_a_r data_b_r
localparam CAL     = 4'b0100;  //ALU
localparam DATA_WB = 4'b1000;
// 	operators
parameter OP_ADD = 3'b000 ;
parameter OP_SUB = 3'b001 ;
parameter OP_MUL = 3'b010 ;
parameter OP_ABS = 3'b011 ;
parameter OP_TWO = 3'b100 ;
//parameter
parameter  STATE = 4;
//================================================================
//  Reg & Wire
//================================================================
reg [18:0] op_addr_r;
reg signed [31:0] data_r [0:18];
reg [4:0] cnt;
reg [3:0] cnt_op;
reg [2:0] op_reg;
reg mode_r;
reg signed [31:0] data_a_r;
reg signed [31:0] data_b_r;
reg [STATE-1:0] current_state,next_state;
reg  signed [31:0] cal_result;
wire signed [31:0] add_result = data_a_r + data_b_r;
wire signed [31:0] sub_result = data_a_r - data_b_r;
reg  [31:0] data_out_r;
wire [31:0] data_out_w;
reg  out_valid_r;
wire out_valid_w;

//================================================================
//  flag
//================================================================
reg  is_op;
wire is_done = cnt_op == 'd0;

//================================================================
//  FSM
//================================================================
always @(posedge clk_2 or negedge rst_n) begin
	if (!rst_n) 	current_state <= IDLE ;
	else 			current_state <= next_state ;
end

always @(*) begin 
	case (current_state)
		IDLE:     next_state = RD;
		RD:       next_state = clk1_flag_1 ? OP_SR : RD;
		OP_SR:    next_state = is_op ? CAL : OP_SR;
		CAL:      next_state = DATA_WB;
		DATA_WB : next_state = is_done ? IDLE : OP_SR;
		default : next_state = IDLE;
	endcase
end

//================================================================
//  Design
//================================================================

//mode_r
always @(posedge clk_2 or negedge rst_n) begin 
	if(~rst_n) begin
		mode_r <= 0;
	end 
	else if(clk1_mode) begin
		mode_r <= 1;
	end
	else if(current_state == IDLE) begin
		mode_r <= 0;
	end
end

//is_op
always @(*) begin
	if(current_state[1]) begin
		is_op = op_addr_r[cnt] ? 1 : 0;
	end
	else begin
		is_op = 0;
	end
end

//op_addr_r
always @(posedge clk_2 or negedge rst_n) begin 
	if(~rst_n) begin
		op_addr_r <= 'd0;
	end 
	else begin
		if(clk1_flag_0) begin
			op_addr_r[cnt] <= clk1_op_0 ? 1 : 0;
		end
		else if(current_state == IDLE) begin
			op_addr_r <= 'd0;
		end
	end
end

//cnt
always @(posedge clk_2 or negedge rst_n) begin 
	if(~rst_n) begin
		cnt <= 'd0;
	end 
	else begin
		if(clk1_flag_0) begin
			cnt <= cnt + 1;
		end
		else if(clk1_flag_1) begin
			cnt <= mode_r ? 'd2 : cnt - 'd1; 
		end
		else if(current_state[1]) begin
			cnt <= mode_r ? cnt + 'd1 : cnt - 'd1; 
		end
		else if(current_state == IDLE) begin
			cnt <= 'd0;
		end
	end
end

//cnt_op
always @(posedge clk_2 or negedge rst_n) begin 
	if(~rst_n) begin
		cnt_op <= 'd0;
	end 
	else begin
		if(clk1_flag_0) begin
			cnt_op <= clk1_op_0 ? cnt_op + 1 : cnt_op;
		end
		else if(is_op) begin
			cnt_op <= cnt_op - 1;
		end
	end
end

//op_reg
always @(posedge clk_2 or negedge rst_n) begin 
	if(~rst_n) begin
		op_reg <= 'd0;
	end 
	else begin
		if(current_state[1]) begin
			op_reg <= data_r[cnt];
		end
	end
end

//data_r
always @(posedge clk_2 or negedge rst_n) begin 
	if(~rst_n) begin
		for(i=0;i<20;i=i+1) begin
			data_r[i] <= 32'd0;
		end
	end 
	else begin
		if(clk1_flag_0) begin
			data_r[cnt] <= clk1_in_0;
		end
		else if(current_state[3]) begin
			case (mode_r)
				1:
				begin
					data_r[cnt-1] <= data_a_r;
					for(i=0;i<17;i=i+1) begin
						if((i+3) < cnt) begin
							data_r[i+2] <= data_r[i];
						end
					end
				end
				default : 
				begin
					data_r[cnt+1] <= data_a_r;
					for(i=0;i<16;i=i+1) begin
						if((15-i) > cnt) begin
							data_r[16-i] <= data_r[18-i];
						end
					end
				end
			endcase
		end
		else if(current_state == IDLE) begin
			for(i=0;i<20;i=i+1) begin
				data_r[i] <= 32'd0;
			end
		end
	end
end

//data_a_r
always @(posedge clk_2 or negedge rst_n) begin 
	if(~rst_n) begin
		data_a_r <= 'd0;
	end 
	else begin
		if(current_state[1]) begin
			data_a_r <= mode_r ? data_r[cnt -2] : data_r[cnt + 1];
		end
		else if(current_state[2]) begin
			data_a_r <= cal_result;  //is_done will be output
		end
	end
end

//data_b_r
always @(posedge clk_2 or negedge rst_n) begin 
	if(~rst_n) begin
		data_b_r <= 'd0;
	end 
	else begin
		if(current_state[1]) begin
			data_b_r <= mode_r ? data_r[cnt - 1] : data_r[cnt + 2];
		end
	end
end

//cal_result
always @(*) begin 
	case (op_reg)
		OP_ADD : cal_result = add_result ;
		OP_SUB : cal_result = sub_result ;
		OP_MUL : cal_result = data_a_r * data_b_r ;
		OP_ABS : cal_result = (add_result >= 0) ? add_result : add_result*(-1) ;
		OP_TWO : cal_result = sub_result <<< 1 ;
		default :cal_result = 0 ;
	endcase
end

//================================================================
//  OUTPUT
//================================================================
//data_out_r
always @(posedge clk_2 or negedge rst_n) begin 
	if(~rst_n) begin
		data_out_r <= 'd0;
	end 
	else begin
		if(current_state[3] & is_done) begin
			data_out_r <= data_a_r;
		end
		else begin
			data_out_r <= 'd0;
		end
	end
end
//out_valid_r
always @(posedge clk_2 or negedge rst_n) begin 
	if(~rst_n) begin
		out_valid_r <= 0;
	end 
	else begin
		if(current_state[3] & is_done) begin
			out_valid_r <= 1;
		end
		else begin
			out_valid_r <= 0;
		end
	end
end

syn_XOR syn_out_valid( .IN(out_valid_r) , .OUT(out_valid_w) , .TX_CLK(clk_2) , .RX_CLK(clk_3) , .RST_N(rst_n) );

generate
for( idx=0 ; idx<32 ; idx=idx+1 )
	syn_XOR syn_out( .IN(data_out_r[idx]) , .OUT(data_out_w[idx]) , .TX_CLK(clk_2) , .RX_CLK(clk_3) , .RST_N(rst_n) );
endgenerate

always @(posedge clk_3 or negedge rst_n) begin
	if (!rst_n) 	clk2_flag_0 <= 0 ;
	else 			clk2_flag_0 <= out_valid_w ;
end
always @(posedge clk_3 or negedge rst_n) begin
	if (!rst_n)		clk2_out_0 <= 0 ;
	else 			clk2_out_0 <= { {32{data_out_w[31]}} , data_out_w } ;
end

endmodule



//---------------------------------------------------------------------
// DESIGN
//---------------------------------------------------------------------
//---------------------------------------------------------------------
//   TA hint:
//	  Please write a synchroniser using syn_XOR or doubole flop synchronizer design in CLK_2_MODULE to generate a flag signal to inform CLK_3_MODULE that it can read input signal from CLK_2_MODULE.
//	  You don't need to include syn_XOR.v file or synchronizer.v file by yourself, we have already done that in top module CDC.v
//	  example:
//   syn_XOR syn_2(.IN(inflag_clk2),.OUT(clk2_flag_0),.TX_CLK(clk_2),.RX_CLK(clk_3),.RST_N(rst_n));             
//---------------------------------------------------------------------	

module CLK_3_MODULE (// Input signals
			clk_3,
			rst_n,
			clk2_out_0,clk2_out_1,clk2_out_2,clk2_out_3,
			clk2_mode, 
			clk2_control_signal,
			clk2_flag_0,clk2_flag_1,clk2_flag_2,clk2_flag_3, 
            clk2_flag_4,clk2_flag_5,clk2_flag_6,clk2_flag_7,
			
			// Output signals
			out_valid,
			out
			);

input clk_3;
input rst_n;
input [63:0] clk2_out_0,clk2_out_1,clk2_out_2,clk2_out_3;
input clk2_mode;
input [8:0] clk2_control_signal;
input clk2_flag_0,clk2_flag_1,clk2_flag_2,clk2_flag_3,clk2_flag_4,clk2_flag_5,clk2_flag_6,clk2_flag_7;
			
			// Output signals
output reg out_valid;
output reg [63:0] out;

always @(posedge clk_3 or negedge rst_n) begin
	if (!rst_n) 	out_valid <= 0 ;
	else 			out_valid <= clk2_flag_0 ;
end
always @(posedge clk_3 or negedge rst_n) begin
	if (!rst_n) 				out <= 0 ;
	else begin
		if (clk2_flag_0==1)		out <= clk2_out_0 ;
		else 					out <= 0 ;
	end
end

endmodule


