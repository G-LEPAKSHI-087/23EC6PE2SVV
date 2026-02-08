//------------------------------------------------------------------------------
// File        : tb_siso.sv
// Author      : <G Lepakshi /1BM23EC087 >
// Created     : <2026-01-06>
// Module      : Shift Register
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Simple testbench for Shift register. Randomizes inputs and uses a
//               covergroup to measure input combination coverage.
//------------------------------------------------------------------------------
module tb;

logic clk=0, si, so;
logic [3:0] reference = 0;   // ⭐ IMPORTANT initialization

siso dut(.*);

always #5 clk = ~clk;

/////////////////////////////////////////////////////
// COVERAGE
/////////////////////////////////////////////////////
covergroup shift_cg @(posedge clk);

    // Did we send both 0 and 1?
    cp_si : coverpoint si {
        bins zero = {0};
        bins one  = {1};
    }

    // Did output become both?
    cp_so : coverpoint so {
        bins zero = {0};
        bins one  = {1};
    }

    // OPTIONAL (VERY IMPRESSIVE FOR LAB)
    cross_si_so : cross si, so;

endgroup

shift_cg cg = new();

/////////////////////////////////////////////////////
// WAVEFORM
/////////////////////////////////////////////////////
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
end

/////////////////////////////////////////////////////
// TEST
/////////////////////////////////////////////////////
initial begin

repeat(20) begin

    si = $urandom_range(0,1); // better than $urandom
    reference = {reference[2:0], si};

    @(posedge clk);
    #1;

    if(so !== reference[3])
        $error("SHIFT ERROR");

    cg.sample();   // ⭐ RECORD COVERAGE
end


/////////////////////////////////////////////////////
// PRINT COVERAGE
/////////////////////////////////////////////////////
$display("\n==============================");
$display("SHIFT REGISTER PASS");
$display("Coverage = %0.2f %%", cg.get_inst_coverage());
$display("==============================\n");


#20 $finish;

end
endmodule
