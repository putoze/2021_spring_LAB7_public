//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
//   (C) Copyright Laboratory System Integration and Silicon Implementation
//   All Right Reserved
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   2020 ICLAB FALL Course
//   Lab03       : Testbench and Pattern
//   Author      : Yi-Ting Wang
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   File Name   : PATTERN.v
//   Module Name : PATTERN  
//   Release version : v1.0
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################
`define RTL
`ifdef RTL
	`timescale 1ns/1ps
	`include "PN.v"
	`define CYCLE_TIME_clk1 19
	`define CYCLE_TIME_clk2 6
	`define CYCLE_TIME_clk3 11
`endif
`ifdef GATE
	`timescale 1ns/1ps
	`include "Netlist/PN_SYN.v"
	`define CYCLE_TIME_clk1 19
	`define CYCLE_TIME_clk2 6
	`define CYCLE_TIME_clk3 11
`endif


module PATTERN(
    // Output signals
	clk_1,
	clk_2,
	clk_3,
    rst_n,
	in_valid,
	in,
	mode,
	operator,

    // Input signals
    out_valid,
    out
);



//================================================================ 
//   INPUT AND OUTPUT DECLARATION
//================================================================
output reg clk_1, clk_2, clk_3, rst_n, in_valid, mode, operator;
output reg [2:0] in;
input out_valid;
input [63:0] out;
 
//================================================================
// parameters & integer
//================================================================
real	CYCLE_1 = `CYCLE_TIME_clk1;
always	#(CYCLE_1/2.0) clk_1 = ~clk_1;

real	CYCLE_2 = `CYCLE_TIME_clk2;
always	#(CYCLE_2/2.0) clk_2 = ~clk_2;

real	CYCLE_3 = `CYCLE_TIME_clk3;
always	#(CYCLE_3/2.0) clk_3 = ~clk_3;
//================================================================
// wire & registers 
//================================================================
reg [63:0] gold;
integer i,j,k,l,y,lat,total_latency, h, s;
integer PATNUM=1005;
integer seed = 333;
integer input_file,output_file, op_file;
integer patcount;
integer output_counter, out_vaild_count;
//================================================================
// clock
//================================================================

//================================================================
// initial
//================================================================
initial begin
	force clk_1 = 1'b0;
	force clk_2 = 1'b0;
	force clk_3 = 1'b0;
	rst_n = 1'b1;
	in_valid = 1'b0;
	mode = 'bx;
	operator = 'bx;
	
	
	#(CYCLE_1);
	// rst_n = 1'b0;
	// #(5*CYCLE_1);
	// rst_n = 1'b1;
	// #(CYCLE_1);


	total_latency = 0; 
	reset_signal_task;

	input_file=$fopen("D:/IC_training/lab2020/LAB_7/input_.txt","r");
	op_file =$fopen("D:/IC_training/lab2020/LAB_7/op_.txt","r");
  	output_file=$fopen("D:/IC_training/lab2020/LAB_7/output_.txt","r");

	for(patcount=0;patcount<PATNUM;patcount=patcount+1)begin
        input_task;
        check_latency;
        check_out;
        check_output;
        $display("\033[0;34mPASS PATTERN NO.%4d,\033[m \033[0;32m Latency: %3d\033[m",
        patcount ,lat);
    end
    $finish;

end

//================================================================
// task
//================================================================
task reset_signal_task; begin 
    #(0.5);   rst_n=0;
	#(2.0);
	if((out_valid !== 0)||(out !== 4'b0)) begin
		$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
		$display ("                                                                     SPEC 3 FAIL!!                                                               ");
		$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
		// repeat(2) @(negedge clk_1);
		$finish;
	end
	#(10);   rst_n=1;
	#(3);
	release clk_1;
	release clk_2;
	release clk_3;
end endtask

integer gap;
integer number;
task input_task; begin
	gap = $urandom_range(1,5);
	// gap = 2;
	repeat(gap)@(negedge clk_1);
	in_valid = 1;
	s=$fscanf(input_file,"%d",number);
	for(j=0;j<number;j=j+1)begin
		k=$fscanf(input_file,"%d",in);
		h=$fscanf(op_file,"%d",operator);
		if(j===0) begin
			if (operator == 0)
				mode = 'b1;
			else
				mode = 'b0;
		end
		else begin
			mode = 'dx;
		end
		@(negedge clk_1);	
	end  
	in_valid = 0;
	in = 'dx;
end endtask

task in_valid_check_out_valid; begin
    while(in_valid==1) begin
        if(out_valid==1)begin
            $display ("--------------------------------------------------------------------------------------------------------------------------------------------");
            $display ("                                            Outvalid should be zero while invalid is 1                                                                ");
			$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
			repeat(2)@(negedge clk_1);
            $finish;
        end
    end
end endtask

task check_latency; begin
  lat = -1;
  while(!out_valid) begin
	lat = lat + 1;
//	$display("lat = %d",lat);
	if(lat == 1000) begin
		$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
		$display ("                                                                total_latency > 1000 cycle                                                                ");
		$display ("--------------------------------------------------------------------------------------------------------------------------------------------");

		repeat(2)@(negedge clk_1);
		$finish;
	end
	@(negedge clk_3);
  end
  total_latency = total_latency + lat;
end endtask

task check_out; begin
  while(!out_valid) begin
	if(out!==0)begin
		$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
		$display ("                                    out should be zero while Outvalid is 0                                                           ");
		$display ("--------------------------------------------------------------------------------------------------------------------------------------------");

		repeat(2)@(negedge clk_1);
		$finish;
	end
	@(negedge clk_3);
  end
end endtask

task check_output; begin
	output_counter=0;
	while(out_valid)
	begin
		if(output_counter>=2)
			begin
			    // out_valid_limit;
				$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
				$display("*             Outvalid is less than %d cycles at %8t             *", output_counter, $time);
				$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
				repeat(10) @(negedge clk_1);
				$finish;
			end
		l=$fscanf(output_file,"%d",gold);
		if(out!==gold)
				begin
					// fail;
					$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
					$display ("                                                                        FAIL!                                                               ");
					$display ("                                                                   PATTERN NO.%4d                                                           ",patcount);
					$display ("                                                     Ans: %d,  Your output : %d  at %8t                                             ",gold,out,$time);
					$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
					repeat(10) @(negedge clk_1);
					$finish;
				end
		$display("Ans: %d,  Your output : %d  PASS!!",gold ,out);
		@(negedge clk_3);
		output_counter=output_counter+1;
	end
	if(output_counter <1)
		begin
			// out_valid_limit;
			$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
			$display ("                                                                Outvalid is less than 1 cycles                                                                 ");
			$display ("--------------------------------------------------------------------------------------------------------------------------------------------");
			repeat(10) @(negedge clk_1);
			$finish;
		end
end endtask

endmodule

