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

entity RasamnyWassim_mux is
    Port ( clk1 : in STD_LOGIC;
           clk2 : in STD_LOGIC;
           sel : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end RasamnyWassim_mux;

architecture Behavioral of RasamnyWassim_mux is

begin

clk_out <= clk1 when (sel = '0') else clk2;

end Behavioral;
