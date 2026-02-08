//------------------------------------------------------------------------------
// File        : tb_4bitc.sv
// Author      : <G Lepakshi /1BM23EC087 >
// Created     : <2026-01-06>
// Module      : 4-bit counter
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Simple testbench for 4-bit countetr. Randomizes inputs and uses a
//               covergroup to measure input combination coverage.
//------------------------------------------------------------------------------
module tb;

logic clk = 0;
logic rst;
logic [3:0] count;

counter dut(.*);


// ✅ CLOCK (MOST COMMON MISTAKE)
always #5 clk = ~clk;


// ✅ COVERAGE (optional but good)
covergroup cg @(posedge clk);
cp : coverpoint count {
    bins zero = {0};
    bins max  = {15};
    bins rollover = (15 => 0);
}
endgroup

cg c = new();


// ⭐⭐⭐ CRITICAL — Dump FIRST
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
end;



// STIMULUS
initial begin

// Reset properly
rst = 1;
repeat(2) @(posedge clk);

rst = 0;

// Run LONG enough for rollover
repeat(40) @(posedge clk);


// Print coverage
#2;
$display("COVERAGE = %0.2f %%", 
          c.get_inst_coverage());

#20 $finish;

end

endmodule
