library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Contador is port(
  clock : in STD_LOGIC;
  w : in STD_LOGIC;
  reset : in STD_LOGIC;
  led : inout STD_LOGIC := '0';
  output : inout STD_LOGIC_VECTOR(2 downto 0)
);
end Contador;

architecture Behavioral of Contador is
  signal cont: integer range 0 to 450000000;
  signal flipFlopOut : STD_LOGIC_VECTOR(2 downto 0);
begin
  setFlipFlops: process(clock, w, reset, flipFlopOut,output)  
  begin
    if(reset='1') then
      flipFlopOut<="001";
      led <= '0';
      output <= "000";
    elsif(clock'event and clock='1') then
      cont <= cont+1;
      if(cont=450000000) then
        cont <= 0;
        led <= not led;
      
        if(flipFlopOut(2)='1') then
          output(2) <= not output(2);
        end if;
          if(flipFlopOut(1)='1') then
            output(1) <= not output(1);
          end if;
      
          output(0) <= not output(0);
      elsif(cont=225000000) then
        flipFlopOut(2) <= (output(2) and output(1)) or 
                          (output(2) and (not output(0)) and w) or 
                          (output(2) and output(0) and (not w)) or
                          ((not output(1)) and (not output(0)) and w) or
                          (output(1) and (output(0)) and (not w));
    
        flipFlopOut(1) <= (output(2) and output(1)) or
                          ((not output(0)) and w and (output(2) or output(1))) or
                          (output(0) and (not w) and ((not output(2)) or output(1)));
                        
        led <= not led;
      end if;
   end if;
  end process setFlipFlops;
end Behavioral;
