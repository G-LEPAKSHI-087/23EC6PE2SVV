//------------------------------------------------------------------------------
// File        : tb_arb.sv
// Author      : <G Lepakshi /1BM23EC087 >
// Created     : <2026-01-06>
// Module      : tb_arb
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Simple testbench for Arbiter(Assertions). Randomizes inputs and uses a
//               covergroup to measure input combination coverage.
//------------------------------------------------------------------------------
module tb;

logic clk=0,rst;
logic [3:0] req;
logic [3:0] gnt;

arbiter dut(.*);

always #5 clk=~clk;


//================================================
// ASSERTION
//================================================
assert property(@(posedge clk) $onehot0(gnt))
else $error("Multiple grants!");


//================================================
// COVERAGE (SMART VERSION)
//================================================
covergroup arb_cg @(posedge clk);

option.per_instance = 1;

// Cover ONLY grants
grant_cp : coverpoint gnt {

    bins g0 = {4'b0001};
    bins g1 = {4'b0010};
    bins g2 = {4'b0100};
    bins g3 = {4'b1000};
}

endgroup

arb_cg cg = new();


// DEBUG (helps instantly if something is wrong)
always @(posedge clk)
$display("req=%b gnt=%b",req,gnt);



//================================================
// STIMULUS (PURE DIRECTED)
//================================================
initial begin

$dumpfile("dump.vcd");
$dumpvars(0,tb);


// Reset
rst=1;
req=0;
@(posedge clk);

rst=0;


//⭐⭐⭐⭐⭐ CRITICAL PART
// Apply ONE request at a time
//------------------------------------------------

// requester 0
req=4'b0001;
@(posedge clk);
req=0;
@(posedge clk);

// requester 1
req=4'b0010;
@(posedge clk);
req=0;
@(posedge clk);

// requester 2
req=4'b0100;
@(posedge clk);
req=0;
@(posedge clk);

// requester 3
req=4'b1000;
@(posedge clk);
req=0;
@(posedge clk);


// PRINT COVERAGE
#2;
$display("\nFINAL COVERAGE = %0.2f %%\n",
cg.get_inst_coverage());

#20 $finish;

end

endmodule
