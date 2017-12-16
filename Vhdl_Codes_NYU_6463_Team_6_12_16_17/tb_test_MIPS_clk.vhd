--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:36:19 12/08/2017
-- Design Name:   
-- Module Name:   Y:/Desktop/New_Processor_R/Codes/FPGA_Demo_Plan/tb_test_MIPS_clk.vhd
-- Project Name:  New_Processor_R
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: test_MIPS_clk
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
 
ENTITY tb_test_MIPS_clk IS
END tb_test_MIPS_clk;
 
ARCHITECTURE behavior OF tb_test_MIPS_clk IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT test_MIPS_clk
    PORT(
         clk : IN  std_logic;
         sw : IN  std_logic;
         btn : IN  std_logic;
         MIPS_clk : INOUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal sw : std_logic := '0';
   signal btn : std_logic := '0';

	--BiDirs
   signal MIPS_clk : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
   constant MIPS_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: test_MIPS_clk PORT MAP (
          clk => clk,
          sw => sw,
          btn => btn,
          MIPS_clk => MIPS_clk
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
   MIPS_clk_process :process
   begin
		MIPS_clk <= '0';
		wait for MIPS_clk_period/2;
		MIPS_clk <= '1';
		wait for MIPS_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		sw <= '1';
		wait for clk_period*10;
		
		sw <= '0';
		wait for clk_period*2;
		
		btn <= '1';
		wait for clk_period;
		
		btn <= '0';
		wait for clk_period*10;
		
		
		btn <= '1';
		wait for clk_period;
		
		btn <= '0';
		wait for clk_period*10;
		
      wait;
   end process;

END;
