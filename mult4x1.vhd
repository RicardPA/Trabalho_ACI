--------------------------------------------------------%
-- Multiplexador 4x1                                    %
-- Entradas: e_1, e_2, e_3, e_4 e sel_1                 %
-- Saidas: s_1                                          %
-- Dependencias: null                                   %
--------------------------------------------------------% 
library ieee;
use ieee.std_logic_1164.all;

entity mult4x1 is
   port (e_1, e_2, e_3, e_4: in std_logic;
         sel_1: in std_logic_vector (1 downto 0);
         s_1: out std_logic);
end mult4x1;

architecture arch_mult4x1 of mult4x1 is
begin
   with sel_1 select 
      s_1 <= e_1 when "00",
      		 e_2 when "01",
      		 e_3 when "10",
      		 e_4 when others;
end arch_mult4x1;