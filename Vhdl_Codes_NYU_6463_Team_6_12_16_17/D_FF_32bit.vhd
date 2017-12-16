----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    19:01:33 11/10/2017
-- Design Name:
-- Module Name:    D_FF_32bit - Behavioral
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

entity D_FF_32bit is
    Port (  D : in  STD_LOGIC_VECTOR (31 downto 0);
            clk : in  STD_LOGIC;
            Q : out  STD_LOGIC_VECTOR (31 downto 0);
    			  key_vld : in  STD_LOGIC;
    			  enc : in  STD_LOGIC;
    			  dec : in  STD_LOGIC
--    			  key_rdy : out STD_LOGIC;
--    			  enc_rdy : out STD_LOGIC;
--    			  dec_rdy : out STD_LOGIC
            );
end D_FF_32bit;

architecture Behavioral of D_FF_32bit is

begin
	Process1 :process( clk, key_vld, enc, dec )
	begin
		
			if key_vld = '1' and enc = '0' and dec = '0' then
				--Q <= x"00000000"; -- 0
				Q <= "00000000000000000000000000000000"; -- 0
			elsif key_vld = '0' and enc = '1' and dec = '0'  then
--				Q <= x"000000C8"; -- 200
				Q <= "00000000000000000000000001100101"; -- 101
			elsif key_vld = '0' and enc = '0' and dec = '1'  then
--				Q <= x"00000190"; -- 400
				Q <= "00000000000000000000000011001001"; -- 201
			else
				if (clk = '1' and clk'Event) then
				Q <= D;
				end if;
			end if;


--    if D = x"000000C8" then
--      key_rdy <= '1';
--    elsif D = x"000000190" then
--      enc_rdy <= '1';
--    elsif D = x"000000258" then
--      dec_rdy <= '1';
--    else
--      key_rdy <= '0'; enc_rdy <= '0'; dec_rdy <= '0';
--    end if;

	end process;

end Behavioral;
