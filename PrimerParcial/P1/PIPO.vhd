----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:02:23 09/01/2014 
-- Module Name:    PIPO - Behavioral 
-- Author:			 Gamaliel Jiménez

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PIPO is Port(
	clock : in STD_LOGIC;
	e : in STD_LOGIC_VECTOR(0 to 15);
	s : out STD_LOGIC_VECTOR (0 to 15)
);
end PIPO;

architecture Behavioral of PIPO is

begin
  process(clock,e) begin
    if(clock'event and clock='1') then
		s <= e;
	 end if;
  end process;
end Behavioral;

