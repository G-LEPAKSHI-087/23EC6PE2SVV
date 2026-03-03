//------------------------------------------------------------------------------
// File        : clock_interface.sv
// Author      : <G Lepakshi /1BM23EC087 >
// Created     : <2026-03-1>
// Module      : Interface
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Basic Digital Clock used for basic functional coverage example and uses a
//               covergroup to measure input combination coverage.

interface clock_interface (input logic clk);

   
    logic [5:0] seconds;
    logic [5:0] minutes;

    // DUT Modport
    modport DUT (
        input clk,
        output seconds, minutes
    );

    // TB Modport
    modport TB (
        input clk, seconds, minutes
    );

endinterface

