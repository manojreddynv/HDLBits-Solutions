module top_module (input x, input y, output z);
    
    wire z0,z1,z2,z3;
    wire or_gate,and_gate;

    A IA1(.x(x),.y(y),.z(z0));
    B IB1(.x(x),.y(y),.z(z1));
    A IA2(.x(x),.y(y),.z(z2));
    B IB2(.x(x),.y(y),.z(z3));
   
    assign or_gate = z0 | z1;
    assign and_gate = z2 & z3;
    assign z = or_gate ^ and_gate;
endmodule


 module A(x,y,z);
        input x,y;
        output z;
        
     assign z = (x^y) & x;
    endmodule 
           
  module B(x,y,z);
        input x,y;
        output z;
        
      assign z = ~(x^y);
    endmodule 
