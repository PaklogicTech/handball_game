
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;        -- for addition & counting
use ieee.numeric_std.all;               -- for type conversions
use ieee.math_real.all;                 -- for the ceiling and log constant calculation functions



entity bcd_to_seven_segment is
  Port 
  (
  digit_in: in std_logic_vector (3 downto 0);
  o_segmentCathodes : out std_logic_vector (6 downto 0) 
  );
end bcd_to_seven_segment;

architecture Behavioral of bcd_to_seven_segment is



begin 

with digit_in select 
            o_segmentCathodes <= "0000001" when "0000",                                                     -- 0
            	"1001111" when "0001",                                                                      -- 1
            	"0010010" when "0010",                                                                      -- 2
            	"0000110" when "0011",                                                                      -- 3
            	"1001100" when "0100",                                                                      -- 4
            	"0100100" when "0101",                                                                      -- 5
            	"0100000" when "0110",                                                                      -- 6
            	"0001111" when "0111",                                                                      -- 7
            	"0000000" when "1000",                                                                      -- 8
            	"0000100" when "1001",                                                                      -- 9
            	"1111111" when others;                                                                      -- turn off all LEDs


end Behavioral;
