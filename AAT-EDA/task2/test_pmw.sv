//------------------------------------------------------------------------------
// File        : tb_pwm.sv
// Author      : <G Lepakshi /1BM23EC087 >
// Created     : <2026-01-30>
// Module      : tb_and_gate
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Simple testbench for PWM. Randomizes inputs and uses a
//               covergroup to measure input combination coverage.
//------------------------------------------------------------------------------
// Code your testbench here
// or browse Examples
module tb_pwm;
    logic clk=0, rst;
    logic [7:0] duty;
    logic pwm_out;

    pwm dut(.*);
    always #5 clk=~clk;

    covergroup pwm_cg @(posedge clk);
        coverpoint duty;
    endgroup
    pwm_cg cg = new();

    initial begin
        $dumpfile("pwm.vcd");
        $dumpvars;

        rst=1; duty=50; #10 rst=0;
        #100 duty=200;

        $display("Final Coverage=%0.2f %%", cg.get_inst_coverage());
        #50 $finish;
    end
endmodule
