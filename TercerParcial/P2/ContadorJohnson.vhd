-- Author: Gamaliel Jiménez 
-- Module Name:    ContadorJohnson - Behavioral 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ContadorJohnson is Port(
  clock : in STD_LOGIC;
  reset : in STD_LOGIC;
  output : inout STD_LOGIC_VECTOR(0 to 5));
end ContadorJohnson;

architecture Behavioral of ContadorJohnson is
  signal counter: integer range 0 to 225000000;
begin
  process(clock,output,reset)
  begin
    if(reset='1') then
      output <= "000000";
    elsif(clock'event and clock='1') then
      counter <= counter+1;
      if(counter=225000000) then
        counter<=0;
        output(0)<=not output(5);
        output(1)<=output(0);
        output(2)<=output(1);
        output(3)<=output(2);
        output(4)<=output(3);
        output(5)<=output(4);
      end if;
    end if;
  end process;
end Behavioral;
