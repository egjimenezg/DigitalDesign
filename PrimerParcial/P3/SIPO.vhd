----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:52:30 09/06/2014 
-- Module Name:    SIPO - Behavioral 
-- Author:         Gamaliel Jiménez
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SIPO is
  Port (clock : in  STD_LOGIC;
        e,h : in STD_LOGIC;
        s : out STD_LOGIC_VECTOR(0 to 3) := "0000");
end SIPO;

architecture Behavioral of SIPO is
  signal si : STD_LOGIC_VECTOR(0 to 3) := "0000";
begin
  process(clock,h,si) begin
    if(h='0') then
      if(clock'event and clock='1') then
        si(0) <= e;
        si(1 to 3) <= si(0 to 2);
      end if;
    elsif (h='1') then
      s <= si;
    end if;
  end process;
end Behavioral;


