----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/18/2026 10:18:58 AM
-- Design Name: 
-- Module Name: RasamnyWassim_ssd - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

entity RasamnyWassim_ssd is
    Port ( sw : in STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (0 to 6));

end RasamnyWassim_ssd;

architecture Behavioral of RasamnyWassim_ssd is

begin



with sw select
    seg <= "1111110" when "0000",
           "0110000" when "0001",
           "1101101" when "0010",
           "1111001" when "0011",
           "0110011" when "0100",
           "1011011" when "0101",
           "1011111" when "0110",
           "1110000" when "0111",
           "1111111" when "1000",
           "1111011" when "1001",
           "1110111" when "1010",
           "0011111" when "1011",
           "1001110" when "1100",
           "0111101" when "1101",
           "1001111" when "1110",
           "1000111" when "1111",
           "0000000" when others;

end Behavioral;
