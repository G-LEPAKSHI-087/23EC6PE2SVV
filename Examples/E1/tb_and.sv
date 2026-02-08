//------------------------------------------------------------------------------
// File        : tb_and.sv
// Author      : <G Lepakshi /1BM23EC087 >
// Created     : <2026-01-06>
// Module      : tb_and_gate
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Simple testbench for and gate. Randomizes inputs and uses a
//               covergroup to measure input combination coverage.
//------------------------------------------------------------------------------
`timescale 1ns/1ps

module tb;

    logic a, b, y;

    // DUT
    and_gate dut (
        .a(a),
        .b(b),
        .y(y)
    );

    // Covergroup
    covergroup cg_and;
        cp_a : coverpoint a;
        cp_b : coverpoint b;
        cross_ab : cross cp_a, cp_b;
    endgroup

    cg_and cg = new();

    initial begin
        
        // ✅ Create waveform file
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);

        repeat (20) begin
            a = $urandom_range(0,1); // restrict to 0 or 1
            b = $urandom_range(0,1);
            #5;
            cg.sample();
        end

        $display("Coverage = %0.2f%%", cg.get_inst_coverage());
        $finish;
    end

endmodule
