//------------------------------------------------------------------------------
// File        : alu.sv
// Author      : <G Lepakshi /1BM23EC087 >
// Created     : <2026-01->
// Module      : The Calculator
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Simple design for the Calculator. Randomizes inputs and uses a
//               covergroup to measure input combination coverage.
//------------------------------------------------------------------------------

`timescale 1ns/1ps   // 

package alu_pkg;
  typedef enum bit [1:0] {
    ADD = 0,
    SUB = 1,
    MUL = 2,
    XOR = 3
  } opcode_e;
endpackage

import alu_pkg::*;

module alu (
  input  logic [7:0]  a, b,
  input  opcode_e     op,
  output logic [15:0] result
);

  always_comb begin
    case (op)
      ADD: result = a + b;
      SUB: result = a - b;
      MUL: result = a * b;
      XOR: result = a ^ b;
      default: result = '0;
    endcase
  end

endmodule

