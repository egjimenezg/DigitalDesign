-- Author: Gamaliel Jiménez
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Booth is Port(
  B,Q : in STD_LOGIC_VECTOR(3 downto 0);
  output : out STD_LOGIC_VECTOR(7 downto 0)
);
end Booth;

architecture Behavioral of Booth is
begin
  procesoA: process(Q,B)
    variable A: STD_LOGIC_VECTOR(8 downto 0);
    variable aux : STD_LOGIC_VECTOR(8 downto 0);
  begin
    A := "00000"&Q;
    aux := "0"&B&"0000";
    bucle: for i in 0 to 3 loop
      if(Q(i)='1') then
        A := A+aux;
        A(7 downto 0) := A(8 downto 1);
        A(8) := '0';
      else
        A(7 downto 0) := A(8 downto 1);
        A(8) := '0';
      end if;   
    end loop bucle;

    output <= A(7 downto 0);
  end process procesoA;
end Behavioral;
