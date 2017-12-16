----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:57:19 12/02/2017 
-- Design Name: 
-- Module Name:    Halt_ctrl - Behavioral 
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

entity Halt_ctrl is
    Port ( halt : in  STD_LOGIC;
           en : in  STD_LOGIC;
           I0 : in  STD_LOGIC_VECTOR (31 downto 0);
           I1 : in  STD_LOGIC_VECTOR (31 downto 0);
           I2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  O : out  STD_LOGIC_VECTOR (31 downto 0));
end Halt_ctrl;

architecture Behavioral of Halt_ctrl is
signal Oh : STD_LOGIC_VECTOR (31 downto 0);
begin
	
	with en select Oh <=
	I1 when '0',
	I2 when '1',
	I1 when others;
	
	with halt select O <=
	I0 when '0',
	Oh when '1',
	I0 when others;
	
end Behavioral;

