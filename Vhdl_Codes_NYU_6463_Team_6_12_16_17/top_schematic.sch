<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="artix7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="PCp1(31:0)" />
        <signal name="PCBranch(31:0)" />
        <signal name="PCSrc" />
        <signal name="PC1(31:0)" />
        <signal name="clk" />
        <signal name="PC(31:0)" />
        <signal name="Instr(31:0)" />
        <signal name="RegWrite" />
        <signal name="Instr(25:21)" />
        <signal name="Instr(20:16)" />
        <signal name="Instr(31:26)" />
        <signal name="SrcA(31:0)" />
        <signal name="SrcB(31:0)" />
        <signal name="WriteData(31:0)" />
        <signal name="ALUSrc" />
        <signal name="MemWrite" />
        <signal name="Instr(15:11)" />
        <signal name="WriteReg(4:0)" />
        <signal name="ReadData(31:0)" />
        <signal name="MemtoReg" />
        <signal name="ALUResult(31:0)" />
        <signal name="Instr(15:0)" />
        <signal name="Branch" />
        <signal name="Zero" />
        <signal name="SignImm(31:0)" />
        <signal name="RegDst" />
        <signal name="PCNext(31:0)" />
        <signal name="PCJump(31:0)" />
        <signal name="PCConcat(31:0)" />
        <signal name="Instr(25:0)" />
        <signal name="PCp1(31:26)" />
        <signal name="Jump" />
        <signal name="Instr(31)" />
        <signal name="halt_en" />
        <signal name="Instr(5:0)" />
        <signal name="XLXN_17(3:0)" />
        <signal name="Dout(63:0)" />
        <signal name="ukey(127:0)" />
        <signal name="Din(63:0)" />
        <signal name="en_din" />
        <signal name="en_ukey" />
        <signal name="Result(31:0)" />
        <signal name="clr_data_memory" />
        <signal name="RAM_OUT(0:63)" />
        <signal name="REG_OUT(0:31)" />
        <signal name="enc" />
        <signal name="dec" />
        <signal name="key_vld" />
        <signal name="key_rdy" />
        <signal name="enc_rdy" />
        <signal name="dec_rdy" />
        <port polarity="Input" name="clk" />
        <port polarity="Output" name="Instr(31:0)" />
        <port polarity="Output" name="RegWrite" />
        <port polarity="Output" name="SrcA(31:0)" />
        <port polarity="Output" name="SrcB(31:0)" />
        <port polarity="Output" name="MemWrite" />
        <port polarity="Output" name="ReadData(31:0)" />
        <port polarity="Output" name="ALUResult(31:0)" />
        <port polarity="Input" name="halt_en" />
        <port polarity="Output" name="Dout(63:0)" />
        <port polarity="Input" name="ukey(127:0)" />
        <port polarity="Input" name="Din(63:0)" />
        <port polarity="Input" name="en_din" />
        <port polarity="Input" name="en_ukey" />
        <port polarity="Input" name="clr_data_memory" />
        <port polarity="Output" name="RAM_OUT(0:63)" />
        <port polarity="Output" name="REG_OUT(0:31)" />
        <port polarity="Input" name="enc" />
        <port polarity="Input" name="dec" />
        <port polarity="Input" name="key_vld" />
        <port polarity="Output" name="key_rdy" />
        <port polarity="Output" name="enc_rdy" />
        <port polarity="Output" name="dec_rdy" />
        <blockdef name="mux2_32bit">
            <timestamp>2017-12-2T21:17:39</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <blockdef name="ROM_2to32_32bit">
            <timestamp>2017-12-2T21:17:48</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="Register_File">
            <timestamp>2017-12-7T19:52:29</timestamp>
            <rect width="64" x="384" y="20" height="24" />
            <line x2="448" y1="32" y2="32" x1="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="384" y="-364" height="24" />
            <line x2="448" y1="-352" y2="-352" x1="384" />
            <rect width="64" x="384" y="-44" height="24" />
            <line x2="448" y1="-32" y2="-32" x1="384" />
            <rect width="320" x="64" y="-384" height="448" />
        </blockdef>
        <blockdef name="control_unit">
            <timestamp>2017-12-2T21:18:14</timestamp>
            <rect width="256" x="64" y="-512" height="512" />
            <rect width="64" x="0" y="-492" height="24" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-480" y2="-480" x1="320" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="ALU">
            <timestamp>2017-12-2T21:19:7</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="DataMemory">
            <timestamp>2017-12-7T19:46:32</timestamp>
            <rect width="64" x="368" y="84" height="24" />
            <line x2="432" y1="96" y2="96" x1="368" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="368" y="-492" height="24" />
            <line x2="432" y1="-480" y2="-480" x1="368" />
            <rect width="64" x="368" y="-44" height="24" />
            <line x2="432" y1="-32" y2="-32" x1="368" />
            <rect width="304" x="64" y="-512" height="640" />
        </blockdef>
        <blockdef name="signext_16_to_32">
            <timestamp>2017-12-2T21:19:17</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <blockdef name="adder">
            <timestamp>2017-12-2T21:19:22</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="D_FF_32bit">
            <timestamp>2017-12-7T20:9:33</timestamp>
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="0" y1="96" y2="96" x1="64" />
            <line x2="0" y1="160" y2="160" x1="64" />
            <line x2="384" y1="32" y2="32" x1="320" />
            <line x2="384" y1="96" y2="96" x1="320" />
            <line x2="384" y1="160" y2="160" x1="320" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="256" x="64" y="-128" height="320" />
        </blockdef>
        <blockdef name="PCplus1">
            <timestamp>2017-12-2T21:19:31</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="mux2_5bit">
            <timestamp>2017-12-2T21:20:9</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <blockdef name="Concat_PCplus1_Address">
            <timestamp>2017-12-2T21:20:13</timestamp>
            <rect width="336" x="64" y="-128" height="128" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="400" y="-108" height="24" />
            <line x2="464" y1="-96" y2="-96" x1="400" />
        </blockdef>
        <blockdef name="Halt_ctrl">
            <timestamp>2017-12-2T21:20:18</timestamp>
            <rect width="256" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-300" height="24" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
        </blockdef>
        <block symbolname="mux2_32bit" name="XLXI_4">
            <blockpin signalname="PCSrc" name="S" />
            <blockpin signalname="PCp1(31:0)" name="I0(31:0)" />
            <blockpin signalname="PCBranch(31:0)" name="I1(31:0)" />
            <blockpin signalname="PC1(31:0)" name="O(31:0)" />
        </block>
        <block symbolname="ROM_2to32_32bit" name="XLXI_6">
            <blockpin signalname="PC(31:0)" name="Address(31:0)" />
            <blockpin signalname="Instr(31:0)" name="Data(31:0)" />
        </block>
        <block symbolname="Register_File" name="XLXI_7">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="RegWrite" name="WE" />
            <blockpin signalname="Instr(25:21)" name="Rd1(4:0)" />
            <blockpin signalname="Instr(20:16)" name="Rd2(4:0)" />
            <blockpin signalname="WriteReg(4:0)" name="Wrt(4:0)" />
            <blockpin signalname="Result(31:0)" name="WrtData(31:0)" />
            <blockpin signalname="SrcA(31:0)" name="RdData1(31:0)" />
            <blockpin signalname="WriteData(31:0)" name="RdData2(31:0)" />
            <blockpin signalname="REG_OUT(0:31)" name="REG_OUT(0:31)" />
        </block>
        <block symbolname="control_unit" name="XLXI_8">
            <blockpin signalname="Instr(31:26)" name="op(5:0)" />
            <blockpin signalname="Instr(5:0)" name="funct(5:0)" />
            <blockpin signalname="MemtoReg" name="MemtoReg" />
            <blockpin signalname="MemWrite" name="MemWrite" />
            <blockpin signalname="Branch" name="Branch" />
            <blockpin signalname="ALUSrc" name="ALUSrc" />
            <blockpin signalname="RegDst" name="RegDst" />
            <blockpin signalname="RegWrite" name="RegWrite" />
            <blockpin signalname="Jump" name="Jump" />
            <blockpin signalname="XLXN_17(3:0)" name="ALUControl(3:0)" />
        </block>
        <block symbolname="ALU" name="XLXI_9">
            <blockpin signalname="SrcA(31:0)" name="SrcA(31:0)" />
            <blockpin signalname="SrcB(31:0)" name="SrcB(31:0)" />
            <blockpin signalname="XLXN_17(3:0)" name="ALUCtrl(3:0)" />
            <blockpin signalname="Zero" name="zero" />
            <blockpin signalname="ALUResult(31:0)" name="Result(31:0)" />
        </block>
        <block symbolname="DataMemory" name="XLXI_10">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="MemWrite" name="we" />
            <blockpin signalname="en_din" name="en_din" />
            <blockpin signalname="en_ukey" name="en_ukey" />
            <blockpin signalname="clr_data_memory" name="clr" />
            <blockpin signalname="ALUResult(31:0)" name="Address(31:0)" />
            <blockpin signalname="WriteData(31:0)" name="WrtData(31:0)" />
            <blockpin signalname="ukey(127:0)" name="ukey(127:0)" />
            <blockpin signalname="Din(63:0)" name="Din(63:0)" />
            <blockpin signalname="ReadData(31:0)" name="RdData(31:0)" />
            <blockpin signalname="Dout(63:0)" name="Dout(63:0)" />
            <blockpin signalname="RAM_OUT(0:63)" name="RAM_OUT(0:63)" />
        </block>
        <block symbolname="mux2_32bit" name="XLXI_11">
            <blockpin signalname="ALUSrc" name="S" />
            <blockpin signalname="WriteData(31:0)" name="I0(31:0)" />
            <blockpin signalname="SignImm(31:0)" name="I1(31:0)" />
            <blockpin signalname="SrcB(31:0)" name="O(31:0)" />
        </block>
        <block symbolname="mux2_32bit" name="XLXI_13">
            <blockpin signalname="MemtoReg" name="S" />
            <blockpin signalname="ALUResult(31:0)" name="I0(31:0)" />
            <blockpin signalname="ReadData(31:0)" name="I1(31:0)" />
            <blockpin signalname="Result(31:0)" name="O(31:0)" />
        </block>
        <block symbolname="signext_16_to_32" name="XLXI_14">
            <blockpin signalname="Instr(15:0)" name="din(15:0)" />
            <blockpin signalname="SignImm(31:0)" name="dout(31:0)" />
        </block>
        <block symbolname="and2" name="XLXI_15">
            <blockpin signalname="Zero" name="I0" />
            <blockpin signalname="Branch" name="I1" />
            <blockpin signalname="PCSrc" name="O" />
        </block>
        <block symbolname="adder" name="XLXI_16">
            <blockpin signalname="PCp1(31:0)" name="a(31:0)" />
            <blockpin signalname="SignImm(31:0)" name="b(31:0)" />
            <blockpin signalname="PCBranch(31:0)" name="c(31:0)" />
        </block>
        <block symbolname="D_FF_32bit" name="XLXI_17">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="PCNext(31:0)" name="D(31:0)" />
            <blockpin signalname="PC(31:0)" name="Q(31:0)" />
            <blockpin signalname="key_vld" name="key_vld" />
            <blockpin signalname="enc" name="enc" />
            <blockpin signalname="dec" name="dec" />
            <blockpin signalname="key_rdy" name="key_rdy" />
            <blockpin signalname="enc_rdy" name="enc_rdy" />
            <blockpin signalname="dec_rdy" name="dec_rdy" />
        </block>
        <block symbolname="PCplus1" name="XLXI_18">
            <blockpin signalname="PC(31:0)" name="PC(31:0)" />
            <blockpin signalname="PCp1(31:0)" name="PCout(31:0)" />
        </block>
        <block symbolname="mux2_5bit" name="XLXI_19">
            <blockpin signalname="RegDst" name="S" />
            <blockpin signalname="Instr(20:16)" name="I0(4:0)" />
            <blockpin signalname="Instr(15:11)" name="I1(4:0)" />
            <blockpin signalname="WriteReg(4:0)" name="O(4:0)" />
        </block>
        <block symbolname="mux2_32bit" name="XLXI_20">
            <blockpin signalname="Jump" name="S" />
            <blockpin signalname="PC1(31:0)" name="I0(31:0)" />
            <blockpin signalname="PCJump(31:0)" name="I1(31:0)" />
            <blockpin signalname="PCNext(31:0)" name="O(31:0)" />
        </block>
        <block symbolname="Concat_PCplus1_Address" name="XLXI_25">
            <blockpin signalname="PCp1(31:26)" name="PCp1_6bit(5:0)" />
            <blockpin signalname="Instr(25:0)" name="Address(25:0)" />
            <blockpin signalname="PCConcat(31:0)" name="PCconcat(31:0)" />
        </block>
        <block symbolname="Halt_ctrl" name="XLXI_28">
            <blockpin signalname="Instr(31)" name="halt" />
            <blockpin signalname="halt_en" name="en" />
            <blockpin signalname="PCConcat(31:0)" name="I0(31:0)" />
            <blockpin signalname="PC(31:0)" name="I1(31:0)" />
            <blockpin signalname="PCp1(31:0)" name="I2(31:0)" />
            <blockpin signalname="PCJump(31:0)" name="O(31:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="336" y="592" name="XLXI_4" orien="R0">
        </instance>
        <branch name="PCp1(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="256" y="496" type="branch" />
            <wire x2="1760" y1="64" y2="64" x1="224" />
            <wire x2="1760" y1="64" y2="144" x1="1760" />
            <wire x2="224" y1="64" y2="496" x1="224" />
            <wire x2="224" y1="496" y2="1744" x1="224" />
            <wire x2="2320" y1="1744" y2="1744" x1="224" />
            <wire x2="256" y1="496" y2="496" x1="224" />
            <wire x2="336" y1="496" y2="496" x1="256" />
            <wire x2="1760" y1="144" y2="144" x1="1680" />
            <wire x2="2320" y1="1312" y2="1744" x1="2320" />
            <wire x2="2480" y1="1312" y2="1312" x1="2320" />
        </branch>
        <branch name="PCBranch(31:0)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="240" y="624" type="branch" />
            <wire x2="336" y1="560" y2="560" x1="240" />
            <wire x2="240" y1="560" y2="624" x1="240" />
            <wire x2="240" y1="624" y2="1680" x1="240" />
            <wire x2="2928" y1="1680" y2="1680" x1="240" />
            <wire x2="2928" y1="1312" y2="1312" x1="2864" />
            <wire x2="2928" y1="1312" y2="1680" x1="2928" />
        </branch>
        <branch name="PCSrc">
            <attrtext style="alignment:SOFT-TCENTER;fontsize:28;fontname:Arial" attrname="Name" x="240" y="432" type="branch" />
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="288" y="432" type="branch" />
            <wire x2="240" y1="240" y2="432" x1="240" />
            <wire x2="288" y1="432" y2="432" x1="240" />
            <wire x2="336" y1="432" y2="432" x1="288" />
            <wire x2="2672" y1="240" y2="240" x1="240" />
            <wire x2="2672" y1="240" y2="352" x1="2672" />
            <wire x2="2672" y1="352" y2="352" x1="2608" />
        </branch>
        <branch name="PC(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1360" y="304" type="branch" />
            <wire x2="1216" y1="128" y2="128" x1="1184" />
            <wire x2="1216" y1="128" y2="368" x1="1216" />
            <wire x2="1264" y1="368" y2="368" x1="1216" />
            <wire x2="1360" y1="368" y2="368" x1="1264" />
            <wire x2="1296" y1="144" y2="144" x1="1264" />
            <wire x2="1264" y1="144" y2="368" x1="1264" />
            <wire x2="1360" y1="304" y2="368" x1="1360" />
            <wire x2="1456" y1="304" y2="304" x1="1360" />
        </branch>
        <instance x="864" y="992" name="XLXI_7" orien="R0">
        </instance>
        <branch name="RegWrite">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="800" y="704" type="branch" />
            <wire x2="864" y1="704" y2="704" x1="800" />
        </branch>
        <branch name="Instr(25:21)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="768" y="768" type="branch" />
            <wire x2="864" y1="768" y2="768" x1="768" />
        </branch>
        <branch name="Instr(20:16)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="768" y="832" type="branch" />
            <wire x2="864" y1="832" y2="832" x1="768" />
        </branch>
        <branch name="Instr(31:26)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="784" y="1168" type="branch" />
            <wire x2="864" y1="1168" y2="1168" x1="784" />
        </branch>
        <branch name="SrcA(31:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1571" y="640" type="branch" />
            <wire x2="1424" y1="640" y2="640" x1="1312" />
            <wire x2="1904" y1="640" y2="640" x1="1424" />
            <wire x2="1424" y1="592" y2="640" x1="1424" />
            <wire x2="1488" y1="592" y2="592" x1="1424" />
        </branch>
        <branch name="SrcB(31:0)">
            <attrtext style="alignment:SOFT-BVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1888" y="704" type="branch" />
            <wire x2="1888" y1="736" y2="736" x1="1872" />
            <wire x2="1888" y1="496" y2="704" x1="1888" />
            <wire x2="1904" y1="704" y2="704" x1="1888" />
            <wire x2="1888" y1="704" y2="736" x1="1888" />
            <wire x2="1952" y1="496" y2="496" x1="1888" />
        </branch>
        <branch name="Instr(20:16)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1504" y="1552" type="branch" />
            <wire x2="1504" y1="1552" y2="1552" x1="1408" />
            <wire x2="1664" y1="1552" y2="1552" x1="1504" />
        </branch>
        <branch name="Instr(15:11)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1584" y="1616" type="branch" />
            <wire x2="1584" y1="1616" y2="1616" x1="1408" />
            <wire x2="1664" y1="1616" y2="1616" x1="1584" />
        </branch>
        <branch name="WriteReg(4:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="707" y="896" type="branch" />
            <wire x2="656" y1="896" y2="1056" x1="656" />
            <wire x2="2112" y1="1056" y2="1056" x1="656" />
            <wire x2="2112" y1="1056" y2="1488" x1="2112" />
            <wire x2="864" y1="896" y2="896" x1="656" />
            <wire x2="2112" y1="1488" y2="1488" x1="2048" />
        </branch>
        <instance x="3008" y="608" name="XLXI_13" orien="R0">
        </instance>
        <branch name="ReadData(31:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2989" y="576" type="branch" />
            <wire x2="2976" y1="576" y2="576" x1="2944" />
            <wire x2="3008" y1="576" y2="576" x1="2976" />
            <wire x2="2976" y1="576" y2="672" x1="2976" />
            <wire x2="3008" y1="672" y2="672" x1="2976" />
        </branch>
        <branch name="MemtoReg">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2912" y="448" type="branch" />
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2928" y="448" type="branch" />
            <wire x2="2928" y1="448" y2="448" x1="2912" />
            <wire x2="3008" y1="448" y2="448" x1="2928" />
        </branch>
        <instance x="1488" y="896" name="XLXI_11" orien="R0">
        </instance>
        <branch name="Instr(15:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1216" y="480" type="branch" />
            <wire x2="1280" y1="480" y2="480" x1="1216" />
        </branch>
        <branch name="Branch">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1312" y="1296" type="branch" />
            <wire x2="1312" y1="1296" y2="1296" x1="1248" />
        </branch>
        <instance x="2352" y="448" name="XLXI_15" orien="R0" />
        <instance x="1904" y="800" name="XLXI_9" orien="R0">
        </instance>
        <branch name="Zero">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2272" y="384" type="branch" />
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2272" y="448" type="branch" />
            <wire x2="2352" y1="384" y2="384" x1="2272" />
            <wire x2="2272" y1="384" y2="448" x1="2272" />
            <wire x2="2272" y1="448" y2="576" x1="2272" />
            <wire x2="2304" y1="576" y2="576" x1="2272" />
            <wire x2="2304" y1="576" y2="640" x1="2304" />
            <wire x2="2304" y1="640" y2="640" x1="2288" />
        </branch>
        <branch name="Branch">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2240" y="320" type="branch" />
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2304" y="320" type="branch" />
            <wire x2="2304" y1="320" y2="320" x1="2240" />
            <wire x2="2352" y1="320" y2="320" x1="2304" />
        </branch>
        <instance x="2480" y="1408" name="XLXI_16" orien="R0">
        </instance>
        <branch name="SignImm(31:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1695" y="1376" type="branch" />
            <wire x2="1424" y1="688" y2="864" x1="1424" />
            <wire x2="1488" y1="864" y2="864" x1="1424" />
            <wire x2="1424" y1="864" y2="1376" x1="1424" />
            <wire x2="2480" y1="1376" y2="1376" x1="1424" />
            <wire x2="1744" y1="688" y2="688" x1="1424" />
            <wire x2="1744" y1="480" y2="480" x1="1664" />
            <wire x2="1744" y1="480" y2="688" x1="1744" />
        </branch>
        <branch name="RegDst">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1377" y="1424" type="branch" />
            <wire x2="1456" y1="1424" y2="1424" x1="1248" />
            <wire x2="1456" y1="1424" y2="1488" x1="1456" />
            <wire x2="1664" y1="1488" y2="1488" x1="1456" />
        </branch>
        <instance x="1296" y="176" name="XLXI_18" orien="R0">
        </instance>
        <instance x="1664" y="1648" name="XLXI_19" orien="R0">
        </instance>
        <instance x="1456" y="336" name="XLXI_6" orien="R0">
        </instance>
        <branch name="Instr(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1872" y="304" type="branch" />
            <wire x2="1872" y1="304" y2="304" x1="1840" />
            <wire x2="1920" y1="304" y2="304" x1="1872" />
        </branch>
        <instance x="1280" y="512" name="XLXI_14" orien="R0">
        </instance>
        <branch name="PC1(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="784" y="432" type="branch" />
            <wire x2="784" y1="432" y2="432" x1="720" />
            <wire x2="864" y1="432" y2="432" x1="784" />
        </branch>
        <instance x="800" y="224" name="XLXI_17" orien="R0">
        </instance>
        <branch name="PCNext(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="624" y="192" type="branch" />
            <wire x2="624" y1="192" y2="192" x1="416" />
            <wire x2="800" y1="192" y2="192" x1="624" />
        </branch>
        <instance x="1632" y="2432" name="XLXI_20" orien="R0">
        </instance>
        <branch name="PCNext(31:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2160" y="2272" type="branch" />
            <wire x2="2160" y1="2272" y2="2272" x1="2016" />
        </branch>
        <branch name="PC1(31:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="1504" y="2336" type="branch" />
            <wire x2="1632" y1="2336" y2="2336" x1="1504" />
        </branch>
        <branch name="PCJump(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1360" y="2400" type="branch" />
            <wire x2="1232" y1="2368" y2="2400" x1="1232" />
            <wire x2="1360" y1="2400" y2="2400" x1="1232" />
            <wire x2="1632" y1="2400" y2="2400" x1="1360" />
        </branch>
        <branch name="PCConcat(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="704" y="2464" type="branch" />
            <wire x2="704" y1="2464" y2="2464" x1="592" />
            <wire x2="784" y1="2464" y2="2464" x1="704" />
            <wire x2="784" y1="2464" y2="2496" x1="784" />
            <wire x2="848" y1="2496" y2="2496" x1="784" />
        </branch>
        <instance x="128" y="2560" name="XLXI_25" orien="R0">
        </instance>
        <branch name="Instr(25:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="112" y="2528" type="branch" />
            <wire x2="112" y1="2528" y2="2528" x1="32" />
            <wire x2="128" y1="2528" y2="2528" x1="112" />
        </branch>
        <branch name="PCp1(31:26)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="112" y="2464" type="branch" />
            <wire x2="112" y1="2464" y2="2464" x1="16" />
            <wire x2="128" y1="2464" y2="2464" x1="112" />
        </branch>
        <text style="fontsize:32;fontname:Arial" x="780" y="2244">&gt; Halt</text>
        <text style="fontsize:32;fontname:Arial" x="1664" y="2104">&gt; J-type</text>
        <instance x="848" y="2656" name="XLXI_28" orien="R0">
        </instance>
        <branch name="Instr(31)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="800" y="2368" type="branch" />
            <wire x2="800" y1="2368" y2="2368" x1="752" />
            <wire x2="848" y1="2368" y2="2368" x1="800" />
        </branch>
        <branch name="PC(31:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="720" y="2560" type="branch" />
            <wire x2="848" y1="2560" y2="2560" x1="720" />
        </branch>
        <branch name="PCp1(31:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="720" y="2624" type="branch" />
            <wire x2="848" y1="2624" y2="2624" x1="720" />
        </branch>
        <branch name="halt_en">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="681" y="2192" type="branch" />
            <wire x2="704" y1="2192" y2="2192" x1="576" />
            <wire x2="704" y1="2192" y2="2432" x1="704" />
            <wire x2="848" y1="2432" y2="2432" x1="704" />
        </branch>
        <iomarker fontsize="28" x="576" y="2192" name="halt_en" orien="R180" />
        <branch name="clk">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="2464" y="576" type="branch" />
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="2502" y="576" type="branch" />
            <wire x2="2512" y1="576" y2="576" x1="2464" />
        </branch>
        <branch name="ALUSrc">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1334" y="1360" type="branch" />
            <wire x2="1344" y1="1360" y2="1360" x1="1248" />
            <wire x2="1344" y1="736" y2="1360" x1="1344" />
            <wire x2="1488" y1="736" y2="736" x1="1344" />
        </branch>
        <branch name="MemWrite">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1631" y="1232" type="branch" />
            <wire x2="1536" y1="1232" y2="1232" x1="1248" />
            <wire x2="2320" y1="1232" y2="1232" x1="1536" />
            <wire x2="1536" y1="1200" y2="1232" x1="1536" />
            <wire x2="1584" y1="1200" y2="1200" x1="1536" />
            <wire x2="2320" y1="640" y2="1232" x1="2320" />
            <wire x2="2512" y1="640" y2="640" x1="2320" />
        </branch>
        <branch name="MemtoReg">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1376" y="1168" type="branch" />
            <wire x2="1376" y1="1168" y2="1168" x1="1248" />
        </branch>
        <instance x="864" y="1648" name="XLXI_8" orien="R0">
        </instance>
        <branch name="Instr(5:0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:28;fontname:Arial" attrname="Name" x="768" y="1616" type="branch" />
            <wire x2="864" y1="1616" y2="1616" x1="768" />
        </branch>
        <branch name="RegWrite">
            <wire x2="1344" y1="1488" y2="1488" x1="1248" />
        </branch>
        <branch name="Jump">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1392" y="2109" type="branch" />
            <wire x2="1392" y1="1552" y2="1552" x1="1248" />
            <wire x2="1392" y1="1552" y2="2272" x1="1392" />
            <wire x2="1632" y1="2272" y2="2272" x1="1392" />
        </branch>
        <branch name="XLXN_17(3:0)">
            <wire x2="1312" y1="1616" y2="1616" x1="1248" />
            <wire x2="1312" y1="1392" y2="1616" x1="1312" />
            <wire x2="1888" y1="1392" y2="1392" x1="1312" />
            <wire x2="1888" y1="768" y2="1392" x1="1888" />
            <wire x2="1904" y1="768" y2="768" x1="1888" />
        </branch>
        <instance x="2512" y="1056" name="XLXI_10" orien="R0">
        </instance>
        <branch name="Dout(63:0)">
            <wire x2="3088" y1="1024" y2="1024" x1="2944" />
        </branch>
        <iomarker fontsize="28" x="3088" y="1024" name="Dout(63:0)" orien="R0" />
        <branch name="ukey(127:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2432" y="992" type="branch" />
            <wire x2="2432" y1="1008" y2="1008" x1="2048" />
            <wire x2="2432" y1="992" y2="1008" x1="2432" />
            <wire x2="2480" y1="992" y2="992" x1="2432" />
            <wire x2="2512" y1="960" y2="960" x1="2480" />
            <wire x2="2480" y1="960" y2="992" x1="2480" />
        </branch>
        <branch name="Din(63:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2464" y="1024" type="branch" />
            <wire x2="2464" y1="1024" y2="1024" x1="2256" />
            <wire x2="2512" y1="1024" y2="1024" x1="2464" />
        </branch>
        <branch name="ALUResult(31:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2464" y="512" type="branch" />
            <wire x2="2336" y1="768" y2="768" x1="2288" />
            <wire x2="2336" y1="768" y2="832" x1="2336" />
            <wire x2="2512" y1="832" y2="832" x1="2336" />
            <wire x2="2336" y1="448" y2="512" x1="2336" />
            <wire x2="2464" y1="512" y2="512" x1="2336" />
            <wire x2="3008" y1="512" y2="512" x1="2464" />
            <wire x2="2336" y1="512" y2="768" x1="2336" />
            <wire x2="2416" y1="448" y2="448" x1="2336" />
        </branch>
        <branch name="WriteData(31:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="1795" y="960" type="branch" />
            <wire x2="1328" y1="960" y2="960" x1="1312" />
            <wire x2="1328" y1="960" y2="992" x1="1328" />
            <wire x2="1488" y1="992" y2="992" x1="1328" />
            <wire x2="1360" y1="960" y2="960" x1="1328" />
            <wire x2="2160" y1="960" y2="960" x1="1360" />
            <wire x2="2352" y1="960" y2="960" x1="2160" />
            <wire x2="1488" y1="800" y2="800" x1="1360" />
            <wire x2="1360" y1="800" y2="960" x1="1360" />
            <wire x2="2160" y1="912" y2="960" x1="2160" />
            <wire x2="2512" y1="896" y2="896" x1="2352" />
            <wire x2="2352" y1="896" y2="960" x1="2352" />
        </branch>
        <branch name="en_din">
            <wire x2="2512" y1="704" y2="704" x1="2480" />
        </branch>
        <iomarker fontsize="28" x="2480" y="704" name="en_din" orien="R180" />
        <branch name="en_ukey">
            <wire x2="2512" y1="768" y2="768" x1="2480" />
        </branch>
        <iomarker fontsize="28" x="2480" y="768" name="en_ukey" orien="R180" />
        <branch name="Result(31:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:28;fontname:Arial" attrname="Name" x="3132" y="1072" type="branch" />
            <wire x2="864" y1="960" y2="960" x1="800" />
            <wire x2="800" y1="960" y2="1072" x1="800" />
            <wire x2="3456" y1="1072" y2="1072" x1="800" />
            <wire x2="3456" y1="448" y2="448" x1="3392" />
            <wire x2="3456" y1="448" y2="1072" x1="3456" />
        </branch>
        <branch name="clr_data_memory">
            <wire x2="2512" y1="1088" y2="1088" x1="2480" />
        </branch>
        <iomarker fontsize="28" x="2480" y="1088" name="clr_data_memory" orien="R180" />
        <iomarker fontsize="28" x="2048" y="1008" name="ukey(127:0)" orien="R180" />
        <iomarker fontsize="28" x="2256" y="1024" name="Din(63:0)" orien="R180" />
        <branch name="RAM_OUT(0:63)">
            <wire x2="3056" y1="1152" y2="1152" x1="2944" />
        </branch>
        <iomarker fontsize="28" x="3056" y="1152" name="RAM_OUT(0:63)" orien="R0" />
        <branch name="REG_OUT(0:31)">
            <wire x2="1504" y1="1024" y2="1024" x1="1312" />
        </branch>
        <iomarker fontsize="28" x="1504" y="1024" name="REG_OUT(0:31)" orien="R0" />
        <iomarker fontsize="28" x="1344" y="1488" name="RegWrite" orien="R0" />
        <iomarker fontsize="28" x="1584" y="1200" name="MemWrite" orien="R0" />
        <iomarker fontsize="28" x="2416" y="448" name="ALUResult(31:0)" orien="R0" />
        <iomarker fontsize="28" x="1920" y="304" name="Instr(31:0)" orien="R0" />
        <iomarker fontsize="28" x="1488" y="592" name="SrcA(31:0)" orien="R0" />
        <iomarker fontsize="28" x="1952" y="496" name="SrcB(31:0)" orien="R0" />
        <iomarker fontsize="28" x="3008" y="672" name="ReadData(31:0)" orien="R0" />
        <branch name="enc">
            <wire x2="800" y1="320" y2="320" x1="784" />
        </branch>
        <iomarker fontsize="28" x="688" y="128" name="clk" orien="R180" />
        <iomarker fontsize="28" x="784" y="320" name="enc" orien="R180" />
        <branch name="dec">
            <wire x2="800" y1="384" y2="384" x1="768" />
        </branch>
        <iomarker fontsize="28" x="768" y="384" name="dec" orien="R180" />
        <branch name="clk">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="768" y="128" type="branch" />
            <wire x2="736" y1="128" y2="128" x1="688" />
            <wire x2="768" y1="128" y2="128" x1="736" />
            <wire x2="800" y1="128" y2="128" x1="768" />
            <wire x2="736" y1="128" y2="256" x1="736" />
            <wire x2="768" y1="256" y2="256" x1="736" />
            <wire x2="768" y1="256" y2="368" x1="768" />
            <wire x2="816" y1="368" y2="368" x1="768" />
            <wire x2="816" y1="368" y2="640" x1="816" />
            <wire x2="864" y1="640" y2="640" x1="816" />
        </branch>
        <branch name="key_vld">
            <wire x2="704" y1="256" y2="256" x1="640" />
            <wire x2="704" y1="224" y2="256" x1="704" />
            <wire x2="784" y1="224" y2="224" x1="704" />
            <wire x2="784" y1="224" y2="256" x1="784" />
            <wire x2="800" y1="256" y2="256" x1="784" />
        </branch>
        <iomarker fontsize="28" x="640" y="256" name="key_vld" orien="R180" />
        <branch name="enc_rdy">
            <wire x2="1280" y1="320" y2="320" x1="1184" />
        </branch>
        <branch name="dec_rdy">
            <wire x2="1424" y1="384" y2="384" x1="1184" />
        </branch>
        <branch name="key_rdy">
            <wire x2="1200" y1="256" y2="256" x1="1184" />
            <wire x2="1200" y1="192" y2="256" x1="1200" />
            <wire x2="1296" y1="192" y2="192" x1="1200" />
        </branch>
        <iomarker fontsize="28" x="1296" y="192" name="key_rdy" orien="R0" />
        <iomarker fontsize="28" x="1280" y="320" name="enc_rdy" orien="R0" />
        <iomarker fontsize="28" x="1424" y="384" name="dec_rdy" orien="R0" />
    </sheet>
</drawing>