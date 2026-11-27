----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/05/2026 07:18:27 PM
-- Design Name: 
-- Module Name: RasamnyWassim_clockdivider - Behavioral
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

entity RasamnyWassim_clockdivider is
    Port ( rst : in STD_LOGIC;
           clk_12MHz : in STD_LOGIC;
           switch : in STD_LOGIC;
           clkout : out STD_LOGIC);
end RasamnyWassim_clockdivider;

architecture Behavioral of RasamnyWassim_clockdivider is

component RasamnyWassim_1Hz is
    Port (
        clk_in : in STD_LOGIC;
        reset : in STD_LOGIC;
        clk_out: out STD_LOGIC
    );
end component;

component RasamnyWassim_2Hz is
    Port (
        clk_in : in STD_LOGIC;
        reset : in STD_LOGIC;
        clk_out: out STD_LOGIC
    );
end component;

component RasamnyWassim_mux is
    Port ( clk1 : in STD_LOGIC;
           clk2 : in STD_LOGIC;
           sel : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end component;

signal clk_1hz : std_logic;
signal clk_2hz : std_logic;

begin

SlowClock: RasamnyWassim_1Hz port map (
    clk_in => clk_12MHz,
    reset => rst,
    clk_out => clk_1hz
);
FastClock: RasamnyWassim_2Hz port map (
    clk_in => clk_12MHz,
    reset => rst,
    clk_out => clk_2hz
);                                       
MuxSelect: RasamnyWassim_mux port map (
    clk1 => clk_1hz,
    clk2 => clk_2hz,
    sel => switch,
    clk_out => clkout
);     

end Behavioral;
