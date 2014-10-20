-- Module Name:    Retardo - Behavioral 
-- Author: Gamaliel Jimenez García

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Retardo is Port(
  clock: in STD_LOGIC;
  leds: inout STD_LOGIC_VECTOR(0 to 1)
);
end Retardo;

architecture Behavioral of Retardo is
  signal cont: integer range 0 to 450000000;
begin
	process(clock) begin
     if(clock'event and clock='1') then
	    cont <= cont+1;
	    if(cont=250000000) then
		   leds(0) <= not leds(0);
		 elsif(cont=125000000) then
		   leds(0) <= not leds(0);
		 end if;
	  end if;
	end process;
end Behavioral;

