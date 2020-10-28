--------------------------------------------------------%
-- Multiplexador 2x1                                    %
-- Entradas: e1, e2 e sel                               %
-- Saidas: s                                            %
-- Dependencias: null                                   %
--------------------------------------------------------% 
library ieee;
use ieee.std_logic_1164.all;

entity mult2x1 is
   port (e_1,  e_2, sel: in std_logic;
         s: out std_logic);
end mult2x1;

architecture arch_mult2x1 of mult2x1 is

signal negacao_B : std_logic;

begin
   negacao_B <= (not e_2); -- Inverter o Valor
   with sel select
   	s <= e_1 when '0',
   negacao_B when others;
end arch_mult2x1;