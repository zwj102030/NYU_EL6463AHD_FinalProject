--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : top_schematic.vhf
-- /___/   /\     Timestamp : 12/07/2017 15:14:14
-- \   \  /  \
--  \___\/\___\
--
--Command: C:\Xilinx\14.7\ISE_DS\ISE\bin\nt64\unwrapped\sch2hdl.exe -intstyle ise -family artix7 -flat -suppress -vhdl top_schematic.vhf -w C:/Users/dian/New_Processor_R/Codes/top_schematic.sch
--Design Name: top_schematic
--Device: artix7
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be
--    synthesized and simulated, but it should not be modified.
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;
use work.def.all;

entity top_code is
   port ( clk             : in    std_logic;
          clr_data_memory : in    std_logic;
          dec             : in    std_logic;
          Din             : in    std_logic_vector (63 downto 0);
          enc             : in    std_logic;
          en_din          : in    std_logic;
          en_ukey         : in    std_logic;
          halt_en         : in    std_logic;
          key_vld         : in    std_logic;
          ukey            : in    std_logic_vector (127 downto 0);
          ALUResult       : out   std_logic_vector (31 downto 0);
          --dec_rdy         : out   std_logic;
          Dout            : out   std_logic_vector (63 downto 0);
          --enc_rdy         : out   std_logic;
          Instr           : out   std_logic_vector (31 downto 0);
          --key_rdy         : out   std_logic;
          MemWrite        : out   std_logic;
          RAM_OUT         : out   RAM_Array;
          ReadData        : out   std_logic_vector (31 downto 0);
          RegWrite        : out   std_logic;
          REG_OUT         : out   Register_Data;
          SrcA            : out   std_logic_vector (31 downto 0);
          SrcB            : out   std_logic_vector (31 downto 0);
			 PC_FPGA			  : out   std_logic_vector (31 downto 0));
end top_code;

architecture BEHAVIORAL of top_code is
   attribute BOX_TYPE   : string ;
   signal ALUSrc          : std_logic;
   signal Branch          : std_logic;
   signal Jump            : std_logic;
   signal MemtoReg        : std_logic;
   signal PC              : std_logic_vector (31 downto 0);
   signal PCBranch        : std_logic_vector (31 downto 0);
   signal PCConcat        : std_logic_vector (31 downto 0);
   signal PCJump          : std_logic_vector (31 downto 0);
   signal PCNext          : std_logic_vector (31 downto 0);
   signal PCp1            : std_logic_vector (31 downto 0);
   signal PCSrc           : std_logic;
   signal PC1             : std_logic_vector (31 downto 0);
   signal RegDst          : std_logic;
   signal Result          : std_logic_vector (31 downto 0);
   signal SignImm         : std_logic_vector (31 downto 0);
   signal WriteData       : std_logic_vector (31 downto 0);
   signal WriteReg        : std_logic_vector (4 downto 0);
   signal XLXN_17         : std_logic_vector (3 downto 0);
   signal Zero            : std_logic;
   signal ALUResult_DUMMY : std_logic_vector (31 downto 0);
   signal ReadData_DUMMY  : std_logic_vector (31 downto 0);
   signal MemWrite_DUMMY  : std_logic;
   signal RegWrite_DUMMY  : std_logic;
   signal SrcA_DUMMY      : std_logic_vector (31 downto 0);
   signal SrcB_DUMMY      : std_logic_vector (31 downto 0);
   signal Instr_DUMMY     : std_logic_vector (31 downto 0);
   component mux2_32bit
      port ( S  : in    std_logic;
             I0 : in    std_logic_vector (31 downto 0);
             I1 : in    std_logic_vector (31 downto 0);
             O  : out   std_logic_vector (31 downto 0));
   end component;

   component ROM_2to32_32bit
      port ( Address : in    std_logic_vector (31 downto 0);
             Data    : out   std_logic_vector (31 downto 0));
   end component;

   component Register_File
      port ( clk     : in    std_logic;
             WE      : in    std_logic;
             Rd1     : in    std_logic_vector (4 downto 0);
             Rd2     : in    std_logic_vector (4 downto 0);
             Wrt     : in    std_logic_vector (4 downto 0);
             WrtData : in    std_logic_vector (31 downto 0);
             RdData1 : out   std_logic_vector (31 downto 0);
             RdData2 : out   std_logic_vector (31 downto 0);
             REG_OUT : out   Register_Data);
   end component;

   component control_unit
      port ( op         : in    std_logic_vector (5 downto 0);
             funct      : in    std_logic_vector (5 downto 0);
             MemtoReg   : out   std_logic;
             MemWrite   : out   std_logic;
             Branch     : out   std_logic;
             ALUSrc     : out   std_logic;
             RegDst     : out   std_logic;
             RegWrite   : out   std_logic;
             Jump       : out   std_logic;
             ALUControl : out   std_logic_vector (3 downto 0));
   end component;

   component ALU
      port ( SrcA    : in    std_logic_vector (31 downto 0);
             SrcB    : in    std_logic_vector (31 downto 0);
             ALUCtrl : in    std_logic_vector (3 downto 0);
             zero    : out   std_logic;
             Result  : out   std_logic_vector (31 downto 0));
   end component;

   component DataMemory
      port ( clk     : in    std_logic;
             we      : in    std_logic;
             en_din  : in    std_logic;
             en_ukey : in    std_logic;
             clr     : in    std_logic;
             Address : in    std_logic_vector (31 downto 0);
             WrtData : in    std_logic_vector (31 downto 0);
             ukey    : in    std_logic_vector (127 downto 0);
             Din     : in    std_logic_vector (63 downto 0);
             RdData  : out   std_logic_vector (31 downto 0);
             Dout    : out   std_logic_vector (63 downto 0);
             RAM_OUT : out   RAM_Array);
   end component;

   component signext_16_to_32
      port ( din  : in    std_logic_vector (15 downto 0);
             dout : out   std_logic_vector (31 downto 0));
   end component;

   component AND2
      port ( I0 : in    std_logic;
             I1 : in    std_logic;
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";

   component adder
      port ( a : in    std_logic_vector (31 downto 0);
             b : in    std_logic_vector (31 downto 0);
             c : out   std_logic_vector (31 downto 0));
   end component;

   component D_FF_32bit
      port ( clk     : in    std_logic;
             D       : in    std_logic_vector (31 downto 0);
             Q       : out   std_logic_vector (31 downto 0);
             key_vld : in    std_logic;
             enc     : in    std_logic;
             dec     : in    std_logic
--             key_rdy : out   std_logic;
--             enc_rdy : out   std_logic;
--             dec_rdy : out   std_logic
				 );
   end component;

   component PCplus1
      port ( PC    : in    std_logic_vector (31 downto 0);
             PCout : out   std_logic_vector (31 downto 0));
   end component;

   component mux2_5bit
      port ( S  : in    std_logic;
             I0 : in    std_logic_vector (4 downto 0);
             I1 : in    std_logic_vector (4 downto 0);
             O  : out   std_logic_vector (4 downto 0));
   end component;

   component Concat_PCplus1_Address
      port ( PCp1_6bit : in    std_logic_vector (5 downto 0);
             Address   : in    std_logic_vector (25 downto 0);
             PCconcat  : out   std_logic_vector (31 downto 0));
   end component;

   component Halt_ctrl
      port ( halt : in    std_logic;
             en   : in    std_logic;
             I0   : in    std_logic_vector (31 downto 0);
             I1   : in    std_logic_vector (31 downto 0);
             I2   : in    std_logic_vector (31 downto 0);
             O    : out   std_logic_vector (31 downto 0));
   end component;

begin
	-- for display current PC on FPGA
	PC_FPGA <= PC;

   ALUResult(31 downto 0) <= ALUResult_DUMMY(31 downto 0);
   Instr(31 downto 0) <= Instr_DUMMY(31 downto 0);
   MemWrite <= MemWrite_DUMMY;
   ReadData(31 downto 0) <= ReadData_DUMMY(31 downto 0);
   RegWrite <= RegWrite_DUMMY;
   SrcA(31 downto 0) <= SrcA_DUMMY(31 downto 0);
   SrcB(31 downto 0) <= SrcB_DUMMY(31 downto 0);
   XLXI_4 : mux2_32bit
      port map (I0(31 downto 0)=>PCp1(31 downto 0),
                I1(31 downto 0)=>PCBranch(31 downto 0),
                S=>PCSrc,
                O(31 downto 0)=>PC1(31 downto 0));

   I_Mem : ROM_2to32_32bit
      port map (Address(31 downto 0)=>PC(31 downto 0),
                Data(31 downto 0)=>Instr_DUMMY(31 downto 0));

   RF : Register_File
      port map (clk=>clk,
                Rd1(4 downto 0)=>Instr_DUMMY(25 downto 21),
                Rd2(4 downto 0)=>Instr_DUMMY(20 downto 16),
                WE=>RegWrite_DUMMY,
                Wrt(4 downto 0)=>WriteReg(4 downto 0),
                WrtData(31 downto 0)=>Result(31 downto 0),
                RdData1(31 downto 0)=>SrcA_DUMMY(31 downto 0),
                RdData2(31 downto 0)=>WriteData(31 downto 0),
                REG_OUT =>REG_OUT );

   Decoder : control_unit
      port map (funct(5 downto 0)=>Instr_DUMMY(5 downto 0),
                op(5 downto 0)=>Instr_DUMMY(31 downto 26),
                ALUControl(3 downto 0)=>XLXN_17(3 downto 0),
                ALUSrc=>ALUSrc,
                Branch=>Branch,
                Jump=>Jump,
                MemtoReg=>MemtoReg,
                MemWrite=>MemWrite_DUMMY,
                RegDst=>RegDst,
                RegWrite=>RegWrite_DUMMY);

   ALU_Unit : ALU
      port map (ALUCtrl(3 downto 0)=>XLXN_17(3 downto 0),
                SrcA(31 downto 0)=>SrcA_DUMMY(31 downto 0),
                SrcB(31 downto 0)=>SrcB_DUMMY(31 downto 0),
                Result(31 downto 0)=>ALUResult_DUMMY(31 downto 0),
                zero=>Zero);

   Data_Mem : DataMemory
      port map (Address(31 downto 0)=>ALUResult_DUMMY(31 downto 0),
                clk=>clk,
                clr=>clr_data_memory,
                Din(63 downto 0)=>Din(63 downto 0),
                en_din=>en_din,
                en_ukey=>en_ukey,
                ukey(127 downto 0)=>ukey(127 downto 0),
                we=>MemWrite_DUMMY,
                WrtData(31 downto 0)=>WriteData(31 downto 0),
                Dout(63 downto 0)=>Dout(63 downto 0),
                RAM_OUT =>RAM_OUT ,
                RdData(31 downto 0)=>ReadData_DUMMY(31 downto 0));

   XLXI_11 : mux2_32bit
      port map (I0(31 downto 0)=>WriteData(31 downto 0),
                I1(31 downto 0)=>SignImm(31 downto 0),
                S=>ALUSrc,
                O(31 downto 0)=>SrcB_DUMMY(31 downto 0));

   XLXI_13 : mux2_32bit
      port map (I0(31 downto 0)=>ALUResult_DUMMY(31 downto 0),
                I1(31 downto 0)=>ReadData_DUMMY(31 downto 0),
                S=>MemtoReg,
                O(31 downto 0)=>Result(31 downto 0));

   XLXI_14 : signext_16_to_32
      port map (din(15 downto 0)=>Instr_DUMMY(15 downto 0),
                dout(31 downto 0)=>SignImm(31 downto 0));

   XLXI_15 : AND2
      port map (I0=>Zero,
                I1=>Branch,
                O=>PCSrc);

   PC_Branch : adder
      port map (a(31 downto 0)=>PCp1(31 downto 0),
                b(31 downto 0)=>SignImm(31 downto 0),
                c(31 downto 0)=>PCBranch(31 downto 0));

   PC_ff : D_FF_32bit
      port map (clk=>clk,
                D(31 downto 0)=>PCNext(31 downto 0),
                dec=>dec,
                enc=>enc,
                key_vld=>key_vld,
--                dec_rdy=>dec_rdy,
--                enc_rdy=>enc_rdy,
--                key_rdy=>key_rdy,
                Q(31 downto 0)=>PC(31 downto 0));

   pc_Plus_one : PCplus1
      port map (PC(31 downto 0)=>PC(31 downto 0),
                PCout(31 downto 0)=>PCp1(31 downto 0));

   XLXI_19 : mux2_5bit
      port map (I0(4 downto 0)=>Instr_DUMMY(20 downto 16),
                I1(4 downto 0)=>Instr_DUMMY(15 downto 11),
                S=>RegDst,
                O(4 downto 0)=>WriteReg(4 downto 0));

   XLXI_20 : mux2_32bit
      port map (I0(31 downto 0)=>PC1(31 downto 0),
                I1(31 downto 0)=>PCJump(31 downto 0),
                S=>Jump,
                O(31 downto 0)=>PCNext(31 downto 0));

   Jump_Address : Concat_PCplus1_Address
      port map (Address(25 downto 0)=>Instr_DUMMY(25 downto 0),
                PCp1_6bit(5 downto 0)=>PCp1(31 downto 26),
                PCconcat(31 downto 0)=>PCConcat(31 downto 0));

   Halt_Control : Halt_ctrl
      port map (en=>halt_en,
                halt=>Instr_DUMMY(31),
                I0(31 downto 0)=>PCConcat(31 downto 0),
                I1(31 downto 0)=>PC(31 downto 0),
                I2(31 downto 0)=>PCp1(31 downto 0),
                O(31 downto 0)=>PCJump(31 downto 0));

end BEHAVIORAL;
