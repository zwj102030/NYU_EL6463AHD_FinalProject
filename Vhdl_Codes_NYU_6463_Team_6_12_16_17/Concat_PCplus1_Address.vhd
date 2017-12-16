----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:29:53 11/17/2017 
-- Design Name: 
-- Module Name:    Concat_PCplus1_Address - Behavioral 
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

entity Concat_PCplus1_Address is
    Port ( PCp1_6bit : in  STD_LOGIC_VECTOR (5 downto 0);
           Address : in  STD_LOGIC_VECTOR (25 downto 0);
           PCconcat : out  STD_LOGIC_VECTOR (31 downto 0));
end Concat_PCplus1_Address;

architecture Behavioral of Concat_PCplus1_Address is

begin

	PCconcat <= PCp1_6bit & Address;

end Behavioral;

