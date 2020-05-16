library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;        -- for addition & counting
use ieee.numeric_std.all;               -- for type conversions
use ieee.math_real.all;                 -- for the ceiling and log constant calculation functions




entity bcd_to_seven_segment_tb is
--  Port ( );
end bcd_to_seven_segment_tb;

architecture Behavioral of bcd_to_seven_segment_tb is
component bcd_to_seven_segment is
  Port 
  (
  digit_in: in std_logic_vector (3 downto 0);
  o_segmentCathodes : out std_logic_vector (6 downto 0) 
  );
end component;

signal  digit_in:  std_logic_vector (3 downto 0);
signal  o_segmentCathodes :  std_logic_vector (6 downto 0) ;
begin
UUT: bcd_to_seven_segment 
  Port map
  (
  digit_in=>digit_in,
  o_segmentCathodes=>o_segmentCathodes 
  );
  stim_proc: process
   begin
   -- hold reset state for 100 ns.
   digit_in<=x"0";
   wait for 50 ns;
   digit_in<=x"1";
  wait for 50 ns;
   digit_in<=x"2";
  wait for 50 ns;
  digit_in<=x"3";
  wait for 50 ns;
  digit_in<=x"4";
  wait for 50 ns;
  digit_in<=x"5";
  wait for 50 ns;
  digit_in<=x"6";
 wait for 50 ns;
  digit_in<=x"7";
 wait for 50 ns;
 digit_in<=x"8";
 wait for 50 ns;
 digit_in<=x"9";
     
       
   wait;
   end process stim_proc;  
end Behavioral;
