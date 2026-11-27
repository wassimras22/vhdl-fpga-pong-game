----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2026 03:53:52 PM
-- Design Name: 
-- Module Name: RasamnyWassim_InputBuffer - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RasamnyWassim_InputBuffer is
    Port ( clk : in STD_LOGIC;
           game_clk_in : in STD_LOGIC;
           p1 : in STD_LOGIC;
           p2 : in STD_LOGIC;
           reset_in : in STD_LOGIC;
           p1Buf : out STD_LOGIC;
           p2Buf : out STD_LOGIC;
           reset_out : out STD_LOGIC);
end RasamnyWassim_InputBuffer;

architecture Behavioral of RasamnyWassim_InputBuffer is

signal game_clk_d : std_logic := '0';

begin

clocking : process (clk, game_clk_in, p1, p2, reset_in)
begin
    if (rising_edge(clk)) then
        game_clk_d <= game_clk_in;
        if ((game_clk_d /= game_clk_in) and game_clk_in = '1') then
            p1Buf <= '0';
            p2Buf <= '0';
            reset_out <= '0';
        elsif (p1 = '1') then
            p1Buf <= '1';
        elsif (p2 = '1') then
            p2Buf <= '1';
        elsif (reset_in = '1') then
            reset_out <= '1';
        end if;
    end if;
end process;


end Behavioral;
