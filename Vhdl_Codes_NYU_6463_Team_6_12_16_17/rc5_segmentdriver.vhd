
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

entity rc5_segmentdriver is
   Port ( clk:in std_logic;
				  -- DISPLAY(3 downto 0),DISPLAY(7 downto 4),DISPLAY(11 downto 8),DISPLAY(15 downto 12),DISPLAY(19 downto 16),DISPLAY(23 downto 20),DISPLAY(27 downto 24),DISPLAY(31 downto 28) : in std_logic_vector(3 downto 0);
				  DISPLAY : IN STD_LOGIC_VECTOR(31 downto 0);
				  segA,segB,segC,segD,segE,segF,segG:out std_logic;
				  selectA,selectB,selectC,selectD,selectE,selectF,selectG,selectH:out std_logic);
end rc5_segmentdriver;

architecture Behavioral of rc5_segmentdriver is

  component segmentdecoder is
      Port ( Digit : in  STD_LOGIC_VECTOR (3 downto 0);
             segment_A : out  STD_LOGIC;
             segment_B : out  STD_LOGIC;
             segment_C : out  STD_LOGIC;
             segment_D : out  STD_LOGIC;
             segment_E : out  STD_LOGIC;
             segment_F : out  STD_LOGIC;
             segment_G : out  STD_LOGIC);
  end component;

  component clk_divider is
  	 Port (
  			  clk : in  STD_LOGIC;
  			  BTN_clk : out  STD_LOGIC;
  			  Segment_clk : out std_logic
  			);
	end component;

signal temporary_data : std_logic_vector(3 downto 0);
signal BTN_clk, Segment_clk: std_logic;

begin

  -- connect out
	SEG_dec: segmentdecoder port map(
		Digit => temporary_data,
		segment_A => segA,
		segment_B => segB,
		segment_C => segC,
		segment_D => segD,
		segment_E => segE,
		segment_F => segF,
		segment_G => segG
	);

	SEG_clk: clk_divider port map(
    clk => clk,
    BTN_clk => BTN_clk,
    Segment_clk => Segment_clk
  );

process(Segment_clk)
variable display_selection : std_logic_vector(2 downto 0);
begin
		--select which segment to display
		if(Segment_clk'event and Segment_clk = '1') then
			case display_selection is
				when "000" => temporary_data <= DISPLAY(3 downto 0);

					selectA <= '0';
					selectB <= '1';
					selectC <= '1';
					selectD <= '1';
					selectE <= '1';
					selectF <= '1';
					selectG <= '1';
					selectH <= '1';

					display_selection := display_selection + '1';
				when "001" => temporary_data <= DISPLAY(7 downto 4);

					selectA <= '1';
					selectB <= '0';
					selectC <= '1';
					selectD <= '1';
					selectE <= '1';
					selectF <= '1';
					selectG <= '1';
					selectH <= '1';
					display_selection := display_selection + '1';
				when "010" => temporary_data <= DISPLAY(11 downto 8);

					selectA <= '1';
					selectB <= '1';
					selectC <= '0';
					selectD <= '1';
					selectE <= '1';
					selectF <= '1';
					selectG <= '1';
					selectH <= '1';
					display_selection := display_selection + '1';
				when "011" => temporary_data <= DISPLAY(15 downto 12);

					selectA <= '1';
					selectB <= '1';
					selectC <= '1';
					selectD <= '0';
					selectE <= '1';
					selectF <= '1';
					selectG <= '1';
					selectH <= '1';
					display_selection := display_selection + '1';
				when "100" => temporary_data <= DISPLAY(19 downto 16);

					selectA <= '1';
					selectB <= '1';
					selectC <= '1';
					selectD <= '1';
					selectE <= '0';
					selectF <= '1';
					selectG <= '1';
					selectH <= '1';
					display_selection := display_selection + '1';
				when "101" => temporary_data <= DISPLAY(23 downto 20);

					selectA <= '1';
					selectB <= '1';
					selectC <= '1';
					selectD <= '1';
					selectE <= '1';
					selectF <= '0';
					selectG <= '1';
					selectH <= '1';
					display_selection := display_selection + '1';

				when "110" => temporary_data <= DISPLAY(27 downto 24);

					selectA <= '1';
					selectB <= '1';
					selectC <= '1';
					selectD <= '1';
					selectE <= '1';
					selectF <= '1';
					selectG <= '0';
					selectH <= '1';
					display_selection := display_selection + '1';

				when others => temporary_data <= DISPLAY(31 downto 28);

					selectA <= '1';
					selectB <= '1';
					selectC <= '1';
					selectD <= '1';
					selectE <= '1';
					selectF <= '1';
					selectG <= '1';
					selectH <= '0';
					display_selection := display_selection + '1';
				end case;
		end if;
end process;
end Behavioral;
