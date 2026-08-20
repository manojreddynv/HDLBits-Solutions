`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 

   wire m,n,o;
    
    assign m = a&b;
    assign n = c&d;
    assign o = m|n;
    assign out = o;
    assign out_n = ~o;
    
   
endmodule

