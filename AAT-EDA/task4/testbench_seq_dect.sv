//------------------------------------------------------------------------------
// File        : t_seq_dect.sv
// Author      : <G Lepakshi /1BM23EC087 >
// Created     : <2026-01-30>
// Module      : tb_seq_dect
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Simple testbench for sequence_detector. Randomizes inputs and uses a
//               covergroup to measure input combination coverage.
//------------------------------------------------------------------------------
module tb_seq_detector;

    logic clk = 0;
    logic rst;
    logic din;
    logic detect;

    seq_detector_1011 dut (.*);

    always #5 clk = ~clk;

    // -------------------------
    // COVERAGE
    // -------------------------
    covergroup seq_cg @(posedge clk);
        cp_detect : coverpoint detect {
            bins no  = {0};
            bins yes = {1};
        }
    endgroup

    seq_cg cg = new();

    initial begin
        $dumpfile("seq.vcd");
        $dumpvars(0, tb_seq_detector);

        rst = 1; din = 0;
        #10 rst = 0;

        // Apply sequence: 1 0 1 1
        din = 1; #10;
        din = 0; #10;
        din = 1; #10;
        din = 1; #10;

        #20;

        $display("Sequence Detector Coverage = %0.2f %%", cg.get_inst_coverage());

        if (cg.get_inst_coverage() == 100.0)
            $display("PASS ✅ Sequence detector coverage complete");
        else
            $display("FAIL ❌ Sequence detector coverage incomplete");

        $finish;
    end

endmodule
