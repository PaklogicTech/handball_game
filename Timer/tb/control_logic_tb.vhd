library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;        -- for addition & counting
use ieee.numeric_std.all;               -- for type conversions
use ieee.math_real.all;                 -- for the ceiling and log constant calculation functions


entity control_logic_tb is
--	port (
--		clock : std_logic;
--	);
end control_logic_tb;

architecture behav of control_logic_tb is

	signal clock :  std_logic:='1';
	signal Key0 :  std_logic;
	signal key1 :  std_logic;
	signal key2 :  std_logic;
	signal sw :  std_logic;
	signal led_in :  std_logic;
	signal rst :  std_logic;
	signal enable :  std_logic;
	signal led_control :  std_logic_vector (7 downto 0);

begin
	i_control_logic : entity work.control_logic
		port map (
			clock       => clock      ,
			Key0        => Key0       ,
			key1        => key1       ,
			key2        => key2       ,
			sw          => sw         ,
			led_in      => led_in     ,
			rst         => rst        ,
			enable      => enable     ,
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
	led_in <='0';
wait for 15 ns; 
	sw<= '0';
	Key0 <= '1';
	wait for 100 ns;
	led_in <='1';
	wait for 10 ns;
	key1 <= '1';
	wait; 
end process ; -- stimulus

end architecture behav;
