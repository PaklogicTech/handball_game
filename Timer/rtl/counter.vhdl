library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter is
	port (
		clock       : in  std_logic ;                   -- system clock of 1 Hz after frequncy divider
		Key0        : in  std_logic ;                   -- start timer for first half
	--	key1        : in  std_logic ;                   -- start timer for 2nd half and reset 1st
		key2        : in  std_logic ;                   -- change period
		sw          : in  std_logic ;                   -- start the game
		sec_out_0   : out std_logic_vector(3 downto 0); -- second to display
		sec_out_1   : out std_logic_vector(3 downto 0); -- second to display
		min_out_0   : out std_logic_vector(3 downto 0); -- Minute to display
		min_out_1   : out std_logic_vector(3 downto 0); -- Minute to display
		half_disp_0 : out std_logic_vector(3 downto 0); --period display
		half_disp_1 : out std_logic_vector(3 downto 0);  -- period display
		led: out std_logic
	);
end counter;

architecture behavior of counter is

	signal  temp_count_digit_0 : std_logic_vector (3 downto 0);
	signal  temp_count_digit_1 : std_logic_vector (3 downto 0);
	signal  temp_count_digit_2 : std_logic_vector (3 downto 0);
	signal  temp_count_digit_3 : std_logic_vector (3 downto 0);

	constant max_count_0 : STD_LOGIC_VECTOR (3 downto 0) := x"9";
	constant max_count_1 : STD_LOGIC_VECTOR (3 downto 0) := x"5"; 
	constant max_count_2 : STD_LOGIC_VECTOR (3 downto 0) := x"0"; 
	constant max_count_3 : STD_LOGIC_VECTOR (3 downto 0) := x"3";  
begin
	time_count : process (sw,clock)
	begin
		if (sw='1') then
			temp_count_digit_0 <=x"0";
			temp_count_digit_1 <=x"0";
			temp_count_digit_2 <=x"a";
			temp_count_digit_3 <=x"3";
		else
		if (rising_edge(clock)) then
			if (key0 = '1') then
				if temp_count_digit_0 /= max_count_0 then
					temp_count_digit_0 <= temp_count_digit_0 + 1;
				elsif temp_count_digit_0 = max_count_0 and temp_count_digit_1 /= max_count_1 then
					temp_count_digit_0 <= (others => '0');
					temp_count_digit_1 <= temp_count_digit_1 + 1;
						elsif temp_count_digit_0 = max_count_0 and temp_count_digit_1 = max_count_1 and temp_count_digit_2 /= max_count_2 then

							temp_count_digit_2 <= temp_count_digit_2 - 1;
							temp_count_digit_0 <= (others => '0');
								temp_count_digit_1 <= (others => '0');

							if (temp_count_digit_3= x"3") then
								temp_count_digit_3<=temp_count_digit_3-1;
							else
								temp_count_digit_3<=temp_count_digit_3;				
							end if;
							
								
							elsif temp_count_digit_0 = max_count_0 and temp_count_digit_1 = max_count_1 and temp_count_digit_2 = max_count_2 and temp_count_digit_3 /= max_count_3 then

								temp_count_digit_0 <= (others => '0');
								temp_count_digit_1 <= (others => '0');
								temp_count_digit_2 <= x"9";
								temp_count_digit_3 <= temp_count_digit_3 - 1;

							else 			
			temp_count_digit_0 <=x"0";
			temp_count_digit_1 <=x"0";
			temp_count_digit_2 <=x"a";
			temp_count_digit_3 <=x"3";
								end if;
								end if;
							end if;
						end if;

		end process time_count;
period_select : process (sw, clock)
begin
  if (sw = '1') then
    half_disp_0 <= x"0";
	half_disp_1	<= x"0";
  elsif (rising_edge(clock)) then
  		if (key2= '1') then
  			    half_disp_0 <= x"1";
				half_disp_1	<= x"0";
  		end if;
  end if;
end process period_select;

led_stage : process (sw,temp_count_digit_1,temp_count_digit_0,temp_count_digit_2,temp_count_digit_3)
begin
  if (sw = '1') then
    led <='0';
  	elsif temp_count_digit_0=x"0" and temp_count_digit_1=x"0" and temp_count_digit_2=x"0" and temp_count_digit_3=x"0" then
  	led <='1';
  	else
  		led<='0';
  end if;

end process led_stage;

		sec_out_0 <= temp_count_digit_0;		
		sec_out_1 <= temp_count_digit_1;
		min_out_0 <= temp_count_digit_2;
		min_out_1 <= temp_count_digit_3;


end architecture behavior;