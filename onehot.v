// Implement one-hot state machine

module onehot (
    input w,
    input clk,
    input Reset,
    output [4:0] state,
    output z,
    output Astate,
    output Bstate,
    output Cstate,
    output Dstate,
    output Estate
    
);
 wire Anext, Bnext, Cnext, Dnext, Enext;
 

  dff Adff(
        .Default(1'b1),
        .D(Anext),
        .clk(clk),
        .Q(Astate),
        .Reset(Reset)
    );

    dff Bdff(
        .Default(1'b0),
        .D(Bnext),
        .clk(clk),
        .Q(Bstate),
        .Reset(Reset)
    );

    dff Cdff(
        .Default(1'b0),
        .D(Cnext),
        .clk(clk),
        .Q(Cstate),
        .Reset(Reset)
    );
    
    dff Ddff(
       .Default(1'b0),
       .D(Dnext),
       .clk(clk),
        .Q(Dstate),
       .Reset(Reset)
        
    );
    
    dff Edff ( 
     .Default(1'b0),
     .D(Enext),
     .clk(clk),
     .Q(Estate),
     .Reset(Reset)
    );

    assign z = (Cstate | Estate);

    assign Anext = 0;
    assign Bnext = ~w & ( Astate | Dstate | Estate );
    assign Cnext = ~w & ( Bstate | Cstate);
    assign Dnext = ( w & Astate ) | ( w & Bstate ) | (w & Cstate);
    assign Enext = ( w & Dstate ) | ( w & Estate);
    
endmodule


    
    
