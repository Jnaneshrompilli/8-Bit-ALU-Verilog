timescale 1ns / 1ps

module ALU8bit(Opcode, 

Operand1, 

Operand2, 

Result, 

flagC, 

flagZ

); 

input [2 : 0] Opcode;

input [7 : 0] Operand1, 

Operand2;

 

output reg [15 : 0] Result = 16'b0;

output reg flagC = 1'b0, 

flagZ = 1'b0; 

parameter [2 : 0] ADD = 3'b000, 

SUB = 3'b001, 

MUL = 3'b010, 

and = 3'b011, 

or = 3'b100, 

nand = 3'b101, 

nor = 3'b110, 

xor = 3'b111; 

always @ (Opcode or Operand1 or Operand2)

begin
	case (Opcode)

		ADD : begin
		Result = Operand1 + Operand2;

		flagC = Result[8];

		flagZ = (Result == 16'b0);

        end

        SUB : begin
        Result = Operand1 - Operand2;

        flagC = Result[8];

        flagZ = (Result == 16'b0);

        end

        MUL : begin
        Result = Operand1 * Operand2;

        flagZ = (Result == 16'b0);

        end

        and : begin
        Result = Operand1 & Operand2;

        flagZ = (Result == 16'b0);

        end

        or : begin
        Result = Operand1 | Operand2;

        flagZ = (Result == 16'b0);

        end

        nand : begin
        Result = ~(Operand1 & Operand2);

        flagZ = (Result == 16'b0);

        end

        nor : begin
        Result = ~(Operand1 | Operand2);

        flagZ = (Result == 16'b0);

        end

        xor : begin
        Result = Operand1 ^ Operand2;

        flagZ = (Result == 16'b0);

        end

        default : begin
        Result = 16'b0;

        flagC = 1'b0;

        flagZ = 1'b0;

        end

    endcase

end

endmodule