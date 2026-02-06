//------------------------------------------------------------------------------
// File        : tb_rcc.sv
// Author      : <G Lepakshi /1BM23EC087 >
// Created     : <2026-01-30>
// Module      : tb_and_gate
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Simple testbench for ripple carry countetr. Randomizes inputs and uses a
//               covergroup to measure input combination coverage.
//------------------------------------------------------------------------------

`timescale 1ns/1ps
module tb_ripple_counter;

    logic clk = 0;
    logic rst;
    logic [3:0] count;

    ripple_carry_counter dut (.*);

    always #5 clk = ~clk;

    // -------------------------
    // COVERAGE
    // -------------------------
    covergroup rc_cg @(posedge clk);

        cp_count : coverpoint count {
            bins zero = {4'b0000};
            bins mid  = {[4'b0001:4'b1110]};
            bins max  = {4'b1111};
        }

    endgroup

    rc_cg cg = new();

    initial begin
        $dumpfile("ripple_counter.vcd");
        $dumpvars(0, tb_ripple_counter);

        // Reset
        rst = 1;
        #10 rst = 0;

        // Let counter run through full range
        repeat (16) #10;

        // -------------------------
        // COVERAGE REPORT
        // -------------------------
        $display("Ripple Counter Coverage = %0.2f %%", cg.get_inst_coverage());

        if (cg.get_inst_coverage() == 100.0)
            $display("PASS ✅ Ripple counter coverage complete");
        else
            $display("FAIL ❌ Ripple counter coverage incomplete");

        $finish;
    end

endmodule
