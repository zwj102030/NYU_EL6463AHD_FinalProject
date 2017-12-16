----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:13:46 11/10/2017 
-- Design Name: 
-- Module Name:    control_unit - Behavioral 
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
use ieee.std_logic_arith.all;		 
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control_unit is
    Port ( op : in  STD_LOGIC_VECTOR (5 downto 0);
           funct : in  STD_LOGIC_VECTOR (5 downto 0);
           MemtoReg : out  STD_LOGIC;
           MemWrite : out  STD_LOGIC;
           Branch : out  STD_LOGIC;
           ALUControl : out  STD_LOGIC_VECTOR (3 downto 0);
           ALUSrc : out  STD_LOGIC;
           RegDst : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC;
			  Jump : out STD_LOGIC);
end control_unit;

architecture Behavioral of control_unit is

begin
	process1: Process(op, funct)
	begin
		if op = "000000" --R-type
			then
--				case funct is
--               when x"10" => ALUControl <= "000"; --add
--               when x"11" => ALUControl <= "001"; --sub
--               when x"12" => ALUControl <= "010"; --and
--					when x"13" => ALUControl <= "011"; -- or
--					when x"14" => ALUControl <= "100"; --nor
--               when others => ALUControl <= "000"; 
--           end case;
			  ALUControl <= funct(3 downto 0);
			  MemtoReg <= '0';
			  MemWrite <= '0';
			  Branch <= '0';
			  ALUSrc <= '0';
			  RegDst <= '1';
			  RegWrite <= '1';
			  Jump <= '0';
		elsif (op = "001100" or op = "111111") --J-type
			then
				ALUControl <= "0000";
				MemtoReg <= '0';
				MemWrite <= '0';
				Branch <= '0';
				ALUSrc <= '0'; --it dosent matter
				RegDst <= '0'; --it dosent matter
				RegWrite <= '0';
				Jump <= '1';
		else -- I-type
				case op(3 downto 0) is
               when "0001" => ALUControl <= "0000"; --addi
               when "0010" => ALUControl <= "0001"; --subi
               when "0011" => ALUControl <= "0010"; --andi
					when "0100" => ALUControl <= "0011"; -- ori
					when "0101" => ALUControl <= "0111"; -- shl
					when "0110" => ALUControl <= "1000"; -- shr 
					
					--branch
					when "1001" => ALUControl <= "0101"; -- if<
					when "1010" => ALUControl <= "0001"; -- use sub to judge if=
					when "1011" => ALUControl <= "0110"; -- if!=
					--branch
					
               when others => ALUControl <= "0000"; --add
           end case;
			  if op="000111" then MemtoReg <= '1'; else MemtoReg <= '0'; end if; --load word
			  if op="001000" then MemWrite <= '1'; else MemWrite <= '0'; end if; --store word
			  if (op="001001" or op="001010" or op="001011")    --Branch
					then Branch <= '1'; ALUSrc <= '0';
					else Branch <= '0'; ALUSrc <= '1';end if;  --if branch, ALUSrc = 0
			  
			  RegDst <= '0';
			  Jump <= '0';
			  
			  if (op="001001" or op="001010" or op="001011" or op = "001000")    --if store or Branch
					then RegWrite <= '0'; -- = 0
					else RegWrite <= '1';end if;  
		end if;
	end process;

end Behavioral;

