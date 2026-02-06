//------------------------------------------------------------------------------
// File        : tb_alu.sv
// Author      : <G Lepakshi /1BM23EC087 >
// Created     : <2026-01-30>
// Module      : tb_alu
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Simple testbench for ALU. Randomizes inputs and uses a
//               covergroup to measure input combination coverage.
//------------------------------------------------------------------------------
module tb_alu;

  logic [3:0] a, b;
  logic [2:0] sel;
  logic [4:0] y;

  alu dut(.*);

  covergroup alu_cg;
    coverpoint sel {
      bins add = {0};
      bins sub = {1};
      bins and_op = {2};
      bins or_op  = {3};
      bins xor_op = {4};
    }
  endgroup

  alu_cg cg = new();

  initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0, tb_alu);

    a=7; b=3;

    for (int i=0;i<=4;i++) begin
      sel=i;
      #10;
      cg.sample();
    end

    $display("ALU Coverage = %0.2f %%", cg.get_inst_coverage());
    if (cg.get_inst_coverage() == 100.0)
      $display("PASS ✅ ALU coverage complete");
    else
      $display("FAIL ❌ ALU coverage incomplete");

    $finish;
  end
endmodule
