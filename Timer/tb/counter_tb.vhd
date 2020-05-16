library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.NUMERIC_STD.ALL;


entity counter_tb is
	--port (
	--	clock : std_logic;
	--);
end counter_tb;

architecture behave of counter_tb is

--------------------------------------------------------------------------------
-- Internal Signals
--------------------------------------------------------------------------------

	signal clock :  std_logic:='1';
	signal Key0 :  std_logic;
--	signal key1 :  std_logic;
	signal key2 :  std_logic;
	signal sw :  std_logic;
	signal sec_out_0 :  std_logic_vector(3 downto 0);
	signal sec_out_1 :  std_logic_vector(3 downto 0);
	signal min_out_0 :  std_logic_vector(3 downto 0);
	signal min_out_1 :  std_logic_vector(3 downto 0);
	signal half_disp_0 :  std_logic_vector(3 downto 0);
	signal half_disp_1 :  std_logic_vector(3 downto 0);
	signal led: std_logic;
begin
	
-----------------------------------------------------------------------------
	-- Module Instantiation
	-----------------------------------------------------------------------------

	i_counter : entity work.counter
		port map (
			clock       => clock      ,
			Key0        => Key0       ,
		--	key1        => key1       ,
			key2        => key2       ,
			sw          => sw         ,
			sec_out_0   => sec_out_0  ,
			sec_out_1   => sec_out_1  ,
			min_out_0   => min_out_0  ,
			min_out_1   => min_out_1  ,
			half_disp_0 => half_disp_0,
			half_disp_1 => half_disp_1,
			led=>led
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
	--key1<='0';
	key2<='0';
wait for 10 ns; 
	sw<= '0';
	Key0 <= '1';
	wait; 
end process ; -- stimulus
end architecture behave;