timescale 1ns / 1ps

module ALU8bit_tb;

    Inputs

    reg [2 : 0] Opcode;

    reg [7 : 0] Operand1;

    reg [7 : 0] Operand2;

    Outputs

    wire [15 : 0] Result;

    wire flagC;

    wire flagZ;

    Temporary variable

    reg [2 : 0] count = 3'd0;

    Instantiate the Unit Under Test (UUT)

    ALU8bit uut (

    Opcode(Opcode), 

    Operand1(Operand1), 

    Operand2(Operand2), 

    Result(Result), 

    flagC(flagC), 

    flagZ(flagZ)

    );

    initial begin
        Initialize Inputs

        Opcode = 3'b0;

        Operand1 = 8'd0;

        Operand2 = 8'd0;

        wait 100 ns for global reset to finish

        100; 

        Add stimulus here 

        Operand1 = 8'hAA;

        Operand2 = 8'h55; 

        for (count = 0;
            count < 8;
            count = count + 1'b1)

            begin
                Opcode = count;

                20;

            end

    end 

endmodule