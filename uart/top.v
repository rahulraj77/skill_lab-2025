`include "uart_trx.v"

//----------------------------------------------------------------------------
//                                                                          --
//                         Module Declaration                               --
//                                                                          --
//----------------------------------------------------------------------------
module top (
  // outputs
  output wire led_red  , // Red
  output wire led_blue , // Blue
  output wire led_green , // Green
  output wire uarttx , // UART Transmission pin
  input wire uartrx , // UART Receiver pin
  input wire  hw_clk
);

  wire        int_osc            ;
  reg  [27:0] frequency_counter_i;
  
/* 9600 Hz clock generation (from 12 MHz) */
    reg clk_9600 = 0;
    reg [31:0] cntr_9600 = 32'b0;
    parameter period_9600 = 625;
    reg [7:0] data_array [0:3];
    initial begin
      data_array[0] = "A";
      data_array[1] = "H";
      data_array[2] = "U";
      data_array[3] = "L";
    end

    reg [2:0] byte_index = 0;      // Index for data_array (0 to 4)
    reg senddata = 0;              // Trigger for UART send
    reg [7:0] txbyte = 8'b0;       // Byte to send
    reg [15:0] uart_timer = 0;     // Timer to space out transmissions
    reg sending = 0;               // Indicates if a byte is being sent

    
uart_tx_8n1 DanUART1 (.clk (clk_9600), .txbyte(txbyte), .senddata(frequency_counter_i[24]), .tx(uarttx));

//----------------------------------------------------------------------------
//                                                                          --
//                       Internal Oscillator                                --
//                                                                          --
//----------------------------------------------------------------------------
  SB_HFOSC #(.CLKHF_DIV ("0b10")) u_SB_HFOSC ( .CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));


//----------------------------------------------------------------------------
//                                                                          --
//                       Counter                                            --
//                                                                          --
//----------------------------------------------------------------------------
  always @(posedge int_osc) begin
    frequency_counter_i <= frequency_counter_i + 1'b1;
        /* generate 9600 Hz clock */
        cntr_9600 <= cntr_9600 + 1;
        if (cntr_9600 == period_9600) begin
            clk_9600 <= ~clk_9600;
            cntr_9600 <= 32'b0;
        end
  end

  always @(posedge clk_9600) begin
    if (byte_index < 5) begin
        if (!sending) begin
            txbyte <= data_array[byte_index];
            senddata <= 1;
            sending <= 1;
            uart_timer <= 0;
        end else begin
            senddata <= 0; // Pulse senddata for one cycle only
            uart_timer <= uart_timer + 1;
            // Wait for 10 cycles (1 full UART frame)
            if (uart_timer >= 10) begin
                sending <= 0;
                byte_index <= byte_index + 1;
            end
        end
    end
end


//----------------------------------------------------------------------------
//                                                                          --
//                       Instantiate RGB primitive                          --
//                                                                          --
//----------------------------------------------------------------------------
  SB_RGBA_DRV RGB_DRIVER (
    .RGBLEDEN(1'b1                                            ),
    .RGB0PWM (uartrx),
    .RGB1PWM (uartrx),
    .RGB2PWM (uartrx),
    .CURREN  (1'b1                                            ),
    .RGB0    (led_green                                       ), //Actual Hardware connection
    .RGB1    (led_blue                                        ),
    .RGB2    (led_red                                         )
  );
  defparam RGB_DRIVER.RGB0_CURRENT = "0b000001";
  defparam RGB_DRIVER.RGB1_CURRENT = "0b000001";
  defparam RGB_DRIVER.RGB2_CURRENT = "0b000001";

endmodule