library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; -- for addition & counting
use ieee.numeric_std.all;        -- for type conversions
use ieee.math_real.all;          -- for the ceiling and log constant calculation functions

entity top_hand_ball_game is
	port (
		clock       : in  std_logic ;                   -- system clock of 1 Hz after frequncy divider
		Key0        : in  std_logic ;                   -- start timer for first half
		key1        : in  std_logic ;                   -- start timer for 2nd half and rst 1st
		key2        : in  std_logic ;                   -- change period
		sw          : in  std_logic ;                   -- start the game
		hex_0       : out std_logic_vector(6 downto 0); -- second to display
		hex_1       : out std_logic_vector(6 downto 0); -- second to display
		hex_2       : out std_logic_vector(6 downto 0); -- Minute to display
		hex_3       : out std_logic_vector(6 downto 0); -- Minute to display
		hex_4       : out std_logic_vector(6 downto 0); --period display
		hex_5       : out std_logic_vector(6 downto 0); -- period display
		led_control : out std_logic_vector(7 downto 0)
	);
end top_hand_ball_game;

architecture behvior of top_hand_ball_game is
	signal sec_out_0   : std_logic_vector(3 downto 0); -- second to display
	signal sec_out_1   : std_logic_vector(3 downto 0); -- second to display
	signal min_out_0   : std_logic_vector(3 downto 0); -- Minute to display
	signal min_out_1   : std_logic_vector(3 downto 0); -- Minute to display
	signal half_disp_0 : std_logic_vector(3 downto 0); --period display
	signal half_disp_1 : std_logic_vector(3 downto 0); -- period display
	signal led_in      : std_logic;
	signal rst         : std_logic;
	signal enable      : std_logic;
	--	signal led_control :  std_logic_vector (7 downto 0);
	signal digit_in          : std_logic_vector (3 downto 0);
	signal o_segmentCathodes : std_logic_vector (6 downto 0);
	signal slw_clk:  std_logic;



begin
	i_adjust_freq : entity work.adjust_freq
		port map (
			clock   => clock  ,
			slw_clk => slw_clk
		);

	
	i_control_logic : entity work.control_logic
		port map (
			clock       => slw_clk ,
			Key0        => Key0 ,
			key1        => key1 ,
			key2        => key2 ,
			sw          => sw ,
			led_in      => led_in ,
			rst         => rst ,
			enable      => enable ,
			led_control => led_control
		);

	i_counter : entity work.counter
		port map (
			clock       => slw_clk ,
			Key0        => enable ,
			key2        => key2 ,
			sw          => rst ,
			sec_out_0   => sec_out_0 ,
			sec_out_1   => sec_out_1 ,
			min_out_0   => min_out_0 ,
			min_out_1   => min_out_1 ,
			half_disp_0 => half_disp_0,
			half_disp_1 => half_disp_1,
			led         => led_in
		);

	i_bcd_to_seven_segment_0 : entity work.bcd_to_seven_segment
		port map (
			digit_in          => sec_out_0 ,
			o_segmentCathodes => hex_0
		);

	i_bcd_to_seven_segment_1 : entity work.bcd_to_seven_segment
		port map (
			digit_in          => sec_out_1 ,
			o_segmentCathodes => hex_1
		);
	i_bcd_to_seven_segment_2 : entity work.bcd_to_seven_segment
		port map (
			digit_in          => min_out_0 ,
			o_segmentCathodes => hex_2
		);
	i_bcd_to_seven_segment_3 : entity work.bcd_to_seven_segment
		port map (
			digit_in          => min_out_1 ,
			o_segmentCathodes => hex_3
		);


	i_bcd_to_seven_segment_4 : entity work.bcd_to_seven_segment
		port map (
			digit_in          => half_disp_0 ,
			o_segmentCathodes => hex_4
		);

	i_bcd_to_seven_segment_5 : entity work.bcd_to_seven_segment
		port map (
			digit_in          => half_disp_1,
			o_segmentCathodes => hex_5
		);




end architecture behvior;