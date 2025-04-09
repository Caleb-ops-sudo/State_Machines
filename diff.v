module dff(
    input Default,
    input D,
    input clk,
    input Reset,
    output reg Q
);

    initial begin
        Q <= Default;
    end

    always @(posedge clk, posedge Reset) begin
        if (Reset)
            Q <= Default;
        else
            Q <= D;
    end

endmodule
