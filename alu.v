/*对要执行的16种算术逻辑运算操作进行编码，编码为五位二进制数，从00001到10000
/是逻辑非操作，⊙是逻辑同或操作，⊕是逻辑异或操作。
*/
`define ADD     5'b00001        //F=A 加 B
`define ADDC    5'b00010        //F=A 加 B 加 Cin
`define SUB     5'b00011        //F=A 减 B
`define SUBC    5'b00100        //F=A 减 B 减 Cin
`define SUBF    5'b00101        //F=B 减 A
`define SUBFC   5'b00110        //F= B 减 A 减 Cin
`define ISA     5'b00111        //F=A
`define ISB     5'b01000        //F=B
`define NOTA    5'b01001        //F=/A
`define NOTB    5'b01010        //F=/B
`define OR      5'b01011        //F=A+B
`define AND     5'b01100        //F=AB
`define SAOR    5'b01101        //F=A⊙B
`define DIOR    5'b01110        //F=A⊕B
`define ANOT    5'b01111        //F=/(AB)
`define SETZ    5'b10000        //F=0
module alu (
    input  [31:0]   A   ,       //输入的32位运算数A
    input  [31:0]   B   ,       //输入的32位运算数B
    input           Cin ,       //进位
    input  [4 :0]   Card,       //5位运算操作码

    output [31:0]   F   ,       //32位运算结果
    output          Cout,       //结果进位
    output          Zero        //零标志
);
/*各操作的运算结果,与前面顺序一一对应*/
    wire [31:0]    add_result;
    wire [31:0]    addc_result;
    wire [31:0]    sub_result;
    wire [31:0]    subc_result;
    wire [31:0]    subf_result;
    wire [31:0]    subfc_result;
    wire [31:0]    isa_result;
    wire [31:0]    isb_result;
    wire [31:0]    nota_result;
    wire [31:0]    notb_result;
    wire [31:0]    or_result;
    wire [31:0]    and_result;
    wire [31:0]    saor_result;
    wire [31:0]    dior_result;
    wire [31:0]    anot_result;
    wire [31:0]    setz_result;
    wire cou1;
    wire cou2;
    wire cou3;
    wire cou4;
    wire cou5;
    wire cou6;
/*运算得出结果，与进位结果*/
    assign {cou1,add_result}=A+B;
    assign {cou2,addc_result}=A+B+Cin;
    assign {cou3,sub_result}=A-B;
    assign {cou4,subc_result}=A-B-Cin;
    assign {cou5,subf_result}=B-A;
    assign {cou6,subfc_result}=B-A-Cin;
    assign isa_result=A;
    assign isb_result=B;
    assign nota_result=~A;
    assign notb_result=~B;
    assign or_result=A|B;
    assign and_result=A&B;
    assign saor_result=~(A^B);
    assign dior_result=A^B;
    assign anot_result=~(A&B);
    assign setz_result=0;

/*当操作为对应操作时，对应结果不变，其他均为32b'0
最终结果为对应结果*/
    assign  F =     ({32{Card == `ADD}}  & add_result)  |
                    ({32{Card == `ADDC}}  & addc_result) |
                    ({32{Card == `SUB}}  & sub_result)  |
                    ({32{Card == `SUBC}}  & subc_result) |
                    ({32{Card == `SUBF}}  & subf_result) |
                    ({32{Card == `SUBFC}}  & subfc_result)|
                    ({32{Card == `ISA}}  & isa_result)  |
                    ({32{Card == `ISB}}  & isb_result)  |
                    ({32{Card == `NOTA}}  & nota_result) |
                    ({32{Card == `NOTB}}  & notb_result) |
                    ({32{Card == `OR}}  & or_result)   |
                    ({32{Card == `AND}}  & and_result)  |
                    ({32{Card == `SAOR}}  & saor_result) |
                    ({32{Card == `DIOR}} & dior_result) |
                    ({32{Card == `ANOT}}  & anot_result) |
                    ({32{Card == `SETZ}}  & setz_result);
/*对应操作Cout为对应进位，否则为0*/
    assign  Cout =  ({Card == `ADD}  & cou1) |
                    ({Card == `ADDC}  & cou2) |
                    ({Card == `SUB}   & cou3) |
                    ({Card == `SUBC}  & cou4) |
                    ({Card == `SUBF}  & cou5) |
                    ({Card == `SUBFC}  & cou6) ;
/*结果为0，Zero为1，否则为0*/
    assign  Zero =  ({Card == `ADD}  & add_result==0)  |
                    ({Card == `ADDC} & addc_result==0) |
                    ({Card == `SUB}  & sub_result==0)  |
                    ({Card == `SUBC} & subc_result==0) |
                    ({Card == `SUBF} & subf_result==0) |
                    ({Card == `SUBFC} & subfc_result==0)|
                    ({Card == `ISA}  & isa_result==0)  |
                    ({Card == `ISB}  & isb_result==0)  |
                    ({Card == `NOTA} & nota_result==0) |
                    ({Card == `NOTB}  & notb_result==0) |
                    ({Card == `OR}  & or_result==0)   |
                    ({Card == `AND}  & and_result==0)  |
                    ({Card == `SAOR}  & saor_result==0) |
                    ({Card == `DIOR} & dior_result==0) |
                    ({Card == `ANOT}  & anot_result==0) |
                    ({Card == `SETZ}  & setz_result==0);

endmodule
