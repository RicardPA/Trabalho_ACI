--------------------------------------------------------%
-- ULA_Body                                             %
-- Entradas: a_h, b_h, Less_h, Binvert_h e Carryln_h    %
-- Saidas: Operation_h, CarryOut_h e Result_h           %
-- Dependencias: somador_comp, mult4x1 e mult2x1        %
--------------------------------------------------------% 
library ieee;
use ieee.std_logic_1164.all;

entity ULA_Body is
   port (a_b, b_b, Less_b: in std_logic;
   		 Carryln_b, Binvert_b: in std_logic;
         Operation_b: in std_logic_vector (1 downto 0); 
         CarryOut_b, Result_b: out std_logic);
end ULA_Body;


architecture arch_ULA_Body of ULA_Body is
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
signal saida_mult2_b : std_logic;
signal result_soma_b : std_logic;
signal OR_b : std_logic;
signal AND_b : std_logic;
-----------------------------------------------------------------
begin
   ---------------------------------------------------------------
   --Pegar valor B
   mux2x1_b : mult2x1
   port map( e_1 => b_b,
             e_2 => b_b,
             sel => Binvert_b,
             s => saida_mult2_b);
               
   --Fazer o OR
   OR_b <= (saida_mult2_b OR a_b);
   
   --Fazer o AND
   AND_b <= (saida_mult2_b AND a_b);
     
   --Somar/subtrair e Passar o carry 
   somador_comp_b : somador_comp
   port map( a => a_b,
             b => saida_mult2_b,
             c => Carryln_b,
             soma => result_soma_b,
             carry => CarryOut_b);
             
    --Obter a Resposta 
    mult4x1_b: mult4x1
    port map (e_1 => AND_b, 
              e_2 => OR_b, 
              e_3 => result_soma_b, 
              e_4 => Less_b,
              sel_1 => Operation_b,
              s_1   => Result_b);            
end arch_ULA_Body;