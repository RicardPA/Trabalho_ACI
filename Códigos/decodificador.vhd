--------------------------------------------------------%
-- Decodificador                                        %
-- Entradas: e1 e e2                                    %
-- Saidas: s1 e s2                                      %
-- Dependencias: null                                   %
--------------------------------------------------------% 
library ieee;
use ieee.std_logic_1164.all;

entity decodific3x3 is
   port (e1: in std_logic;
         e2: in std_logic_vector (1 downto 0); 
         s1: out std_logic;
         s2: out std_logic_vector (1 downto 0));
end decodific3x3;


architecture arch_decodific3x3 of decodific3x3 is
begin
   s2 <= e2;	
   with e2 select
   s1 <= (('1' and '0') or (e1 and '1')) when "10",
         (('0' and '1') or (e1 and '0')) when "01",
         (('1' and '1') or (e1 and '1')) when "11",
         (('0' and '0') or (e1 and '0')) when others;
end arch_decodific3x3;