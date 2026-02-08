//------------------------------------------------------------------------------
// File        : tb_fifo.sv
// Author      : <G Lepakshi /1BM23EC087 >
// Created     : <2026-01-30>
// Module      : tb_FIFO
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Simple testbench for FIFO. Randomizes inputs and uses a
//               covergroup to measure input combination coverage.
//------------------------------------------------------------------------------
interface fifo_if(input clk);
logic wr,rd,full,empty;
logic [7:0] din;
endinterface


module tb;

bit clk=0;
always #5 clk=~clk;

fifo_if vif(clk);

fifo dut(.clk(clk),
         .wr(vif.wr),
         .rd(vif.rd),
         .din(vif.din),
         .full(vif.full),
         .empty(vif.empty));

covergroup cg @(posedge clk);
cross_wr_full: cross vif.wr,vif.full;
endgroup

cg c=new();

initial begin

// Fill FIFO
vif.wr=1;
repeat(20) @(posedge clk);

// Attempt write when full
@(posedge clk);
c.sample();

$display("Coverage=%0.2f %%",c.get_inst_coverage());

$dumpfile("dump.vcd");
$dumpvars;

#20 $finish;
end
endmodule
