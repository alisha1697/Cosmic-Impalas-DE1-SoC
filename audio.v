module audio (
    input wire clk,
    input wire reset,
    input wire [23:0] left_sample,
    input wire [23:0] right_sample,
    input wire write_enable,
    input wire bclk,
    input wire lrck,
    output reg dacdat
);

reg [23:0] left_reg = 0;
reg [23:0] right_reg = 0;
reg [4:0] bit_index = 0;
reg current_channel = 0;
reg [1:0] bclk_sync = 2'b00;
wire bclk_rising = (bclk_sync == 2'b01);

always @(posedge clk) begin
    bclk_sync <= {bclk_sync[0], bclk};

    if (reset) begin
        bit_index <= 0;
        current_channel <= 0;
        dacdat <= 0;
    end else if (bclk_rising) begin
        if (bit_index == 0 && write_enable) begin
            left_reg <= left_sample;
            right_reg <= right_sample;
            current_channel <= 0;
        end

        dacdat <= (lrck == 0) ? left_reg[23 - bit_index] : right_reg[23 - bit_index];
        bit_index <= (bit_index == 23) ? 0 : bit_index + 1;
    end
end

endmodule
