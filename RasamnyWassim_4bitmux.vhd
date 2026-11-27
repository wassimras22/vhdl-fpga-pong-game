----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/05/2026 07:04:26 PM
-- Design Name: 
-- Module Name: RasamnyWassim_mux - Behavioral
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

entity RasamnyWassim_4bitmux is
    Port ( clk1 : in std_logic_vector(3 downto 0);
           clk2 : in std_logic_vector(3 downto 0);
           sel : in STD_LOGIC;
           clk_out : out std_logic_vector(3 downto 0));
end RasamnyWassim_4bitmux;

architecture Behavioral of RasamnyWassim_4bitmux is

begin

clk_out <= clk1 when (sel = '0') else clk2;

end Behavioral;
