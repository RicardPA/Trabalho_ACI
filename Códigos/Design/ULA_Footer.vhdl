--------------------------------------------------------%
-- ULA_Footer                                           %
-- Entradas: a_h, b_h, Less_h, Binvert_h e Carryln_h    %
-- Saidas: Operation_h, CarryOut_h e Result_h           %
-- Dependencias: somador_comp, mult4x1 e mult2x1        %
--------------------------------------------------------% 
library ieee;
use ieee.std_logic_1164.all;

entity ULA_Footer is
   port (a_f, b_f, Less_f, Binvert_f, Carryln_f: in std_logic;
         Operation_f: in std_logic_vector (1 downto 0); 
         Result_f, Set_f, Overflow_s: out std_logic);
end ULA_Footer;


architecture arch_ULA_Footer of ULA_Footer is
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

component Overflow is 
	port (Binvert_O, sinal1, sinal2, CarryOut_O, Result_O : in std_logic;
         s: out std_logic);
end component Overflow;

component mult2x1 is
   port (e_1, e_2, sel: in std_logic;
         s: out std_logic);
end component mult2x1;
-----------------------------------------------------------------
signal saida_mult2_f : std_logic;
signal result_soma_f : std_logic;
signal OR_f : std_logic;
signal AND_f : std_logic;
signal CarryOut_f : std_logic;
-----------------------------------------------------------------
begin
   --Pegar valor B
   mux2x1_f : mult2x1
   port map( e_1 => b_f,
             e_2 => b_f,
             sel => Binvert_f,
             s   => saida_mult2_f);
   --Fazer o OR
   OR_f  <= (saida_mult2_f OR a_f);
   --Fazer o AND
   AND_f <= (saida_mult2_f AND a_f);
   --Somar/subtrair e Passar o carry 
   somador_comp_h : somador_comp
   port map( a => a_f,
             b => saida_mult2_f,
             c => Binvert_f,
             soma => result_soma_f,
             carry => CarryOut_f);
   --Obter a Resposta 
   mult4x1_f : mult4x1
   port map (e_1 => AND_f, 
        	 e_2 => OR_f, 
        	 e_3 => result_soma_f, 
        	 e_4 => Less_f,
        	 sel_1 => Operation_f,
        	 s_1   => Result_f);
   --Detectar o Overflow 
   Overflow_f : Overflow
   port map(Binvert_O => Binvert_f,
   			sinal1 => a_f,
            sinal2 => b_f, 
   			CarryOut_O => CarryOut_f, 
   			Result_O => Result_f,
   			s => Overflow_s);
   --Passar o valor para o Set
   Set_f <= '1';
end arch_ULA_Footer;