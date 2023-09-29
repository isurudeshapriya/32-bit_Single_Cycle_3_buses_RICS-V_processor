`timescale 1ns / 1ps

module imm_Gen(
    input logic [31:0] inst_code,
    output logic [31:0] Imm_out
);

    logic [4:0] srai;
    assign srai = inst_code[24:20];

    always_comb
        case(inst_code[6:0])
            // I-type load instruction
            7'b0000011:
                Imm_out = {inst_code[31] ? {20{1'b1}} : 20'b0, inst_code[31:20]};
            
            // I-type addi instruction
            7'b0010011:
                begin
                    if ((inst_code[31:25] == 7'b0100000 && inst_code[14:12] == 3'b101) || 
                        (inst_code[14:12] == 3'b001) || 
                        (inst_code[14:12] == 3'b101))
                    begin
                        Imm_out = {srai[4] ? {27{1'b1}} : 27'b0, srai};
                    end
                    else
                    begin
                        Imm_out = {inst_code[31] ? 20'b1 : 20'b0, inst_code[31:20]};
                    end
                end

            // S-type instruction
            7'b0100011:
                Imm_out = {inst_code[31] ? 20'b1 : 20'b0, inst_code[31:25], inst_code[11:7]};

            // B-type instruction
            7'b1100011:
                Imm_out = {inst_code[31] ? 20'b1 : 20'b0, inst_code[7], inst_code[30:25], inst_code[11:8], 1'b0};

            // JALR instruction
            7'b1100111:
                Imm_out = {inst_code[31] ? 20'b1 : 20'b0, inst_code[30:25], inst_code[24:21], inst_code[20]};

            // U-type instruction
            7'b0010111:
                Imm_out = {inst_code[31] ? 1'b1 : 1'b0, inst_code[30:20], inst_code[19:12], 12'b0};

            // LUI-type instruction
            7'b0110111:
                Imm_out = {inst_code[31:12], 12'b0};

            // AUIPC-type instruction
            7'b0010111:
                Imm_out = {inst_code[31:12], 12'b0};

            // JAL instruction
            7'b1101111:
                Imm_out = {inst_code[31] ? 20'b1 : 20'b0, inst_code[19:12], inst_code[19:12], inst_code[20], inst_code[30:25], inst_code[24:21], 1'b0};

            // Default case
            default:
                Imm_out = 32'b0;
        endcase
endmodule
