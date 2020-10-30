---------------------------------------------------------------%
-- Overflow 5x1                                                %
-- Entradas: Binvert_O, sinal1, sinal2, CarryOut_O, e Result_O %
-- Saidas: s                                                   %
-- Dependencias: null                                          %
---------------------------------------------------------------% 
library ieee;
use ieee.std_logic_1164.all;

entity Overflow is
   port (Binvert_O, sinal1, sinal2, CarryOut_O, Result_O : in std_logic;
         s: out std_logic);
end Overflow;

architecture arch_Overflow of Overflow is
begin
	s <= '1' when (((sinal1 = sinal2 and sinal1 /= Result_O)
         		  or (Binvert_O = '1' and CarryOut_O = '1'))
    			  or (CarryOut_O = '1'))    
    ELSE '0';
end arch_Overflow;