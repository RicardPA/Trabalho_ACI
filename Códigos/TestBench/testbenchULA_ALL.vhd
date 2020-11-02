--------------------------------------------------------%
-- ULA_ALL_TESTBENCH                                    %
-- Entradas: a_h, b_h, Less_h, Binvert_h e Carryln_h    %
-- Saidas: Operation_h, CarryOut_h e Result_h           %
-- Dependencias: somador_comp, mult4x1 e mult2x1        %
--------------------------------------------------------%

library ieee;
use ieee.std_logic_1164.all;

entity ULA_All_tb is
end ULA_All_tb;

architecture arch_ULA_All_tb of ULA_All_tb is

-----------------------------|Componentes|-------------------
component ULA_All is
   port (a, b: in std_logic_vector (31 downto 0);
         Less, Bnegate: in std_logic;
         Operation: in std_logic_vector (1 downto 0); 
         Zero, Overflow: out std_logic);
end component;

---------------------------------------------------------------

signal a_tb: std_logic_vector (31 downto 0);
signal b_tb: std_logic_vector (31 downto 0);
signal Less_tb: std_logic;
signal Bnegate_tb: std_logic;
signal Operation_tb: std_logic_vector (1 downto 0);
signal Zero_tb: std_logic;
signal Overflow_tb: std_logic;
----------------------------------------------------------------

begin
uut: ULA_All
	port map(
    	a => a_tb,
        b => b_tb,
        Less => Less_tb,
        Bnegate => Bnegate_tb,
        Operation => Operation_tb,
        Zero => Zero_tb,
        Overflow => Overflow_tb
    );
Tb: process
	begin
	 Less_tb <= '0';
     Bnegate_tb <= '0';
     Operation_tb <= "10";
     a_tb <= "10101010110101010101010101010101";
     b_tb <= "01010101101010110101101010101010";
    wait for 100 ns;
     Less_tb <= '0';
     Bnegate_tb <= '1';
     Operation_tb <= "10";
     a_tb <= "01010101101010101010101010101010";
     b_tb <= "10101010110101011010110101010101";
    wait for 100 ns;
     Less_tb <= '0';
     Bnegate_tb <= '0';
     Operation_tb <= "10";
     a_tb <= "10101010110101010101010101010101";
     b_tb <= "01010101101010110101101010101010";
    wait for 100 ns;
     Less_tb <= '0';
     Bnegate_tb <= '1';
     Operation_tb <= "10";
     a_tb <= "10101010110101010101010101010101";
     b_tb <= "01010101101010110101101010101010";
    wait for 100 ns;
     Less_tb <= '0';
     Bnegate_tb <= '0';
     Operation_tb <= "10";
     a_tb <= "10101011111111110101010101010101";
     b_tb <= "01010101101010110101101000000000";
    wait for 100 ns;
     Less_tb <= '0';
     Bnegate_tb <= '1';
     Operation_tb <= "10";
     a_tb <= "10101010110111111111111110101011";
     b_tb <= "01010101100000000000000010101010";
    wait for 100 ns;
     Less_tb <= '0';
     Bnegate_tb <= '1';
     Operation_tb <= "10";
     a_tb <= "11111111111111110101010101010101";
     b_tb <= "01010101101010110000000000000000";
    wait for 100 ns;
     wait;
end process;
end arch_ULA_All_tb;

