--------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:   13:46:07 12/09/2017
-- Design Name:
-- Module Name:   C:/Users/dian/New_Processor_R/tb_mips.vhd
-- Project Name:  New_Processor_R
-- Target Device:
-- Tool versions:
-- Description:
--
-- VHDL Test Bench Created by ISE for module: top_code
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes:
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

ENTITY tb_mips IS
END tb_mips;

ARCHITECTURE behavior OF tb_mips IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT top_code
    PORT(
         clk : IN  std_logic;
         clr_data_memory : IN  std_logic;
         dec : IN  std_logic;
         Din : IN  std_logic_vector(63 downto 0);
         enc : IN  std_logic;
         en_din : IN  std_logic;
         en_ukey : IN  std_logic;
         halt_en : IN  std_logic;
         key_vld : IN  std_logic;
         ukey : IN  std_logic_vector(127 downto 0);
         ALUResult : OUT  std_logic_vector(31 downto 0);
         Dout : OUT  std_logic_vector(63 downto 0);
         Instr : OUT  std_logic_vector(31 downto 0);
         MemWrite : OUT  std_logic;
         ReadData : OUT  std_logic_vector(31 downto 0);
         RegWrite : OUT  std_logic;
         SrcA : OUT  std_logic_vector(31 downto 0);
         SrcB : OUT  std_logic_vector(31 downto 0);
         PC_FPGA : out   std_logic_vector (31 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal clk : std_logic := '0';
   signal clr_data_memory : std_logic := '0';
   signal dec : std_logic := '0';
   signal Din : std_logic_vector(63 downto 0) := (others => '0');
   signal enc : std_logic := '0';
   signal en_din : std_logic := '0';
   signal en_ukey : std_logic := '0';
   signal halt_en : std_logic := '0';
   signal key_vld : std_logic := '0';
   signal ukey : std_logic_vector(127 downto 0) := (others => '0');

 	--Outputs
   signal ALUResult : std_logic_vector(31 downto 0);
   signal Dout : std_logic_vector(63 downto 0);
   signal Instr : std_logic_vector(31 downto 0);
   signal MemWrite : std_logic;
   signal ReadData : std_logic_vector(31 downto 0);
   signal RegWrite : std_logic;
   signal SrcA : std_logic_vector(31 downto 0);
   signal SrcB : std_logic_vector(31 downto 0);
   signal PC : std_logic_vector (31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: top_code PORT MAP (
          clk => clk,
          clr_data_memory => clr_data_memory,
          dec => dec,
          Din => Din,
          enc => enc,
          en_din => en_din,
          en_ukey => en_ukey,
          halt_en => halt_en,
          key_vld => key_vld,
          ukey => ukey,
          ALUResult => ALUResult,
          Dout => Dout,
          Instr => Instr,
          MemWrite => MemWrite,
          ReadData => ReadData,
          RegWrite => RegWrite,
          SrcA => SrcA,
          SrcB => SrcB,
          PC_FPGA => PC
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;


   -- Stimulus process
   stim_proc: process
   begin
      -- hold reset state for 100 ns.
      wait for 1000 ns;

--		 key_vld <= '1';
--		 wait for 20 ns;
--		 key_vld <= '0';
--		 wait for 20 ns;
--		 
--		 halt_en <= '1';
--		 wait for 20 ns;
--		 
--		
--       halt_en <= '0';
--       wait for 10 us;
--
--		 enc <= '1';
--		 wait for 20 ns;
--		 enc <= '0';
--		 wait for 20 ns;
--		 halt_en <= '1';
--		 wait for 20 ns;
--		
--		 halt_en <= '0';
--		 wait for 10 us;
--
--		 dec <= '1';
--		 wait for 20 ns;
--		 dec <= '0';
--		 wait for 20 ns;
--		 halt_en <= '1';
--		 wait for 20 ns;
--		
--		 halt_en <= '0';
--		 wait for 10 us;
		 
		 -- Instr => Halt_en
		 key_vld <= '1';
		 wait for 20 ns;
		 key_vld <= '0';
		 wait for 1 ms;

		 enc <= '1';
		 wait for 20 ns;
		 enc <= '0';
		 wait for 1 ms;

		 dec <= '1';
		 wait for 20 ns;
		 dec <= '0';
		 wait for 1 ms;
		 
--		 -- halt_en first, then force PC
--		 halt_en <= '1';
--		 wait for 20 ns;
--		 halt_en <= '0';
--		 wait for 20 ns;
--		 
--		 key_vld <= '1';
--		 wait for 20 ns;
--		 key_vld <= '0';
--		 wait for 20 ns;

      wait;
   end process;

END;
