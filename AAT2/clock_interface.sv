interface clock_interface (input logic clk);

   
    logic [5:0] seconds;
    logic [5:0] minutes;

    // DUT Modport
    modport DUT (
        input clk,
        output seconds, minutes
    );

    // TB Modport
    modport TB (
        input clk, seconds, minutes
    );

endinterface

