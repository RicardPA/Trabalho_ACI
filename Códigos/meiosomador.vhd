--------------------------------------------------------%
-- Meio Somador                                         %
-- Entradas: a e b                                      %
-- Saidas: soma e carry                                 %
-- Dependencias: null                                   %
--------------------------------------------------------% 
library IEEE;
use ieee.std_logic_1164.all;

entity meio_somador is 
   port( a, b : in std_logic;
   soma, carry : out std_logic);
end meio_somador;

architecture meio_somador_arch of meio_somador is
begin
   soma <= (a and not b) or(not a and b);
   carry <= a and b;
end meio_somador_arch;