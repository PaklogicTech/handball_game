library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.NUMERIC_STD.ALL;

entity control_logic is
	port (
		clock    : in  std_logic; -- system clock of 1 Hz after frequncy divider
		Key0     : in  std_logic; -- start timer for first half
		key1     : in  std_logic; -- start timer for 2nd half and rst 1st
		key2     : in  std_logic; -- change period
		sw       : in  std_logic; -- start the game
		led_in      : in  std_logic;
		rst    : out std_logic;
		enable   : out std_logic;
		led_control : out std_logic_vector (7 downto 0)
	);
end control_logic;

architecture behav of control_logic is


	-----------------------------------------------------------------------------
	-- Hand_ball game Master FSM states
	-----------------------------------------------------------------------------

	type hand_ball is
		(
			IDLE ,
			RESET,
			COUNT,
			LED
		);
	signal current_state : hand_ball;
	signal next_state    : hand_ball;

begin
	--------------------------------------------------------------------------------
	-- State Initialization
	--------------------------------------------------------------------------------

	stat_init : process(clock,sw)
	begin
		if(sw='1') then
			current_state <= IDLE;
		elsif(rising_edge(clock)) then
			current_state <= next_state;
		end if;
	end process stat_init;
	--------------------------------------------------------------------------------
	-- stat transition
	--------------------------------------------------------------------------------

	stat_tansition : process( current_state,sw,led_in,Key0,key1, key2)
	begin
		case current_state is
			when IDLE =>
				--if (sw='1') then
					next_state <= RESET;
				--else
				--	next_state <= IDLE;
				--end if;

			when RESET =>

				if (Key0='1' or key1= '1') then
					next_state <= COUNT;
				else
					next_state <= RESET;
				end if;
			when COUNT =>

				if (led_in='1') then
					next_state <= LED;
				else
					next_state <= COUNT;
				end if;

			when LED =>
				if (key2='1') then
					next_state <= IDLE;
					else if key1='1' then
						next_state <= RESET;
					else
						next_state <= LED;
						end if;
						end if;
					when others =>
						next_state <= IDLE;
						end case;

						end process ; -- stat_tansition
						              ----------------------------------------------------------------------------
						              -- STATE SIGNALs
						              ----------------------------------------------------------------------------
						stat_signals : process( current_state)
						begin
							case current_state is

								when IDLE =>

									rst    <= '1';
									enable   <= '0';
									led_control <= x"00";

								when RESET =>
									rst    <= '1';
									enable   <= '0';
									led_control <= x"00";

								when COUNT =>
									rst    <= '0';
									enable   <= '1';
									led_control <= x"00";

								when LED =>
									rst    <= '1';
									enable   <= '0';
									led_control <= x"FF";

								when others =>
									rst    <= '1';
									enable   <= '0';
									led_control <= x"00";	

							end case;
		end process ; -- stat_signals
end architecture behav;