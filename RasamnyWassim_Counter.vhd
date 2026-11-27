----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2026 03:11:37 PM
-- Design Name: 
-- Module Name: RasamnyWassim_Counter - Behavioral
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
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity RasamnyWassim_Counter is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           state : in STD_LOGIC_VECTOR (3 downto 0);
           output1 : out STD_LOGIC_VECTOR (3 downto 0);
           output2 : out STD_LOGIC_VECTOR (3 downto 0));
end RasamnyWassim_Counter;

architecture Behavioral of RasamnyWassim_Counter is

signal player1 : std_logic_vector(3 downto 0) := "0000";
signal player2 : std_logic_vector(3 downto 0) := "0000";

begin process(clk, reset, state)
    begin
        if (reset = '1') then
            player1 <= "0000";
            player2 <= "0000";
        elsif (rising_edge(clk)) then
            if (state = "0101") then
                if (player1 < 9) then
                    player1 <= player1 + 1;
                else
                    player1 <= "0000";
                    player2 <= "0000";
                end if;
            
            elsif (state = "0110") then
                if (player2 < 9) then
                    player2 <= player2 + 1;
                else
                    player1 <= "0000";
                    player2 <= "0000";
                end if;
            end if;
        end if;
    end process;
    
    output1 <= player1;
    output2 <= player2;
        
end Behavioral;
