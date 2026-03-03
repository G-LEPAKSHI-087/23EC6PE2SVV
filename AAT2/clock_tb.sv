//------------------------------------------------------------------------------
// File        : clock_tb.sv
// Author      : <G Lepakshi /1BM23EC087 >
// Created     : <2026-01-4>
// Module      : Top Module 
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Basic Digital Clock used for basic functional coverage example and uses a
//               covergroup to measure input combination coverage.

module clock_tb;

    logic clk = 0;

    // Clock generation
    always #5 clk = ~clk;

    // Interface
    clock_interface intf(clk);

    // DUT
    digital_clock dut (
        .clk(clk),
        .rst(intf.rst),
        .seconds(intf.seconds),
        .minutes(intf.minutes)
    );

    // --------------------------------
    // VCD Dump
    // --------------------------------
    initial begin
        $dumpfile("digital_clock.vcd");
        $dumpvars(0, clock_tb);
    end

    // --------------------------------
    // Assertions (ignore X values)
    // --------------------------------
    always @(posedge clk) begin
        if (!$isunknown(intf.seconds))
            assert(intf.seconds <= 59)
            else $error("Seconds exceeded 59!");

        if (!$isunknown(intf.minutes))
            assert(intf.minutes <= 59)
            else $error("Minutes exceeded 59!");
    end

    // Program
    clock_test test(intf);

endmodule

