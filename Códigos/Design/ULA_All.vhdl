--------------------------------------------------------%
-- ULA_All                                              %
-- Entradas: a, b, Less, Bnegate e Operation            %
-- Saidas: Zero e Overflow                              %
-- Dependencias: somador_comp, mult4x1 e mult2x1        %
--------------------------------------------------------% 
library ieee;
use ieee.std_logic_1164.all;

entity ULA_All is
   port (a, b: in std_logic_vector (31 downto 0);
         Less: in std_logic;
         Bnegate: in std_logic;
         Operation: in std_logic_vector (1 downto 0); 
         Zero, Overflow: out std_logic);
end ULA_All;


architecture arch_ULA_All of ULA_All is
-----------------------------|Componentes|------------------------
component ULA_Head is 
   port (a_h, b_h, Less_h, Binvert_h, Carryln_h: in std_logic;
         Operation_h: in std_logic_vector (1 downto 0); 
         CarryOut_h, Result_h: out std_logic);
end component ULA_Head;

component ULA_Body is
   port (a_b, b_b, Less_b: in std_logic_vector (29 downto 0);
   		 Carryln_b, Binvert_b: in std_logic;
         Operation_b: in std_logic_vector (1 downto 0); 
         CarryOut_b, Result_b: out std_logic_vector (29 downto 0));
end component ULA_Body;

component ULA_Footer is
   port (a_f, b_f, Less_f, Binvert_f, Carryln_f: in std_logic;
         Operation_f: in std_logic_vector (1 downto 0); 
         Result_f, Set_f, Overflow_s: out std_logic);
end component ULA_Footer;
-----------------------------------------------------------------
signal  : std_logic_vector (31 downto 0);
signal carry_head : std_logic;
signal resp_head : std_logic;
signal  : std_logic;
-----------------------------------------------------------------
begin
   --HEAD
   ULA_Head_all : ULA_Head
   port map(a_h => a(0), 
            b_h => b(0), 
            Less_h => Set_f, 
            Binvert_h => Bnegate, 
            Carryln_h => Bnegate,
          Operation_h => Operation, 
           CarryOut_h => resp_head, 
             Result_h => carry_head);
   --END HEAD
   --BODY
   ULA_Body_all : ULA_Body
   port (a_b => , 
         b_b => , 
         Less_b => ,
   		 Carryln_b => , 
         Binvert_b => ,
         Operation_b => , 
         CarryOut_b => , 
         Result_b => );
   ULA_ALL: for i in 1 to 29 generate	
         
   end generate;
   --END BODY
   --FOOTER
   port (a_f => , 
         b_f => , 
         Less_f => , 
         Binvert_f => , 
         Carryln_f => ,
         Operation_f => , 
         Result_f => , 
         Set_f => , 
         Overflow_s => );
   --END FOOTER
end arch_ULA_Body;