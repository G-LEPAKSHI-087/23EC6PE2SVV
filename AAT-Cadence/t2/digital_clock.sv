//------------------------------------------------------------------------------
// File        : digital_clk.sv
// Author      : <G Lepakshi /1BM23EC087 >
// Created     : <2026-01-4>
// Module      : tb_and_gate
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Basic Digital Clock used for basic functional coverage example and uses a
//               covergroup to measure input combination coverage.
`timescale 1ns/1ps

module digital_clock(
  input  logic clk,
  input  logic rst,
  output logic [5:0] sec,
  output logic [5:0] min
);

  // Seconds Logic
  always_ff @(posedge clk) begin
    if (rst)
      sec <= 0;
    else if (sec == 59)
      sec <= 0;
    else
      sec <= sec + 1;
  end

  // Minutes Logic
  always_ff @(posedge clk) begin
    if (rst)
      min <= 0;
    else if (sec == 59) begin
      if (min == 59)
        min <= 0;
      else
        min <= min + 1;
    end
    else
      min <= min;   // ✅ explicit hold
  end

endmodule

