----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    14:16:49 11/17/2017
-- Design Name:
-- Module Name:    clk_divider - Behavioral
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

entity clk_divider is
 Port (
		  clk : in  STD_LOGIC;
        BTN_clk : out  STD_LOGIC;
        Segment_clk : out std_logic
		);
end clk_divider;

architecture Behavioral of clk_divider is

  signal prescaler_BTN : STD_LOGIC_VECTOR(31 downto 0) := "00000001000000000000000000000000";
  signal pre_count_BTN : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

  signal prescaler_Segment : STD_LOGIC_VECTOR(16 downto 0) := "11000011010100000";
  signal pre_count_Segment : STD_LOGIC_VECTOR(16 downto 0) := (others => '0');

  type SLOW_CLOCK is (High, Low);
  signal BTN_clk_state , SEG_clk_state : SLOW_CLOCK;

begin
  -- SLOW_CLOCK For BTN
  process( clk )
    begin
      if rising_edge (clk) then
        pre_count_BTN <= pre_count_BTN + 1;

        case BTN_clk_state is
          when High => BTN_clk <= '1';
                        if ( pre_count_BTN = prescaler_BTN )then
                          BTN_clk_state <= Low;
                          pre_count_BTN <= (others => '0');
                        end if;
          when Low  => BTN_clk <= '0';
                        if ( pre_count_BTN = prescaler_BTN )then
                          BTN_clk_state <= High;
                          pre_count_BTN <= (others => '0');
                        end if;
        end case;

      end if;
  end process;

  -- SLOW_CLOCK For 7-Segments
  process( clk )
    begin
      if rising_edge (clk) then
        pre_count_Segment <= pre_count_Segment + 1;

        case SEG_clk_state is
          when High => Segment_clk <= '1';
                        if ( pre_count_Segment = prescaler_Segment )then
                          SEG_clk_state <= Low;
                          pre_count_Segment <= (others => '0');
                        end if;
          when Low  => Segment_clk <= '0';
                        if ( pre_count_Segment = prescaler_Segment )then
                          SEG_clk_state <= High;
                          pre_count_Segment <= (others => '0');
                        end if;
        end case;

      end if;
  end process;

end Behavioral;
