-- Create Date:    03:19:37 09/07/2014 
-- Design Name: 
-- Module Name:    RegistroDesplazamientoBidireccional - Behavioral 
-- Author:         Gamaliel Jiménez
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RegistroDesplazamientoBidireccional is Port (
  clock,e,izq_der : in  STD_LOGIC;
  salida : inout STD_LOGIC_VECTOR(0 to 3));
end RegistroDesplazamientoBidireccional;

architecture Behavioral of RegistroDesplazamientoBidireccional is
begin
  process(clock,salida) begin
    if(clock'event and clock='1') then
      salida(0) <= (e and izq_der) or ((not izq_der) and salida(1));
      salida(1) <= (salida(0) and izq_der) or ((not izq_der) and salida(2));
      salida(2) <= (salida(1) and izq_der) or ((not izq_der) and salida(3));
      salida(3) <= (salida(2) and izq_der) or ((not izq_der) and e);
    end if;
  end process;
end Behavioral;