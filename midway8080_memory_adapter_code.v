module midway8080_memory_adapter_code (
    input wire [9:0] input_x_address,
    input wire [8:0] input_y_address,
    output wire [7:0] output_x_address,
    output wire [4:0] output_y_address,
    input wire [7:0] raw_data_from_midway8080_memory,
    output wire [31:0] rgb_data_out,
    input wire [9:0] color_offset
    );

    wire [9:0] rgb_component = {10{pixel}}; 
    wire [31:0] rgbout = {3{rgb_component}};

    wire in_display_area = (input_x_address <= 10'd224) && (input_y_address < 9'd256);

    assign output_x_address = input_x_address[7:0];

    wire [4:0] vertical_byte_index = input_y_address[7:3];
    assign output_y_address = (5'd31 - vertical_byte_index);

    wire [2:0] pixel_bit_index = 3'd7 - input_y_address[2:0];

    wire pixel = in_display_area ? raw_data_from_midway8080_memory[pixel_bit_index] : 1'b0;

    assign rgb_data_out = rgbout;
    
    // localparam [29:0] C_RED     = {10'h3FF,10'h000,10'h000};
    // localparam [29:0] C_ORANGE  = {10'h3FF,10'h190,10'h000};
    // localparam [29:0] C_YELLOW  = {10'h3FF,10'h3FF,10'h000};
    // localparam [29:0] C_GREEN   = {10'h000,10'h3FF,10'h000};
    // localparam [29:0] C_CYAN    = {10'h000,10'h3FF,10'h3FF};
    // localparam [29:0] C_BLUE    = {10'h000,10'h000,10'h3FF};
    // localparam [29:0] C_MAGENTA = {10'h3FF,10'h000,10'h3FF};
    // wire [10:0] shifted_x = {1'b0, input_x_address} + color_offset;
    // wire [2:0]  bucket    = shifted_x / 11'd28;
    // reg [29:0] colour;
    // always @* begin
    //     case (bucket)
    //         3'd0: colour = C_RED;
    //         3'd1: colour = C_ORANGE;
    //         3'd2: colour = C_YELLOW;
    //         3'd3: colour = C_GREEN;
    //         3'd4: colour = C_CYAN;
    //         3'd5: colour = C_BLUE;
    //         3'd6: colour = C_MAGENTA;
    //         default: colour = C_ORANGE;
    //     endcase
    // end
    // wire color_display = (input_x_address < 10'd224) && (input_y_address < 9'd170) && (input_y_address > 9'd16);
    // assign rgb_data_out = (pixel != 0 && color_display) ? {2'b00, colour} : rgbout;

endmodule