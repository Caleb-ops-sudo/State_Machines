// Implement binary state machine


module binary (

input w,
input clk,
input Reset, 
output [2:0] State,
output z
);

    wire [2:0] Next;
   

 dff zero(
       .Default(1'b0),
       .D(Next[0]),
       .clk(clk),
       .Q(State[0]),
       .Reset(Reset)
    );

   dff one(
       .Default(1'b0),
       .D(Next[1]),
       .clk(clk),
       .Q(State[1]),
       .Reset(Reset)
    );
    
    dff two(
        .Default(1'b0),
        .D(Next[2]),
        .clk(clk),
        .Q(State[2]),
        .Reset(Reset)
        
       );


     assign z = (State[1] & ~State[2] &  ~State[0]) | (State[2] & ~State[0] & ~State[1]);                                     
     assign Next[0] = (~State[1] & ~State[0] &  ~w) | (State[1] & State[0] & ~w) | ( ~State[2] & ~State[1] & w) | (~State[2] & ~State[0] & w) ;
     assign Next[1] = (~State[2] & ~State[0] & w) | (State[1] & ~State[0]) | (~State[1] & State[0]) | (~State[2] & ~State[0] & w);
     assign Next[2] = (State[1] & State[0] & w) | (State[2] & w);
   


endmodule
