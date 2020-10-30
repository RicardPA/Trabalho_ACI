--------------------------------------------------------%
-- ULA_Footer_TESTBENCH                                 %
-- Entradas: a_h, b_h, Less_h, Binvert_h e Carryln_h    %
-- Saidas: Operation_h, CarryOut_h e Result_h           %
-- Dependencias: somador_comp, mult4x1 e mult2x1        %
--------------------------------------------------------%

library ieee;
use ieee.std_logic_1164.all;

entity ULA_Footer_tb is
end ULA_Footer_tb;

architecture arch_ULA_Footer_tb of ULA_Footer_tb is

-----------------------------|Componentes|-------------------
component ULA_Footer is
   port (a_f, b_f, Less_f, Binvert_f, Carryln_f: in std_logic;
         Operation_f: in std_logic_vector (1 downto 0); 
         Result_f, CarryOut_b, Set_f, Overflow_s: out std_logic);
end component;

---------------------------------------------------------------

signal a_tb: std_logic;
signal b_tb: std_logic;
signal Less_tb: std_logic;
signal Binvert_tb: std_logic;
signal Carryln_tb: std_logic;
signal Operation_tb: std_logic_vector (1 downto 0);
signal Result_tb: std_logic;
signal CarryOut_tb: std_logic;
signal Set_tb: std_logic;
signal Overflow_tb: std_logic;
----------------------------------------------------------------

begin
uut: ULA_Footer
	port map(
    	a_f => a_tb,
        b_f => b_tb,
        Less_f => Less_tb,
        Binvert_f => Binvert_tb,
        Carryln_f => Carryln_tb,
        Operation_f => Operation_tb,
        Result_f => Result_tb,
        CarryOut_b => CarryOut_tb,
        Set_f => Set_tb,
        Overflow_s => Overflow_tb
    );
Tb: process
	begin
	 a_tb <= '1';
     b_tb <= '1';
     Less_tb <= '1';
     Binvert_tb <= '1';
     Carryln_tb <= '1';
     Operation_tb <= "10";
     wait for 100 ns;
     
     a_tb <= '1';
     b_tb <= '1';
     Less_tb <= '1';
     Binvert_tb <= '1';
     Carryln_tb <= '1';
     Operation_tb <= "10";
     wait for 100 ns;
     
     a_tb <= '0';
     b_tb <= '1';
     Less_tb <= '0';
     Binvert_tb <= '1';
     Carryln_tb <= '0';
     Operation_tb <= "10";
     wait for 100 ns;
     
     a_tb <= '1';
     b_tb <= '1';
     Less_tb <= '1';
     Binvert_tb <= '1';
     Carryln_tb <= '1';
     Operation_tb <= "10";
     wait for 100 ns;
     
     a_tb <= '1';
     b_tb <= '0';
     Less_tb <= '1';
     Binvert_tb <= '0';
     Carryln_tb <= '1';
     Operation_tb <= "10";
     wait for 100 ns;
     
     a_tb <= '1';
     b_tb <= '0';
     Less_tb <= '1';
     Binvert_tb <= '0';
     Carryln_tb <= '1';
     Operation_tb <= "10";
     wait for 100 ns;
     
     a_tb <= '1';
     b_tb <= '0';
     Less_tb <= '1';
     Binvert_tb <= '0';
     Carryln_tb <= '1';
     Operation_tb <= "10";
     wait for 100 ns;
     
     a_tb <= '1';
     b_tb <= '0';
     Less_tb <= '1';
     Binvert_tb <= '0';
     Carryln_tb <= '1';
     Operation_tb <= "10";
     wait for 100 ns;
     
     a_tb <= '1';
     b_tb <= '1';
     Less_tb <= '1';
     Binvert_tb <= '1';
     Carryln_tb <= '1';
     Operation_tb <= "10";
     wait for 100 ns;
     
     a_tb <= '1';
     b_tb <= '1';
     Less_tb <= '1';
     Binvert_tb <= '1';
     Carryln_tb <= '1';
     Operation_tb <= "10";
     wait for 100 ns;
     
     a_tb <= '1';
     b_tb <= '1';
     Less_tb <= '1';
     Binvert_tb <= '1';
     Carryln_tb <= '1';
     Operation_tb <= "10";
     wait for 100 ns;
     
     a_tb <= '1';
     b_tb <= '1';
     Less_tb <= '1';
     Binvert_tb <= '1';
     Carryln_tb <= '1';
     Operation_tb <= "10";
     wait for 100 ns;

     
     wait;
end process;
end arch_ULA_Footer_tb;
