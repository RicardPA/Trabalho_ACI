--------------------------------------------------------%
-- ULA_Body                                             %
-- Entradas: a_h, b_h, Less_h, Binvert_h e Carryln_h    %
-- Saidas: Operation_h, CarryOut_h e Result_h           %
-- Dependencias: somador_comp, mult4x1 e mult2x1        %
--------------------------------------------------------% 
library ieee;
use ieee.std_logic_1164.all;

entity ULA_Body is
   port (a_b, b_b, Less_b: in std_logic_vector (29 downto 0);
   		 Carryln_b, Binvert_b: in std_logic;
         Operation_b: in std_logic_vector (1 downto 0); 
         CarryOut_b, Result_b: out std_logic_vector (29 downto 0));
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
signal saida_mult2_b : std_logic_vector (29 downto 0);
signal result_soma_b : std_logic_vector (29 downto 0);
signal OR_b : std_logic_vector (29 downto 0);
signal AND_b : std_logic_vector (29 downto 0);
-----------------------------------------------------------------
begin
------------------------------------------------------------------
   --Ula 0--------------------------------------------------------
   --Pegar valor B
   mux2x1_b : mult2x1
   port map( e_1 => a_b(0),
             e_2 => b_b(0),
             sel => Binvert_b,
             s => saida_mult2_b(0));
               
   --Fazer o OR
   OR_b(0)  <= (saida_mult2_b(0) OR a_b(0));
   
   --Fazer o AND
   AND_b(0) <= (saida_mult2_b(0) AND a_b(0));
     
   --Somar/subtrair e Passar o carry 
   somador_comp_b : somador_comp
   port map( a => a_b(0),
             b => saida_mult2_b(0),
             c => Carryln_b,
             soma => result_soma_b(0),
             carry => CarryOut_b(0));
             
    --Obter a Resposta 
    mult4x1_b: mult4x1
    port map (e_1 => AND_b(0), 
              e_2 => OR_b(0), 
              e_3 => result_soma_b(0), 
              e_4 => Less_b(0),
              sel_1 => Operation_b,
              s_1   => Result_b(0));
   -----------------------------------------------------------------
   --FOR GENERATE---------------------------------------------------
   -----------------------------------------------------------------
   ULA_BODY: for i in 1 to 29 generate	
     --Pegar valor B
     mux2x1_b2 : mult2x1
     port map( e_1 => a_b(i),
               e_2 => b_b(i),
               sel => Binvert_b,
               s => saida_mult2_b(i));
               
     --Fazer o OR
     OR_b(i)  <= (saida_mult2_b(i) OR a_b(i));
    
     --Fazer o AND
     AND_b(i) <= (saida_mult2_b(i) AND a_b(i));
     
     --Somar/subtrair e Passar o carry 
     somador_comp_b2 : somador_comp
     port map( a => a_b(i),
               b => saida_mult2_b(i),
               c => CarryOut_b(i-1),
               soma => result_soma_b(i),
               carry => CarryOut_b(i));  
     
     --Obter a Resposta 
     mult4x1_b2: mult4x1
     port map (e_1 => AND_b(i), 
               e_2 => OR_b(i), 
               e_3 => result_soma_b(i), 
               e_4 => Less_b(i),
               sel_1 => Operation_b,
               s_1   => Result_b(i));      
	end generate;             
end arch_ULA_Body;