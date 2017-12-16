----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:47:39 11/10/2017 
-- Design Name: 
-- Module Name:    Register_File - Behavioral 
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
use ieee.std_logic_unsigned.all;
use work.def.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Register_File is
    Port ( clk : in  STD_LOGIC;
           WE : in  STD_LOGIC; --write enable
           Rd1 : in  STD_LOGIC_VECTOR (4 downto 0):= "00000"; --read register address
           Rd2 : in  STD_LOGIC_VECTOR (4 downto 0):= "00000";
           Wrt : in  STD_LOGIC_VECTOR (4 downto 0):= "00000"; --write register address
           WrtData : in  STD_LOGIC_VECTOR (31 downto 0); --write data
           RdData1 : out  STD_LOGIC_VECTOR (31 downto 0);
           RdData2 : out  STD_LOGIC_VECTOR (31 downto 0);
			  REG_OUT : out Register_Data);
end Register_File;

architecture Behavioral of Register_File is
--type Register_Data is array (0 to 31) of std_logic_vector(31 downto 0); --32 x 32bits data in reg.
																					-- initialize when simulation
signal r : Register_Data := (others => (others=> '0'));		
--signal Wrti,Rd1i,Rd2i : integer;
begin

	
	Process1 :process(clk, WE)
	begin
		if (clk = '1' and clk'Event) then --write before read
		
			if WE = '1' then					
				r(conv_integer('0'&Wrt(4 downto 0))) <= WrtData;
			end if;	
		--if Wrti = Rd1i then
		--		RdData1 <= WrtData;
				
			--end if;
			
			--if Wrti = Rd2i then
			--	RdData2 <= WrtData;
		end if;
	end process;

	RdData1 <= r(conv_integer('0'&Rd1(4 downto 0)));
	RdData2 <= r(conv_integer('0'&Rd2(4 downto 0)));
	REG_OUT <= r;
	
end Behavioral;

