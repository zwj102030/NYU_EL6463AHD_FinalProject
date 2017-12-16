--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:08:12 12/08/2017
-- Design Name:   
-- Module Name:   Y:/Desktop/New_Processor_R/Codes/FPGA_Demo_Plan/tb_FPGA_TOP.vhd
-- Project Name:  New_Processor_R
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FPGA_TOP
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
 
ENTITY tb_FPGA_TOP IS
END tb_FPGA_TOP;
 
ARCHITECTURE behavior OF tb_FPGA_TOP IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FPGA_TOP
    PORT(
         clk : IN  std_logic;
         sw : IN  std_logic_vector(15 downto 0);
         BTNC : IN  std_logic;
         BTND : IN  std_logic;
         BTNL : IN  std_logic;
         BTNR : IN  std_logic;
         BTNU : IN  std_logic;
         LED : OUT  std_logic_vector(15 downto 0);
         SEVENSEGMENT : OUT  std_logic_vector(6 downto 0);
         ANODE : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal sw : std_logic_vector(15 downto 0) := (others => '0');
   signal BTNC : std_logic := '0';
   signal BTND : std_logic := '0';
   signal BTNL : std_logic := '0';
   signal BTNR : std_logic := '0';
   signal BTNU : std_logic := '0';

 	--Outputs
   signal LED : std_logic_vector(15 downto 0);
   signal SEVENSEGMENT : std_logic_vector(6 downto 0);
   signal ANODE : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FPGA_TOP PORT MAP (
          clk => clk,
          sw => sw,
          BTNC => BTNC,
          BTND => BTND,
          BTNL => BTNL,
          BTNR => BTNR,
          BTNU => BTNU,
          LED => LED,
          SEVENSEGMENT => SEVENSEGMENT,
          ANODE => ANODE
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
--	-- BTNC as clk
--   btn_clk :process
--   begin
--		btn <= "00001";
--		wait for 50 ns;
--		btn <= "00000";
--		wait for 50 ns;
--   end process;
	
	
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
--		sw <= x"4800";
--		
--		wait for clk_period*1000;
		
		sw <= x"C800";
		
		wait for clk_period*1000;
		
--		sw <= x"2800";
--		
--		wait for clk_period*1000;
--		
--		sw <= x"1800";
--		
--		wait for clk_period*1000;
		
		
      wait;
   end process;

END;
