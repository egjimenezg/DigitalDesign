-- Author: Gamaliel Jiménez 
-- Create Date: 01/11/2015 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Pulso_Reloj is Port(
  clock: in STD_LOGIC;
  leds: inout STD_LOGIC_VECTOR(0 to 1) := "00"
);
end Pulso_Reloj;

architecture Behavioral of Pulso_Reloj is
  signal cont: integer range 0 to 225000000 := 0;
  signal counter : natural := 0;
begin
  A:process(clock,leds) begin
  
  if(clock'event and clock='1') then
    cont <= cont+1;
    if(cont=56250000) then
      if(counter=3) then
        counter <= 0;
        leds(1) <= not leds(0);
      end if;
      leds(0) <= not leds(0);
    elsif(cont=112500000) then  
      cont <= 0;
      if(leds(1)='1' and counter=0) then
        leds(1) <= not leds(1);
      end if;
      counter <= counter+1;
      leds(0) <= not leds(0);   
    end if;
  end if;
  
  end process A;
end Behavioral;
