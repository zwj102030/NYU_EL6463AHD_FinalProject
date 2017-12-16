

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:26:24 12/08/2017 
-- Design Name: 
-- Module Name:    test_MIPS_clk - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_MIPS_clk is
port(
	clk : in std_logic;
	sw, btn: in std_logic;
	MIPS_clk: inout std_logic
);
end test_MIPS_clk;

architecture Behavioral of test_MIPS_clk is

	-- Determine MIPS's clock (user decide to run Single step or ALL Instr)
	signal clk_detected 		 : STD_LOGIC:= '0';
	signal clk_detected_past : STD_LOGIC;

begin

-- Determine MIPS's clock
	process( clk )
		begin
				clk_detected_past <= clk_detected;
	end process;

	-- Detect MIPS_CLOCK, clk_detected is used by Determine MIPS's clock process
	process( clk )
		begin
			if rising_edge( clk ) then
				if sw = '1' then					-- FULL
						clk_detected <= not(clk_detected);
				else													-- SINGLE
						clk_detected <= clk_detected;
				end if;
			end if;
	end process;

	-- Determine MIPS's clock
	process( clk, clk_detected )
		begin
			if( btn = '1' or clk_detected_past /= clk_detected )then
				MIPS_clk <= clk;			-- full run
			else
				MIPS_clk <= MIPS_clk;	-- signle steps
			end if;
	end process;

end Behavioral;

