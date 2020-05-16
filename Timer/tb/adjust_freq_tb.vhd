library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;        -- for addition & counting
use ieee.numeric_std.all;               -- for type conversions
use ieee.math_real.all;                 -- for the ceiling and log constant calculation functions

entity adjust_freq_tb is
	--port (
	--	clock : std_logic;
	--);
end adjust_freq_tb;

architecture behav of adjust_freq_tb is

	signal clock :  std_logic:='1';
	signal slw_clk:  std_logic;

begin
	i_adjust_freq : entity work.adjust_freq
		port map (
			clock   => clock  ,
			slw_clk => slw_clk
		);
	--------------------------------------------------------------------
  -- Clock process definitions
  ----------------------------------------------------------------
  sys_clock_sec : process
   begin
       wait for 10 ns; clock  <= not clock;
   end process sys_clock_sec;     
	
end architecture behav;