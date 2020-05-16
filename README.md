I am planning to create a handball timer. A design which can keep track with the game schedule. A handball game lasts for 60 mins, and it divides into two periods of 30 mins. In my final project, there will be a SW0 that displays the whole design. There will be seven segment displays in this code which stand for time which includes the seconds and the minutes in the handball game, and the number of the period. At the end of each period, the LED’S will be turning on for 3 secs, and the seven-segment display will show a signal which stands for the end of time. Then I will reset the timer and change the period number by using the KEY bottom. Timer will be set by the KEY0 button, and it will be reset by KEY1 button. KEY2 button will be used to change the number of periods. Time in seconds will be shown in HEX0 and HEX1; time in minutes will be shown in HEX2 and HEX3. HEX4, and HEX5 will show the period number. HEX2 and HEX3 will count from 30 to 0 mins, and HEX1 and HEX0 will count down from 60 to 0 seconds. Also HEX3 and HEX4 will change the number from 1 to 2 after 30 mins. SW0 will be used as a display switch in this handball timer design. This design will include more than one clock, each clock will represent for seconds, minutes, period number and the LEDs’ rapidly statement. LED0 to LED7 will be used in this design. By pressing the KEY0, the timer will start to count down. When the timer reaches 00:00, the LED will be turned on. Then in order to reset the timer again, we need to press KEY2, at the same time the period number will switch from 1 to 2.  


SW0- starting the whole program
KEY0- starting the timer for the 1st half of the game
KEY1- reset the timer, so that 2nd half of the game will start
KEY2- change the number of the period of the game, from the 1st half to the 2nd half of the game. 
HEX0& HEX1- show the game time in seconds, also countdown in seconds. 
HEX2& HEX3- show the game time in minutes, also countdown in minutes. 
HEX4& HEX5- show the period number of the game, whether in the 1st or the 2nd half.   
LED0 to LED7- will turn on at the end of each game period. # handball_game
