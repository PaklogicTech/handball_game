library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;        -- for addition & counting
use ieee.numeric_std.all;               -- for type conversions
use ieee.math_real.all;                 -- for the ceiling and log constant calculation functions

entity top_hand_ball_game_tb is
--	port (
--		clock : std_logic;
--	);
end top_hand_ball_game_tb;

architecture behav of top_hand_ball_game_tb is

	signal clock :  std_logic:='1';
	signal Key0 :  std_logic;
	signal key1 :  std_logic;
	signal key2 :  std_logic;
	signal sw :  std_logic;
	signal hex_0 :  std_logic_vector(6 downto 0);
	signal hex_1 :  std_logic_vector(6 downto 0);
	signal hex_2 :  std_logic_vector(6 downto 0);
	signal hex_3 :  std_logic_vector(6 downto 0);
	signal hex_4 :  std_logic_vector(6 downto 0);
	signal hex_5 :  std_logic_vector(6 downto 0);
	signal led_control :  std_logic_vector(7 downto 0);

begin
	i_top_hand_ball_game : entity work.top_hand_ball_game
		port map (
			clock       => clock      ,
			Key0        => Key0       ,
			key1        => key1       ,
			key2        => key2       ,
			sw          => sw         ,
			hex_0       => hex_0      ,
			hex_1       => hex_1      ,
			hex_2       => hex_2      ,
			hex_3       => hex_3      ,
			hex_4       => hex_4      ,
			hex_5       => hex_5      ,
			led_control => led_control
		);

	--------------------------------------------------------------------
  -- Clock process definitions
  ----------------------------------------------------------------
  sys_clock_sec : process
   begin
       wait for 10 ns; clock  <= not clock;
   end process sys_clock_sec;     
   -------------------------------------------------------------------
   -- Stimulus process
 -------------------------------------------------------------------
	stimulus : process
begin
	sw<= '1';
	Key0 <= '0';
	key1<='0';
	key2<='0';
	
wait for 15 ns; 
	sw<= '0';
	Key0 <= '1';
	wait for 1000 ns;
	key1 <= '1';
	wait; 
end process ; -- stimulus
end architecture behav;