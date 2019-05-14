library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity pwm_generator is
	port (CLK : in  std_logic;
         W   : in  std_logic_vector(3 downto 0);
         PWM : out std_logic);	
end pwm_generator;

architecture behaviour of pwm_generator is

	signal COUNTER : integer;
	signal w1 		: integer;		
	
	begin process (CLK)
		begin
			COUNTER <= 0 ;
			COUNTER <= COUNTER +1;
			COUNTER <= conv_integer(unsigned(W));
			
			if (CLK'event AND CLK='1') then
				if (W = 0000) then
					PWM <= '1';
				elsif (COUNTER >= w) then
					PWM <= '0';
				else 
					PWM <= '1';
				end if;
			end if;
	end process;	

end behaviour;