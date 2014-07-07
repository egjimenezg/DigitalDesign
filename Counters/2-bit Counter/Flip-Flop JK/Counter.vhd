-- Author: Gamaliel Jiménez García
-- Module Name:Counter - Behavioral

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Counter is Port(
	reloj,reset : in std_logic;
	w: in std_logic;
	led : inout std_logic := '1';
	J0,K0 : inout std_logic := '0';
	J1,K1 : inout std_logic := '0';
	display : out std_logic_vector(0 to 6);
	salida : inout std_logic_vector(0 to 1));
end Counter;

architecture Behavioral of Counter is
	signal Q0,Q1 : std_logic := '0';
	signal cont: integer range 0 to 225000000 := 0;
begin
	processA: process(reloj,w,reset,salida)
	begin
		if(reset='1') then
		    salida<="00";
			 Q0 <= '0';
			 Q1 <= '0';
		elsif(reloj'event and reloj='1') then
			if(cont=50000000) then
				cont<=0;
				led <= not led;
				J1 <= not w and Q0;
				K1 <= not w and Q0;
				
				if(J1='0' and K1='0') then
					NULL;
				elsif(J1='0' and K1='1') then
					Q1 <= '0';
				elsif(J1='1' and K1='0') then
					Q1 <= '1';
				elsif(J1='1' and K1='1') then
					Q1 <= NOT Q1;
				end if;
				
				J0 <= not w;
				K0 <= not w;
				
				if(J0='0' and K0='0') then
					NULL;
				elsif(J0='0' and K0='1') then
					Q0 <= '0';
				elsif(J0='1' and K0='0') then
					Q0 <= '1';
				elsif(J0='1' and K0='1') then
					Q0 <= NOT Q0;
				end if;
				
				salida <= Q1 & Q0;
			else
				cont <= cont+1;
			end if;
		end if;
	end process processA;
	processB: process(salida)
	begin
		if(salida="00") then
			display<="0000001";
		elsif(salida="01") then
			display<="1001111";
		elsif(salida="10") then
			display<="0010010";
		elsif(salida="11") then
			display<="0000110";
		end if;
	end process processB;
end Behavioral;
