----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/27/2026 04:42:26 PM
-- Design Name: 
-- Module Name: RasamnyWassim_Main - Structural
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

entity RasamnyWassim_Main is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           player1 : in STD_LOGIC;
           player2 : in STD_LOGIC;
           sw : in STD_LOGIC;
           led : out STD_LOGIC_VECTOR (7 downto 0);
           seg : out STD_LOGIC_VECTOR (0 to 6);
           cat : out STD_LOGIC);
end RasamnyWassim_Main;

architecture Structural of RasamnyWassim_Main is

component RasamnyWassim_StateMachine is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           player1 : in STD_LOGIC;
           player2 : in STD_LOGIC;
           state : out STD_LOGIC_VECTOR (3 downto 0);
           led : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component RasamnyWassim_LED is
    Port ( led_array : in STD_LOGIC_VECTOR (2 downto 0);
           led : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component RasamnyWassim_clockdivider is
    Port ( rst : in STD_LOGIC;
           clk_12MHz : in STD_LOGIC;
           switch : in STD_LOGIC;
           clkout : out STD_LOGIC);
end component;

component RasamnyWassim_60Hz is
    Port (
        clk_in : in STD_LOGIC;
        reset : in STD_LOGIC;
        clk_out: out STD_LOGIC
    );
end component;

component RasamnyWassim_4bitmux is
    Port ( clk1 : in std_logic_vector(3 downto 0);
           clk2 : in std_logic_vector(3 downto 0);
           sel : in STD_LOGIC;
           clk_out : out std_logic_vector(3 downto 0));
end component;

component RasamnyWassim_ssd is
    Port ( sw : in STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (0 to 6));

end component;

component RasamnyWassim_Counter is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           state : in STD_LOGIC_VECTOR (3 downto 0);
           output1 : out STD_LOGIC_VECTOR (3 downto 0);
           output2 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component RasamnyWassim_InputBuffer is
    Port ( clk : in STD_LOGIC;
           game_clk_in : in STD_LOGIC;
           p1 : in STD_LOGIC;
           p2 : in STD_LOGIC;
           reset_in : in STD_LOGIC;
           p1Buf : out STD_LOGIC;
           p2Buf : out STD_LOGIC;
           reset_out : out STD_LOGIC);
end component;

signal game_clk : std_logic;
signal sig_state : std_logic_vector(3 downto 0);
signal led_pos : std_logic_vector(2 downto 0);
signal mux_out : std_logic_vector(3 downto 0);
signal sixty_hz : std_logic;

signal p1_Buf : std_logic;
signal p2_Buf : std_logic;
signal sig_reset_out : std_logic;
signal score1 : std_logic_vector(3 downto 0);
signal score2 : std_logic_vector(3 downto 0);

begin

StateMachine : RasamnyWassim_StateMachine port map (
    clk => game_clk,
    reset => reset,
    player1 => p1_Buf,
    player2 => p2_Buf,
    state => sig_state,
    led => led_pos
);

LEDArray : RasamnyWassim_LED port map (
    led_array => led_pos,
    led => led
);

ClockDivider : RasamnyWassim_clockdivider port map (
    rst => reset,
    clk_12MHz => clk,
    switch => sw,
    clkout => game_clk
);

SixtyHzDivider : RasamnyWassim_60Hz port map (
    clk_in => clk,
    reset => reset,
    clk_out => sixty_hz
);

FourBitMux : RasamnyWassim_4bitmux port map (
    clk1 => score1,
    clk2 => score2,
    sel => sixty_hz,
    clk_out => mux_out
);

SSD : RasamnyWassim_ssd port map (
    sw => mux_out,
    seg => seg
);

Counter : RasamnyWassim_Counter port map (
    clk => game_clk,
    reset => sig_reset_out,
    state => sig_state,
    output1 => score1,
    output2 => score2
);

InputBuffer : RasamnyWassim_InputBuffer port map (
    clk => clk,
    game_clk_in => game_clk,
    p1 => player1,
    p2 => player2,
    reset_in => reset,
    p1Buf => p1_Buf,
    p2Buf => p2_Buf,
    reset_out => sig_reset_out
);

cat <= sixty_hz;


end Structural;
