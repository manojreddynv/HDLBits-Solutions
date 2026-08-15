module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum 
);

    
    wire [100:0] c;
    
    assign c[0] = cin;
    
    assign cout = c[100];

    genvar i;
    generate
        for (i = 0; i < 100; i = i + 1) begin : bcd_adder
            bcd_fadd bcdfa (
                .a(a[i*4 +: 4]),
                .b(b[i*4 +: 4]),
                .cin(c[i]),
                .cout(c[i+1]),
                .sum(sum[i*4 +: 4])
            );
        end
    endgenerate

endmodule


