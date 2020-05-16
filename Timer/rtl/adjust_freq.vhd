library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;        -- for addition & counting
use ieee.numeric_std.all;               -- for type conversions
use ieee.math_real.all;                 -- for the ceiling and log constant calculation functions

entity adjust_freq is
	port (
		clock : in std_logic;
		slw_clk: out std_logic
	);
end adjust_freq;

architecture behav of adjust_freq is

signal prefix : std_logic_vector (31 downto 0) :=x"00000000" ;
signal temp: std_logic:='0';
begin
	freq_cnt : process (clock)
	begin
	  if (rising_edge(clock)) then
		if (prefix = x"0000000F") then  -- adjust according to board farmula is prefix = desired_freq/(fpga_freq/2)
	  		prefix <= x"00000000";
	  		temp <= not temp;
	  	else
	  		temp<=temp;
	  		prefix <= prefix+1;		
	  end if;
	end if;
	end process freq_cnt;
	slw_clk <= temp;
end architecture behav;