module moja_pamat #(
    parameter addrw = 10,
    parameter dataw = 16
) (
    input logic CLK,
    input logic RST,
    input logic [addrw-1:0] ADDR,
    input logic [dataw-1:0] DATAIN,
    output logic [dataw-1:0] DATAOUT,
    input logic WRITE,
    input logic ENABLE
);

logic [dataw-1:0] ram [2**addrw-1:0];
logic [addrw-1:0] addr;

always_ff @(posedge CLK) begin
    if (ENABLE) begin
        if (WRITE) begin
            ram[ADDR] <= DATAIN;
        end
        addr <= ADDR;
    end
end

assign DATAOUT = ram[addr];

endmodule
