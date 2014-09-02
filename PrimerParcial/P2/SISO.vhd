----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:52:30 09/01/2014 
-- Module Name:    SISO - Behavioral 
-- Author:         Gamaliel Jiménez
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SISO is
    Port ( clock : in  STD_LOGIC;
      e : in STD_LOGIC;
      s : inout STD_LOGIC_VECTOR(0 TO 3));
end SISO;

architecture Behavioral of SISO is
begin
  process(clock,s,e) begin
    if(clock'event and clock='1') then
      s(0) <= e;
      s(1 to 3) <= s(0 to 2);
    end if;
  end process;
end Behavioral;

