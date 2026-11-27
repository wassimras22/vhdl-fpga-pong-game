----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/27/2026 03:18:12 PM
-- Design Name: 
-- Module Name: RasamnyWaasim_StateMachine - Behavioral
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
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RasamnyWassim_StateMachine is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           player1 : in STD_LOGIC;
           player2 : in STD_LOGIC;
           state : out STD_LOGIC_VECTOR (3 downto 0);
           led : out STD_LOGIC_VECTOR (2 downto 0));
end RasamnyWassim_StateMachine;

architecture Behavioral of RasamnyWassim_StateMachine is

    signal current_state, next_state : std_logic_vector(3 downto 0);
    signal current_pos, next_pos : std_logic_vector(2 downto 0);

begin

    StateMachine : process (clk, reset)

    begin
            if (reset = '1') then   
                current_state <= "0000";
                current_pos <= "000";
            elsif rising_edge(clk) then
                current_state <= next_state;
                current_pos <= next_pos;
            end if;
    end process;

    Outputs : process (current_state, current_pos)
    begin
        if (current_state = "0000") then
            next_pos <= "001";
            next_state <= "0001";
        elsif (current_state = "0001") then
            if (current_pos = "110") then
                next_pos <= "111";
                next_state <= "0010";
            else
                next_pos <= current_pos + 1;
                next_state <= "0001";
            end if;
        elsif (current_state <= "0010") then
            if (player2 = '1') then
                next_pos <= "110";
                next_state <= "0011";
            else
                next_pos <= "000";
                next_state <= "0101";
            end if;
        elsif (current_state <= "0011") then
            if (current_pos = "001") then
                next_pos <= "000";
                next_state <= "0100";
            else
                next_pos <= current_pos - 1;
                next_state <= "0011";
            end if;
        elsif (current_state = "0100") then
            if (player1 = '1') then
                next_pos <= "001";
                next_state <= "0001";
            else
                next_pos <= "111";
                next_state <= "0110";
            end if;
        elsif (current_state = "0101") then
            next_pos <= "000";
            next_state <= "0001";
        elsif (current_state = "0110") then
            next_pos <= "111";
            next_state <= "0011";
            
        end if;
    end process;
    
    led <= current_pos;
    state <= current_state;

end Behavioral;
