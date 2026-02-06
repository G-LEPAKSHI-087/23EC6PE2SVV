//------------------------------------------------------------------------------
// File        : tb_dual_ram.sv
// Author      : <G Lepakshi /1BM23EC087 >
// Created     : <2026-01-30>
// Module      : dual_port_ram
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Simple testbench for dual port ram. Randomizes inputs and uses a
//               covergroup to measure input combination coverage.
//------------------------------------------------------------------------------
module tb;

logic clk=0,we;
logic [7:0] addr,wdata,rdata;

int ref_mem[int];

ram dut(.*);

always #5 clk=!clk;

covergroup ram_cg;
    coverpoint addr;
endgroup

ram_cg cg=new();

initial begin
    $shm_open("waves.shm");
    $shm_probe("AS");

    repeat(100) begin
        addr=$urandom_range(0,255);
        wdata=$urandom;

        we=1;
        ref_mem[addr]=wdata;
        @(posedge clk);

        we=0;
        @(posedge clk);

        assert(rdata==ref_mem[addr])
            else $fatal("DATA MISMATCH!");

        cg.sample();
    end

    $display("Coverage=%0.2f%%",cg.get_inst_coverage());
    $finish;
end

endmodule
