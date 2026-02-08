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
module tb;

logic clk=0,rst;
light_t color;

traffic dut(.*);

always #5 clk=~clk;

covergroup cg @(posedge clk);
cp: coverpoint color{
bins cycle=(RED=>GREEN=>YELLOW=>RED);
}
endgroup

cg c=new();

initial begin

rst=1;
repeat(2) @(posedge clk);
rst=0;

repeat(10) @(posedge clk);

$display("Coverage=%0.2f %%",c.get_inst_coverage());

$dumpfile("dump.vcd");
$dumpvars;

#20 $finish;
end
endmodule
