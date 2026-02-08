//------------------------------------------------------------------------------
// File        : tb_penco.sv
// Author      : <G Lepakshi /1BM23EC087 >
// Created     : <2026-01-30>
// Module      : tb_penco
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Simple testbench for Priority Encoder. Randomizes inputs and uses a
//               covergroup to measure input combination coverage.
//------------------------------------------------------------------------------
// Code your testbench here
// or browse Examples
module tb;

logic [3:0] in;
logic [1:0] out;
logic valid;

priority_enc dut(.*);

covergroup cg;
cp_in: coverpoint in {
bins b0={1};
bins b1={2};
bins b2={4};
bins b3={8};
}
endgroup

cg c=new();

initial begin

// Directed → guarantees 100%
in=1; #5; c.sample();
in=2; #5; c.sample();
in=4; #5; c.sample();
in=8; #5; c.sample();

$display("Coverage=%0.2f %%",c.get_inst_coverage());

$dumpfile("dump.vcd");
$dumpvars;

#10 $finish;
end
endmodule
