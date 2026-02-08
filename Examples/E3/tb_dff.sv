//------------------------------------------------------------------------------
// File        : tb_dff.sv
// Author      : <G Lepakshi /1BM23EC087 >
// Created     : <2026-01-06>
// Module      : D Flip Flop
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Simple testbench for D Flip Flop. Randomizes inputs and uses a
//               covergroup to measure input combination coverage.
//------------------------------------------------------------------------------
`timescale 1ns/1ps

class packet;
    rand bit d, rst;

    // Better distribution (optional now)
    constraint c1 { rst dist {0:=70, 1:=30}; }
endclass


module tb;

    logic clk = 0;
    logic rst, d, q;

    // Explicit mapping (preferred in interviews)
    dff dut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q)
    );

    always #5 clk = ~clk;

    // Functional Coverage
    covergroup cg @(posedge clk);

        cp_rst : coverpoint rst {
            bins zero = {0};
            bins one  = {1};
        }

        cp_d : coverpoint d {
            bins zero = {0};
            bins one  = {1};
        }

        cross_rst_d : cross cp_rst, cp_d;

    endgroup

    cg c = new();
    packet pkt = new();

    initial begin

        // ✅ Waveform
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);

        //------------------------------------------------
        // ⭐ Directed Tests → guarantees ALL bins hit
        //------------------------------------------------
        rst=0; d=0; @(posedge clk);
        rst=0; d=1; @(posedge clk);
        rst=1; d=0; @(posedge clk);
        rst=1; d=1; @(posedge clk);

        //------------------------------------------------
        // Random Testing
        //------------------------------------------------
        repeat (50) begin

            assert(pkt.randomize())
            else $fatal("Randomization failed");

            rst = pkt.rst;
            d   = pkt.d;

            @(posedge clk);
        end

        $display("Coverage = %0.2f%%", c.get_inst_coverage());

        $finish;
    end

endmodule
