--------------------------------------------------------%
-- ULA_All                                              %
-- Entradas: a_h, b_h, Less_h, Binvert_h e Carryln_h    %
-- Saidas: Operation_h, CarryOut_h e Result_h           %
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
signal resp_all : std_logic_vector (31 downto 0);
--Head
signal carry_head : std_logic;
--signal  : std_logic_vector (31 downto 0);
--Body
signal carry_body : std_logic;
--signal  : std_logic_vector (31 downto 0);
--Footer
signal Set_footer : std_logic;
--signal  : std_logic_vector (31 downto 0);
-----------------------------------------------------------------
begin
   --HEAD
   ULA_Head_all : ULA_Head
   port map(a_h => a(0), 
            b_h => b(0), 
            Less_h => Set_footer, 
            Binvert_h => Bnegate, 
            Carryln_h => Bnegate,
          Operation_h => Operation, 
           CarryOut_h => carry_head, 
             Result_h => resp_all(0));
   --END HEAD
   --BODY
   ULA_Body_all : ULA_Body
   port map (a_b(0) => a(1), 
             b_b(0) => a(1), 
             Less_b(0) => Less,
   		     Carryln_b => carry_head, 
             Binvert_b => Bnegate,
             Operation_b => Operation,
             Result_b(0) => resp_all(1));
             
   ULA_ALL: for i in 1 to 28 generate	
     ULA_Body_all : ULA_Body
     port map (a_b(i) => a(i+1), 
               b_b(i) => a(i+1), 
               Less_b(i) => Less,
               Carryln_b => carry_head, 
               Binvert_b => Bnegate,
               Operation_b => Operation,
               Result_b(i) => resp_all(i+1));      
   end generate;
   
   ULA_Body_all : ULA_Body
   port map (a_b(29) => a(30), 
             b_b(29) => a(30), 
             Less_b(29) => Less,
   		     Carryln_b => carry_head, 
             Binvert_b => Bnegate,
             Operation_b => Operation,
             CarryOut_b(29) => carry_body,
             Result_b(29) => resp_all(30));
   --END BODY
   
   --FOOTER
   ULA_Footer_all : ULA_Footer
   port map (a_f => a(31), 
             b_f => b(31), 
             Less_f => Less, 
             Binvert_f => Bnegate, 
             Carryln_f => carry_body,
             Operation_f => Operation, 
             Result_f => resp_all(31), 
             Set_f => Set_footer, 
             Overflow_s => Overflow);
   --END FOOTER
end arch_ULA_All;