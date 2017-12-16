----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    14:15:39 11/17/2017
-- Design Name:
-- Module Name:    BTN_anti_coli - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BTN_anti_coli is
    Port (
			  clk		: in std_logic;
			  BTN_i	: in std_logic_vector(4 downto 0);
			  BTN_o	: out std_logic_vector(4 downto 0)
			  );
end BTN_anti_coli;

architecture Behavioral of BTN_anti_coli is

	component clk_divider is
  	 Port (
  			  clk : in  STD_LOGIC;
  			  BTN_clk : out  STD_LOGIC;
  			  Segment_clk : out std_logic
  			);
	end component;

  signal BTN_clk, Segment_clk	: STD_LOGIC;
  signal cnt_BTN_Pressed		: std_logic_vector(31 downto 0):= (others => '0');

begin

	Button_Clock: clk_divider port map(
		clk => clk,
		BTN_clk => BTN_clk,
		Segment_clk => Segment_clk
	);

  process( clk )
    begin
	     if rising_edge (clk) then
         if( BTN_i /= "00000" )then
           cnt_BTN_Pressed <= cnt_BTN_Pressed + 1;

           if ( cnt_BTN_Pressed(25)= '1' )then

                  case BTN_i is
                    when "00001" => BTN_o <= "00001"; -- BTNC
                    when "00010" => BTN_o <= "00010"; -- BTND
                    when "00100" => BTN_o <= "00100"; -- BTNL
                    when "01000" => BTN_o <= "01000"; -- BTNR
                    when "10000" => BTN_o <= "10000"; -- BTNU

                    when others => BTN_o <= "00000";  -- Default:= no BTN Pressed
                  end case;

                  cnt_BTN_Pressed <= (others => '0');
           else
                  BTN_o <= (others => '0');
           end if;
         end if;
       end if;
  end process;

end Behavioral;
