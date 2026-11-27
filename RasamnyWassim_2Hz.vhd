----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2026 10:44:51 AM
-- Design Name: 
-- Module Name: RasamnyWassim_2Hz - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_1164.ALL;

entity RasamnyWassim_2Hz is
    Port (
        clk_in : in STD_LOGIC;
        reset : in STD_LOGIC;
        clk_out: out STD_LOGIC
    );
end RasamnyWassim_2Hz;

architecture Behavioral of RasamnyWassim_2Hz is
    signal temporal: STD_LOGIC;
    signal counter : integer range 0 to 2999999 := 0;

begin
    frequency_divider: process (reset, clk_in) begin
        if (reset = '1') then
            temporal <= '0';
            counter <= 0;
        elsif rising_edge(clk_in) then
            if (counter = 2999999) then
                temporal <= NOT(temporal);
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    
    clk_out <= temporal;
        
end Behavioral;
