//------------------------------------------------------------------------------
// File        : tb_tlc.sv
// Author      : <G Lepakshi /1BM23EC087 >
// Created     : <2026-01-30>
// Module      : tb_tlc
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Simple testbench for traffic light controller. Randomizes inputs and uses a
//               covergroup to measure input combination coverage.
//------------------------------------------------------------------------------
module tb_traffic;

    logic clk = 0;
    logic rst;
    logic [2:0] light;

    traffic_light dut (.*);

    always #5 clk = ~clk;

    // -------------------------
    // COVERAGE
    // -------------------------
    covergroup tl_cg @(posedge clk);
        coverpoint light {
            bins red    = {3'b100};
            bins green  = {3'b001};
            bins yellow = {3'b010};
        }
    endgroup

    tl_cg cg = new();

    initial begin
        // EPWave
        $dumpfile("traffic.vcd");
        $dumpvars(0, tb_traffic);

        // Reset
        rst = 1;
        #10 rst = 0;

        // Let FSM cycle through all states
        #60;

        // -------------------------
        // COVERAGE REPORT
        // -------------------------
        $display("Traffic Controller Coverage = %0.2f %%", 
                  cg.get_inst_coverage());

        if (cg.get_inst_coverage() == 100.0)
            $display("PASS ✅ Traffic controller coverage complete");
        else
            $display("FAIL ❌ Traffic controller coverage incomplete");

        $finish;
    end

endmodule
