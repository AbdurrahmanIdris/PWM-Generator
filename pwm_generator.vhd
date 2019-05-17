library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity pwm_generator is
	port (CLK : in  std_logic; 			--The choosen input clock
         W   : in  std_logic_vector(3 downto 0); 	--choose a number from 0 to 15
         RST : in  std_logic; 				--The Reset Button
         PWM : out std_logic);		  		--The Output with the desired duty cycle
end pwm_generator;

architecture behaviour of pwm_generator is

	signal COUNTER : integer;
	signal W1 		: integer;		
	
	begin process (CLK,RST)
		begin
			
			if (RST = '1') then
				COUNTER <= 0;
				W1      <= 1;
				PWM     <= '0';
			elsif (CLK'event and CLK='1') then
				if W="0000" then
					PWM <= '1';
				else
					COUNTER <= COUNTER + 1;
					W1      <= conv_integer(unsigned(W));
					if (COUNTER < W1) then
						PWM <= '1';
					else
						PWM <= '0';
							if (COUNTER =15) then
								COUNTER <= 0;
							end if;
					end if;
				end if;
			end if;
	end process;	

end behaviour;
