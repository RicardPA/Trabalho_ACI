--------------------------------------------------------%
-- ULA_BODY_TESTBENCH                                   %
-- Entradas: a_h, b_h, Less_h, Binvert_h e Carryln_h    %
-- Saidas: Operation_h, CarryOut_h e Result_h           %
-- Dependencias: somador_comp, mult4x1 e mult2x1        %
--------------------------------------------------------% 
library ieee;
use ieee.std_logic_1164.all;

entity ULA_Body_Tb is
end ULA_Body_Tb;

architecture arch_ULA_Body_Tb of ULA_Body_Tb is
-----------------------------|Componentes|-------------------

component ULA_Body is
   port (a_b, b_b, Less_b: in std_logic_vector (29 downto 0);
   		 Carryln_b, Binvert_b: in std_logic;
         Operation_b: in std_logic_vector (1 downto 0); 
         CarryOut_b, Result_b: out std_logic_vector (29 downto 0));
end component;
-------------------------------------------------------------
signal a_tb: std_logic_vector (29 downto 0);
signal b_tb: std_logic_vector (29 downto 0);
signal Less_tb: std_logic_vector (29 downto 0);
signal Binvert_tb: std_logic;
signal Carryln_tb: std_logic;
signal Operations_tb: std_logic_vector(1 downto 0);
signal CarryOut_tb: std_logic_vector (29 downto 0);
signal Result_tb: std_logic_vector (29 downto 0);
-------------------------------------------------------------
begin
uut: ULA_Body
	port map(
    	a_b => a_tb,
        b_b => b_tb,
        Less_b => Less_tb,
        Binvert_b => Binvert_tb,
        Carryln_b => Carryln_tb,
        Operation_b => Operations_tb,
        CarryOut_b => CarryOut_tb,
        Result_b => Result_tb
    );
    
Tb: process
	begin
	 Carryln_tb <= '1';
     Binvert_tb <= '1';
     Operations_tb <= "10";
     a_tb <= "111111111111111111111111111111";
     b_tb <= "111111111111111111111111111111";
     Less_tb <= "111111111111111111111111111111";
    wait for 100 ns;    
    wait;
end process;
end arch_ULA_Body_Tb;     