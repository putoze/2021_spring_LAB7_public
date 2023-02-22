//`include "synchronizer.v"
//`include "syn_XOR.v"
//`include "DESIGN_MODULE.v" 

module PN(
    //Input Port
    clk_1,
    clk_2,
    clk_3,
    rst_n,
	in_valid,
	in,
    mode,
    operator,

    //Output Port
    out_valid,
    out
    ); 

//-----------------------------------------------------------------------------------------------------------------
//   PORT DECLARATION                                                  
//-----------------------------------------------------------------------------------------------------------------
input            clk_1, clk_2, clk_3, rst_n, in_valid, mode, operator;
input [2:0]		 in;
output 		 out_valid;
output [63:0] out;

//-----------------------------------------------------------------------------------------------------------------
//   LOGIC DECLARATION                                                 
//-----------------------------------------------------------------------------------------------------------------

wire [2:0] clk1_in_0, clk1_in_1, clk1_in_2, clk1_in_3, clk1_in_4, clk1_in_5, clk1_in_6, clk1_in_7, clk1_in_8, clk1_in_9, 
		   clk1_in_10, clk1_in_11, clk1_in_12, clk1_in_13, clk1_in_14, clk1_in_15, clk1_in_16, clk1_in_17, clk1_in_18, clk1_in_19;
wire clk1_op_0, clk1_op_1, clk1_op_2, clk1_op_3, clk1_op_4, clk1_op_5, clk1_op_6, clk1_op_7, clk1_op_8, clk1_op_9, 
     clk1_op_10, clk1_op_11, clk1_op_12, clk1_op_13, clk1_op_14, clk1_op_15, clk1_op_16, clk1_op_17, clk1_op_18, clk1_op_19;
wire [59:0] clk1_expression_0, clk1_expression_1, clk1_expression_2;
wire [19:0] clk1_operators_0, clk1_operators_1, clk1_operators_2;
wire clk1_mode;
wire [19:0] clk1_control_signal;
wire clk1_flag_0, clk1_flag_1, clk1_flag_2, clk1_flag_3, clk1_flag_4, clk1_flag_5, clk1_flag_6, clk1_flag_7, 
	 clk1_flag_8, clk1_flag_9, clk1_flag_10, clk1_flag_11, clk1_flag_12, clk1_flag_13, clk1_flag_14, 
	 clk1_flag_15, clk1_flag_16, clk1_flag_17, clk1_flag_18, clk1_flag_19;

wire [63:0] clk2_out_0, clk2_out_1, clk2_out_2, clk2_out_3;
wire clk2_mode;
wire [8:0] clk2_control_signal;
wire clk2_flag_0, clk2_flag_1, clk2_flag_2, clk2_flag_3, clk2_flag_4, clk2_flag_5, clk2_flag_6, clk2_flag_7;

//-----------------------------------------------------------------------------------------------------------------
//   Design                                                            
//-----------------------------------------------------------------------------------------------------------------

///FSM//////FSM//////FSM//////FSM//////FSM//////FSM//////FSM//////FSM//////FSM//////FSM//////FSM//////FSM//////FSM///


CLK_1_MODULE M1(// Input signals
			.clk_1(clk_1),
			.clk_2(clk_2),
			.rst_n(rst_n),
			.in_valid(in_valid),
			.in(in),
			.mode(mode),
			.operator(operator),
			// Output signals,
			.clk1_in_0(clk1_in_0), .clk1_in_1(clk1_in_1), .clk1_in_2(clk1_in_2), .clk1_in_3(clk1_in_3), .clk1_in_4(clk1_in_4), 
            .clk1_in_5(clk1_in_5), .clk1_in_6(clk1_in_6), .clk1_in_7(clk1_in_7), .clk1_in_8(clk1_in_8), .clk1_in_9(clk1_in_9), 
            .clk1_in_10(clk1_in_10), .clk1_in_11(clk1_in_11), .clk1_in_12(clk1_in_12), .clk1_in_13(clk1_in_13), 
			.clk1_in_14(clk1_in_14), .clk1_in_15(clk1_in_15), .clk1_in_16(clk1_in_16), .clk1_in_17(clk1_in_17), 
			.clk1_in_18(clk1_in_18), .clk1_in_19(clk1_in_19),
			.clk1_op_0(clk1_op_0), .clk1_op_1(clk1_op_1), .clk1_op_2(clk1_op_2), .clk1_op_3(clk1_op_3), .clk1_op_4(clk1_op_4), 
            .clk1_op_5(clk1_op_5), .clk1_op_6(clk1_op_6), .clk1_op_7(clk1_op_7), .clk1_op_8(clk1_op_8), .clk1_op_9(clk1_op_9), 
            .clk1_op_10(clk1_op_10), .clk1_op_11(clk1_op_11), .clk1_op_12(clk1_op_12), .clk1_op_13(clk1_op_13), 
			.clk1_op_14(clk1_op_14), .clk1_op_15(clk1_op_15), .clk1_op_16(clk1_op_16), .clk1_op_17(clk1_op_17), 
			.clk1_op_18(clk1_op_18), .clk1_op_19(clk1_op_19),
			.clk1_expression_0(clk1_expression_0), .clk1_expression_1(clk1_expression_1), .clk1_expression_2(clk1_expression_2),
			.clk1_operators_0(clk1_operators_0), .clk1_operators_1(clk1_operators_1), .clk1_operators_2(clk1_operators_2),
			.clk1_mode(clk1_mode),
			.clk1_control_signal(clk1_control_signal),
			.clk1_flag_0(clk1_flag_0), .clk1_flag_1(clk1_flag_1), .clk1_flag_2(clk1_flag_2), .clk1_flag_3(clk1_flag_3), 
            .clk1_flag_4(clk1_flag_4), .clk1_flag_5(clk1_flag_5), .clk1_flag_6(clk1_flag_6), .clk1_flag_7(clk1_flag_7), 
            .clk1_flag_8(clk1_flag_8), .clk1_flag_9(clk1_flag_9), .clk1_flag_10(clk1_flag_10), .clk1_flag_11(clk1_flag_11), 
            .clk1_flag_12(clk1_flag_12), .clk1_flag_13(clk1_flag_13), .clk1_flag_14(clk1_flag_14), .clk1_flag_15(clk1_flag_15), 
            .clk1_flag_16(clk1_flag_16), .clk1_flag_17(clk1_flag_17), .clk1_flag_18(clk1_flag_18), .clk1_flag_19(clk1_flag_19)
			);
 
CLK_2_MODULE M2 (// Input signals
			.clk_2(clk_2),
			.clk_3(clk_3),
			.rst_n(rst_n),
			.clk1_in_0(clk1_in_0), .clk1_in_1(clk1_in_1), .clk1_in_2(clk1_in_2), .clk1_in_3(clk1_in_3), .clk1_in_4(clk1_in_4), 
            .clk1_in_5(clk1_in_5), .clk1_in_6(clk1_in_6), .clk1_in_7(clk1_in_7), .clk1_in_8(clk1_in_8), .clk1_in_9(clk1_in_9), 
            .clk1_in_10(clk1_in_10), .clk1_in_11(clk1_in_11), .clk1_in_12(clk1_in_12), .clk1_in_13(clk1_in_13), 
			.clk1_in_14(clk1_in_14), .clk1_in_15(clk1_in_15), .clk1_in_16(clk1_in_16), .clk1_in_17(clk1_in_17), 
			.clk1_in_18(clk1_in_18), .clk1_in_19(clk1_in_19),
			.clk1_op_0(clk1_op_0), .clk1_op_1(clk1_op_1), .clk1_op_2(clk1_op_2), .clk1_op_3(clk1_op_3), .clk1_op_4(clk1_op_4), 
            .clk1_op_5(clk1_op_5), .clk1_op_6(clk1_op_6), .clk1_op_7(clk1_op_7), .clk1_op_8(clk1_op_8), .clk1_op_9(clk1_op_9), 
            .clk1_op_10(clk1_op_10), .clk1_op_11(clk1_op_11), .clk1_op_12(clk1_op_12), .clk1_op_13(clk1_op_13), 
			.clk1_op_14(clk1_op_14), .clk1_op_15(clk1_op_15), .clk1_op_16(clk1_op_16), .clk1_op_17(clk1_op_17), 
			.clk1_op_18(clk1_op_18), .clk1_op_19(clk1_op_19),
			.clk1_expression_0(clk1_expression_0), .clk1_expression_1(clk1_expression_1), .clk1_expression_2(clk1_expression_2),
			.clk1_operators_0(clk1_operators_0), .clk1_operators_1(clk1_operators_1), .clk1_operators_2(clk1_operators_2),
			.clk1_mode(clk1_mode),
			.clk1_control_signal(clk1_control_signal),
			.clk1_flag_0(clk1_flag_0), .clk1_flag_1(clk1_flag_1), .clk1_flag_2(clk1_flag_2), .clk1_flag_3(clk1_flag_3), 
            .clk1_flag_4(clk1_flag_4), .clk1_flag_5(clk1_flag_5), .clk1_flag_6(clk1_flag_6), .clk1_flag_7(clk1_flag_7), 
            .clk1_flag_8(clk1_flag_8), .clk1_flag_9(clk1_flag_9), .clk1_flag_10(clk1_flag_10), .clk1_flag_11(clk1_flag_11), 
            .clk1_flag_12(clk1_flag_12), .clk1_flag_13(clk1_flag_13), .clk1_flag_14(clk1_flag_14), .clk1_flag_15(clk1_flag_15), 
            .clk1_flag_16(clk1_flag_16), .clk1_flag_17(clk1_flag_17), .clk1_flag_18(clk1_flag_18), .clk1_flag_19(clk1_flag_19),
			
			// output signals
			.clk2_out_0(clk2_out_0), .clk2_out_1(clk2_out_1), .clk2_out_2(clk2_out_2), .clk2_out_3(clk2_out_3),
			.clk2_mode(clk2_mode), 
			.clk2_control_signal(clk2_control_signal),
			.clk2_flag_0(clk2_flag_0), .clk2_flag_1(clk2_flag_1), .clk2_flag_2(clk2_flag_2), .clk2_flag_3(clk2_flag_3), 
            .clk2_flag_4(clk2_flag_4), .clk2_flag_5(clk2_flag_5), .clk2_flag_6(clk2_flag_6), .clk2_flag_7(clk2_flag_7)
			);

CLK_3_MODULE M3(// Input signals
			.clk_3(clk_3),
			.rst_n(rst_n),
			.clk2_out_0(clk2_out_0), .clk2_out_1(clk2_out_1), .clk2_out_2(clk2_out_2), .clk2_out_3(clk2_out_3),
			.clk2_mode(clk2_mode), 
			.clk2_control_signal(clk2_control_signal),
			.clk2_flag_0(clk2_flag_0), .clk2_flag_1(clk2_flag_1), .clk2_flag_2(clk2_flag_2), .clk2_flag_3(clk2_flag_3), 
            .clk2_flag_4(clk2_flag_4), .clk2_flag_5(clk2_flag_5), .clk2_flag_6(clk2_flag_6), .clk2_flag_7(clk2_flag_7),
			
			// Output signals
			.out_valid(out_valid),
			.out(out)
			);
endmodule