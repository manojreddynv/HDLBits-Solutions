module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum 
);
    wire [99:0] cin_vector = {cout[98:0], cin};

    fadd fa [99:0] (
        .a(a),
        .b(b),
        .cin(cin_vector),
        .sum(sum),
        .cout(cout)
    );

endmodule

module fadd (
    input a, b, cin,
    output sum, cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule
