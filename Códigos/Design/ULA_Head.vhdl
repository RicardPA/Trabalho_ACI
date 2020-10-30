--------------------------------------------------------%
-- ULA_HEAD                                             %
-- Entradas: a_h, b_h, Less_h, Binvert_h e Carryln_h    %
-- Saidas: Operation_h, CarryOut_h e Result_h           %
-- Dependencias: somador_comp, mult4x1 e mult2x1        %
--------------------------------------------------------% 
library ieee;
use ieee.std_logic_1164.all;

entity ULA_Head is
   port (a_h, b_h, Less_h, Binvert_h, Carryln_h: in std_logic;
         Operation_h: in std_logic_vector (1 downto 0); 
         CarryOut_h, Result_h: out std_logic);
end ULA_Head;


architecture arch_ULA_Head of ULA_Head is
-----------------------------|Componentes|------------------------
component somador_comp is 
   port(a, b, c : in std_logic;
        soma, carry: out std_logic);
end component somador_comp;
component mult4x1 is
   port (e_1, e_2, e_3, e_4: in std_logic;
         sel_1: in std_logic_vector (1 downto 0);
         s_1: out std_logic);
end component mult4x1;
component mult2x1 is
   port (e_1, e_2, sel: in std_logic;
         s: out std_logic);
end component mult2x1;
-----------------------------------------------------------------
signal saida_mult2_h : std_logic;
signal result_soma_h : std_logic;
signal OR_h : std_logic;
signal AND_h : std_logic;
-----------------------------------------------------------------
begin
   --Pegar valor B
   mux2x1_h : mult2x1
   port map( e_1 => b_h,
             e_2 => b_h,
             sel => Binvert_h,
             s   => saida_mult2_h);
   --Fazer o OR
   OR_h  <= (saida_mult2_h OR a_h);
   --Fazer o AND
   AND_h <= (saida_mult2_h AND a_h);
   --Somar/subtrair e Passar o carry 
   somador_comp_h : somador_comp
   port map( a => a_h,
             b => saida_mult2_h,
             c => Binvert_h,
             soma => result_soma_h,
             carry => CarryOut_h);
   --Obter a Resposta 
   mult4x1_h : mult4x1
   port map (e_1 => AND_h, 
        	 e_2 => OR_h, 
        	 e_3 => result_soma_h, 
        	 e_4 => Less_h,
        	 sel_1 => Operation_h,
        	 s_1   => Result_h);
end arch_ULA_Head;