--------------------------------------------------------%
-- ULA_ALL                                              %
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
component decodific3x3 is 
   port (e1: in std_logic;
         e2: in std_logic_vector (1 downto 0); 
         s1: out std_logic;
         s2: out std_logic_vector (1 downto 0));
end component decodific3x3;

component ULA_Head is 
   port (a_h, b_h, Less_h, Binvert_h, Carryln_h: in std_logic;
         Operation_h: in std_logic_vector (1 downto 0); 
         CarryOut_h, Result_h: out std_logic);
end component ULA_Head;

component ULA_Body is
   port (a_b, b_b, Less_b: in std_logic;
   		 Carryln_b, Binvert_b: in std_logic;
         Operation_b: in std_logic_vector (1 downto 0); 
         CarryOut_b, Result_b: out std_logic);
end component ULA_Body;

component ULA_Footer is
   port (a_f, b_f, Less_f, Binvert_f, Carryln_f: in std_logic;
         Operation_f: in std_logic_vector (1 downto 0); 
         Result_f, Set_f, Overflow_s: out std_logic);
end component ULA_Footer;
-----------------------------------------------------------------
--All
signal resp_all : std_logic_vector (31 downto 0);
--Decodificador
signal Bnegate_full : std_logic;
signal Operation_full : std_logic_vector (1 downto 0);
--Head
signal carry_head : std_logic;
--signal  : std_logic_vector (31 downto 0);
--Body
signal carry_body : std_logic;
signal carry_vact : std_logic_vector (28 downto 0);
--signal  : std_logic_vector (31 downto 0);
--Footer
signal Set_footer : std_logic;
--signal  : std_logic_vector (31 downto 0);
-----------------------------------------------------------------
begin
   --Decodificador 
   decodificador : decodific3x3
   port map(e1 => Bnegate,
            e2 => Operation, 
            s1 => Bnegate_full,
            s2 => Operation_full);
   --HEAD
   ULA_Head_all : ULA_Head
   port map(a_h => a(0), 
            b_h => b(0), 
            Less_h => Set_footer, 
            Binvert_h => Bnegate_full, 
            Carryln_h => Bnegate_full,
          Operation_h => Operation_full, 
           CarryOut_h => carry_head, 
             Result_h => resp_all(0));
   --END HEAD
   --BODY
   ULA_Body_all : ULA_Body
   port map (a_b => a(1), 
             b_b => b(1), 
             Less_b => Less,
   		     Carryln_b => carry_head, 
             Binvert_b => Bnegate_full,
             Operation_b => Operation_full, 
             CarryOut_b => carry_vact(0), 
             Result_b => resp_all(1));
   
   ULA_All : for i in 1 to 28 generate
   ULA_Body_all : ULA_Body
   port map (a_b => a(i+1), 
             b_b => b(i+1), 
             Less_b => Less,
   		     Carryln_b => carry_vact(i-1), 
             Binvert_b => Bnegate_full,
             Operation_b => Operation_full, 
             CarryOut_b => carry_vact(i), 
             Result_b => resp_all(i+1));
   end generate;   
   
   ULA_Body_all_f : ULA_Body
   port map (a_b => a(30), 
             b_b => b(30), 
             Less_b => Less,
   		     Carryln_b => carry_vact(28), 
             Binvert_b => Bnegate_full,
             Operation_b => Operation_full, 
             CarryOut_b => carry_body, 
             Result_b => resp_all(30));
   --END BODY   
   --FOOTER
   ULA_Footer_all : ULA_Footer
   port map (a_f => a(31), 
             b_f => b(31), 
             Less_f => Less, 
             Binvert_f => Bnegate_full, 
             Carryln_f => carry_body,
             Operation_f => Operation_full, 
             Result_f => resp_all(31), 
             Set_f => Set_footer, 
             Overflow_s => Overflow);
   --END FOOTER
   --OR ALL
   Zero <= (NOT(resp_all(0) OR resp_all(1) OR resp_all(2) OR resp_all(3) OR resp_all(4) OR resp_all(5) OR resp_all(6) OR resp_all(7) OR resp_all(8) OR resp_all(9) OR resp_all(10) OR resp_all(11) OR resp_all(12) OR resp_all(13) OR resp_all(14) OR resp_all(15) OR resp_all(16) OR resp_all(17) OR resp_all(18) OR resp_all(19) OR resp_all(20) OR resp_all(21) OR resp_all(22) OR resp_all(23) OR resp_all(24) OR resp_all(25) OR resp_all(26) OR resp_all(27) OR resp_all(28) OR resp_all(29) OR resp_all(30) OR resp_all(31)));
   --END OR ALL
end arch_ULA_All;