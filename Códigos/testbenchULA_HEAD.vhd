--------------------------------------------------------%
-- ULA_HEAD_TESTBENCH                                   %
-- Entradas: a_h, b_h, Less_h, Binvert_h e Carryln_h    %
-- Saidas: Operation_h, CarryOut_h e Result_h           %
-- Dependencias: somador_comp, mult4x1 e mult2x1        %
--------------------------------------------------------% 
library ieee;
use ieee.std_logic_1164.all;

entity ULA_Head_Tb is
end ULA_Head_Tb;

architecture arch_ULA_Head_Tb of ULA_Head_Tb is
-----------------------------|Componentes|-------------------

component ULA_Head is
   port (a_h, b_h, Less_h, Binvert_h, Carryln_h: in std_logic;
         Operation_h: in std_logic_vector (1 downto 0); 
         CarryOut_h, Result_h: out std_logic);
end component;
-------------------------------------------------------------
signal a_tb: std_logic;
signal b_tb: std_logic;
signal Less_tb: std_logic;
signal Binvert_tb: std_logic;
signal Carryln_tb: std_logic;
signal Operations_tb: std_logic_vector(1 downto 0);
signal CarryOut_tb: std_logic;
signal Result_tb: std_logic;
-------------------------------------------------------------
begin
uut: ULA_Head
	port map(
    	a_h => a_tb,
        b_h => b_tb,
        Less_h => Less_tb,
        Binvert_h => Binvert_tb,
        Carryln_h => Carryln_tb,
        Operation_h => Operations_tb,
        CarryOut_h => CarryOut_tb,
        Result_h => Result_tb
    );
    
Tb: process
	begin

     a_tb <= '1';
     b_tb <= '1';
     Less_tb <= '1';
     Binvert_tb <= '1';
     Carryln_tb <= '1';
     Operations_tb <= "00";
    wait for 100 ns;
    
     a_tb <= '1';
     b_tb <= '1';
     Less_tb <= '1';
     Binvert_tb <= '1';
     Carryln_tb <= '1';
     Operations_tb <= "01";
    wait for 100 ns;
    
     a_tb <= '0';
     b_tb <= '1';
     Less_tb <= '0';
     Binvert_tb <= '1';
     Carryln_tb <= '0';
     Operations_tb <= "10";
    wait for 100 ns;
   
     a_tb <= '1';
     b_tb <= '1';
     Less_tb <= '1';
     Binvert_tb <= '1';
     Carryln_tb <= '1';
     Operations_tb <= "11";
    wait for 100 ns;
     
     a_tb <= '1';
     b_tb <= '0';
     Less_tb <= '1';
     Binvert_tb <= '0';
     Carryln_tb <= '1';
     Operations_tb <= "00";
    wait for 100 ns;

	 a_tb <= '1';
     b_tb <= '0';
     Less_tb <= '1';
     Binvert_tb <= '0';
     Carryln_tb <= '1';
     Operations_tb <= "01";
	wait for 100 ns;
    
     a_tb <= '1';
     b_tb <= '0';
     Less_tb <= '1';
     Binvert_tb <= '0';
     Carryln_tb <= '1';
     Operations_tb <= "10";
	wait for 100 ns;

     a_tb <= '1';
     b_tb <= '0';
     Less_tb <= '1';
     Binvert_tb <= '0';
     Carryln_tb <= '1';
     Operations_tb <= "11";
	wait for 100 ns;
    
     a_tb <= '1';
     b_tb <= '1';
     Less_tb <= '1';
     Binvert_tb <= '1';
     Carryln_tb <= '1';
     Operations_tb <= "00";
    wait for 100 ns;
    
     a_tb <= '1';
     b_tb <= '1';
     Less_tb <= '1';
     Binvert_tb <= '1';
     Carryln_tb <= '1';
     Operations_tb <= "01";
    wait for 100 ns;
    
     a_tb <= '1';
     b_tb <= '1';
     Less_tb <= '1';
     Binvert_tb <= '1';
     Carryln_tb <= '1';
     Operations_tb <= "10";
    wait for 100 ns;
    
     a_tb <= '1';
     b_tb <= '1';
     Less_tb <= '1';
     Binvert_tb <= '1';
     Carryln_tb <= '1';
     Operations_tb <= "11";
    wait for 100 ns;
    
    wait;
end process;
end arch_ULA_Head_Tb;     