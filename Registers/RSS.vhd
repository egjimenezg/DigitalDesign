--Author: Gamaliel Jiménez García
--Serial in Serial out register

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RSS is port(
	entrada,reloj: in std_logic;
	temp: inout std_logic_vector(3 downto 0)
);
end RSS;

architecture Behavioral of RSS is
begin
  process(entrada,reloj,temp)
    begin
			if(reloj'event and reloj='1') then
				temp(3 downto 1) <= temp(2 downto 0);
				temp(0) <= entrada;
			end if;
	end process;
end Behavioral;