----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:18:07 11/13/2017 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;
--use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is 
    Port ( SrcA : in  STD_LOGIC_VECTOR (31 downto 0);
           SrcB : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUCtrl : in  STD_LOGIC_VECTOR (3 downto 0);
           zero : out  STD_LOGIC;
           Result : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is
signal Result1 : STD_LOGIC_VECTOR (31 downto 0);
begin

	Process1: process(SrcA, SrcB, ALUCtrl, Result1)
		begin
			case ALUCtrl(3 downto 0) is
               when "0000" =>  --add
						Result1 <= SrcA+SrcB;
						if Result1 = x"00000000" then zero <='1'; else zero <= '0'; end if;
               when "0001" =>  --sub
						Result1 <= SrcA-SrcB;
						if Result1 = x"00000000" then zero <='1'; else zero <= '0'; end if;
               when "0010" =>  --and
						Result1 <= SrcA and SrcB;
						if Result1 = x"00000000" then zero <='1'; else zero <= '0'; end if;
					when "0011" =>  -- or
						Result1 <= SrcA or SrcB;
						if Result1 = x"00000000" then zero <='1'; else zero <= '0'; end if;
					when "0100" =>  --nor
						Result1 <= SrcA nor SrcB;
						if Result1 = x"00000000" then zero <='1'; else zero <= '0'; end if;
               when "0101" =>  --if<
						Result1 <= SrcA-SrcB;
						if Result1(31) = '1' then zero <='1'; else zero <= '0'; end if;
               when "0110" =>  --if!=
						Result1 <= SrcA-SrcB;
						if Result1 = x"00000000" then zero <='0'; else zero <= '1'; end if;
					when "0111" => --shl
						case SrcB(4 downto 0) is
							when "00001" =>
								Result1 <= (others => '0');
								Result1(31 DOWNTO 1)  <= SrcA(30 DOWNTO 0);
								
							when "00010" =>
								Result1 <= (others => '0');
								Result1(31 DOWNTO 2)  <= SrcA(29 DOWNTO 0);
							when "00011" =>
								Result1 <= (others => '0');
								Result1(31 DOWNTO 3)  <= SrcA(28 DOWNTO 0);
							when "00100" =>
								Result1 <= (others => '0');
								Result1(31 DOWNTO 4)  <= SrcA(27 DOWNTO 0);
							when "00101" =>
								Result1 <= (others => '0');
								Result1(31 DOWNTO 5)  <= SrcA(26 DOWNTO 0);
							when "00110" =>
								Result1 <= (others => '0');
								Result1(31 DOWNTO 6)  <= SrcA(25 DOWNTO 0);
							when "00111" =>
								Result1 <= (others => '0');
								Result1(31 DOWNTO 7)  <= SrcA(24 DOWNTO 0);
							when "01000" =>
								Result1 <= (others => '0');
								Result1(31 DOWNTO 8)  <= SrcA(23 DOWNTO 0);
							when "01001" =>
								Result1 <= (others => '0');
								Result1(31 DOWNTO 9)  <= SrcA(22 DOWNTO 0);
							when "01010" =>
								Result1 <= (others => '0');
								Result1(31 DOWNTO 10)  <= SrcA(21 DOWNTO 0);
							when "01011" =>
								Result1 <= (others => '0');
								Result1(31 DOWNTO 11)  <= SrcA(20 DOWNTO 0);
							when "01100" =>
								Result1 <= (others => '0');
								Result1(31 DOWNTO 12)  <= SrcA(19 DOWNTO 0);
							when "01101" =>
								Result1 <= (others => '0');
								Result1(31 DOWNTO 13)  <= SrcA(18 DOWNTO 0);
							when "01110" =>
								Result1 <= (others => '0');
								Result1(31 DOWNTO 14)  <= SrcA(17 DOWNTO 0);
							when "01111" =>
								Result1 <= (others => '0');
								Result1(31 DOWNTO 15)  <= SrcA(16 DOWNTO 0);
							when "10000" =>
								Result1 <= (others => '0');
								Result1(31 DOWNTO 16)  <= SrcA(15 DOWNTO 0);
							when "10001" =>
								Result1 <= (others => '0');
								Result1(31 DOWNTO 17)  <= SrcA(14 DOWNTO 0);
							when "10010" =>
								Result1 <= (others => '0');
								Result1(31 DOWNTO 18)  <= SrcA(13 DOWNTO 0);
							when "10011" =>
								Result1 <= (others => '0');
								Result1(31 DOWNTO 19)  <= SrcA(12 DOWNTO 0);
							when "10100" =>
								Result1 <= (others => '0');
								Result1(31 DOWNTO 20)  <= SrcA(11 DOWNTO 0);
							when "10101" =>
								Result1 <= (others => '0');
								Result1(31 DOWNTO 21)  <= SrcA(10 DOWNTO 0);
							when "10110" =>
								Result1 <= (others => '0');
								Result1(31 DOWNTO 22)  <= SrcA(9 DOWNTO 0);
							when "10111" =>
								Result1 <= (others => '0');
								Result1(31 DOWNTO 23)  <= SrcA(8 DOWNTO 0);
							when "11000" =>
								Result1 <= (others => '0');
								Result1(31 DOWNTO 24)  <= SrcA(7 DOWNTO 0);
							
							when "11001" =>
								Result1 <= (others => '0');
								Result1(31 DOWNTO 25)  <= SrcA(6 DOWNTO 0);
							when "11010" =>
								Result1 <= (others => '0');
								Result1(31 DOWNTO 26)  <= SrcA(5 DOWNTO 0);
							when "11011" =>
								Result1 <= (others => '0');
								Result1(31 DOWNTO 27)  <= SrcA(4 DOWNTO 0);
							when "11100" =>
								Result1 <= (others => '0');
								Result1(31 DOWNTO 28)  <= SrcA(3 DOWNTO 0);
								
							when "11101" =>
								Result1 <= (others => '0');
								Result1(31 DOWNTO 29)  <= SrcA(2 DOWNTO 0);
							when "11110" =>
								Result1 <= (others => '0');
								Result1(31 DOWNTO 30)  <= SrcA(1 DOWNTO 0);
							when "11111" =>
								Result1 <= (others => '0');
								Result1(31)  <= SrcA(0);
							when others => 
								Result1 <= SrcA;
						end case;
					when "1000" => --shr
						case SrcB(4 downto 0) is
							when "00001" =>
								Result1 <= (others => '0');
								Result1(30 DOWNTO 0)  <= SrcA(31 DOWNTO 1);
								
							when "00010" =>
								Result1 <= (others => '0');
								Result1(29 DOWNTO 0)  <= SrcA(31 DOWNTO 2);
							when "00011" =>
								Result1 <= (others => '0');
								Result1(28 DOWNTO 0)  <= SrcA(31 DOWNTO 3);
							when "00100" =>
								Result1 <= (others => '0');
								Result1(27 DOWNTO 0)  <= SrcA(31 DOWNTO 4);
							when "00101" =>
								Result1 <= (others => '0');
								Result1(26 DOWNTO 0)  <= SrcA(31 DOWNTO 5);
							when "00110" =>
								Result1 <= (others => '0');
								Result1(25 DOWNTO 0)  <= SrcA(31 DOWNTO 6);
							when "00111" =>
								Result1 <= (others => '0');
								Result1(24 DOWNTO 0)  <= SrcA(31 DOWNTO 7);
							when "01000" =>
								Result1 <= (others => '0');
								Result1(23 DOWNTO 0)  <= SrcA(31 DOWNTO 8);
							when "01001" =>
								Result1 <= (others => '0');
								Result1(22 DOWNTO 0)  <= SrcA(31 DOWNTO 9);
							when "01010" =>
								Result1 <= (others => '0');
								Result1(21 DOWNTO 0)  <= SrcA(31 DOWNTO 10);
							when "01011" =>
								Result1 <= (others => '0');
								Result1(20 DOWNTO 0)  <= SrcA(31 DOWNTO 11);
							when "01100" =>
								Result1 <= (others => '0');
								Result1(19 DOWNTO 0)  <= SrcA(31 DOWNTO 12);
							when "01101" =>
								Result1 <= (others => '0');
								Result1(18 DOWNTO 0)  <= SrcA(31 DOWNTO 13);
							when "01110" =>
								Result1 <= (others => '0');
								Result1(17 DOWNTO 0)  <= SrcA(31 DOWNTO 14);
							when "01111" =>
								Result1 <= (others => '0');
								Result1(16 DOWNTO 0)  <= SrcA(31 DOWNTO 15);
							when "10000" =>
								Result1 <= (others => '0');
								Result1(15 DOWNTO 0)  <= SrcA(31 DOWNTO 16);
							when "10001" =>
								Result1 <= (others => '0');
								Result1(14 DOWNTO 0)  <= SrcA(31 DOWNTO 17);
							when "10010" =>
								Result1 <= (others => '0');
								Result1(13 DOWNTO 0)  <= SrcA(31 DOWNTO 18);
							when "10011" =>
								Result1 <= (others => '0');
								Result1(12 DOWNTO 0)  <= SrcA(31 DOWNTO 19);
							when "10100" =>
								Result1 <= (others => '0');
								Result1(11 DOWNTO 0)  <= SrcA(31 DOWNTO 20);
							when "10101" =>
								Result1 <= (others => '0');
								Result1(10 DOWNTO 0)  <= SrcA(31 DOWNTO 21);
							when "10110" =>
								Result1 <= (others => '0');
								Result1(9 DOWNTO 0)  <= SrcA(31 DOWNTO 22);
							when "10111" =>
								Result1 <= (others => '0');
								Result1(8 DOWNTO 0)  <= SrcA(31 DOWNTO 23);
							when "11000" =>
								Result1 <= (others => '0');
								Result1(7 DOWNTO 0)  <= SrcA(31 DOWNTO 24);
							
							when "11001" =>
								Result1 <= (others => '0');
								Result1(6 DOWNTO 0)  <= SrcA(31 DOWNTO 25);
							when "11010" =>
								Result1 <= (others => '0');
								Result1(5 DOWNTO 0)  <= SrcA(31 DOWNTO 26);
							when "11011" =>
								Result1 <= (others => '0');
								Result1(4 DOWNTO 0)  <= SrcA(31 DOWNTO 27);
							when "11100" =>
								Result1 <= (others => '0');
								Result1(3 DOWNTO 0)  <= SrcA(31 DOWNTO 28);
								
							when "11101" =>
								Result1 <= (others => '0');
								Result1(2 DOWNTO 0)  <= SrcA(31 DOWNTO 29);
							when "11110" =>
								Result1 <= (others => '0');
								Result1(1 DOWNTO 0)  <= SrcA(31 DOWNTO 30);
							when "11111" =>
								Result1 <= (others => '0');
								Result1(0)  <= SrcA(31);
							when others => 
								Result1 <= SrcA;
						end case;
               when others =>  
						Result1 <= x"00000000";
						zero <= '0';
           end case;
		end process;
	
	Process2: process(Result1)
	begin
		Result <= Result1;
	end process;
	
end Behavioral;

