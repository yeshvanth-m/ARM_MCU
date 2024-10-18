`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2024 11:47:57 AM
// Design Name: 
// Module Name: tri_io_buf
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tri_io_buf #(
                     parameter WIDTH = 1
                   )
                   (
                     input   wire  [WIDTH-1:0]       din,
                     input   wire                    oen_N,
                     inout   wire  [WIDTH-1:0]       io_pad,
                     output  wire  [WIDTH-1:0]       dout
                   );
genvar i;

generate
  for (i=0; i<WIDTH; i=i+1)
  begin
  IOBUF                   #(
                                    .DRIVE (12),        // Specify the output drive strength
                             .IBUF_LOW_PWR ("TRUE"),    // Low Power - "TRUE", High Performance = "FALSE"
                               .IOSTANDARD ("DEFAULT") // Specify the I/O standard
                           )
               IOBUF_inst  (
                                        .O (dout[i]),   // Buffer output     (data to core)
                                       .IO (io_pad[i]), // Buffer inout port (To I/O pad)
                                        .I (din[i]),    // Buffer input      (core to I/O pad)
                                        .T (oen_N)        // 3-state enable input, high=tristate hence input, low=output
                           ); 
     
  end
endgenerate
endmodule
