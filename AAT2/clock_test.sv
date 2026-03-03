//------------------------------------------------------------------------------
// File        : clock_test.sv
// Author      : <G Lepakshi /1BM23EC087 >
// Created     : <2026-01-4>
// Module      : Test Bench 
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Basic Digital Clock used for basic functional coverage example and uses a
//               covergroup to measure input combination coverage.

program clock_test(clock_interface.TB intf);

    // Functional Coverage
    covergroup cg @(posedge intf.clk);

        coverpoint intf.seconds {
            bins sec_vals[] = {[0:59]};
            bins sec_roll = (59 => 0);
        }

        coverpoint intf.minutes {
            bins min_vals[] = {[0:59]};
            bins min_roll = (59 => 0);
        }

        cross intf.seconds, intf.minutes;

    endgroup

    cg c = new();

    initial begin
        // Apply reset
        intf.rst = 1;
        repeat (5) @(posedge intf.clk);
        intf.rst = 0;

        // Run simulation
        repeat (4000) @(posedge intf.clk);

        $display("TEST COMPLETED");
        $finish;
    end

endprogram

