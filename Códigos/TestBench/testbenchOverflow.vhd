library ieee;
use ieee.std_logic_1164.all;

entity Overflow_tb is
end Overflow_tb;

architecture arch_Overflow_tb of Overflow_tb is

-----------------------------|Componentes|-------------------
component Overflow is
   port (Binvert_O, sinal1, sinal2, CarryOut_O, Result_O : in std_logic;
         s: out std_logic);
end component;

---------------------------------------------------------------

signal Bin_tb: std_logic;
signal a_tb: std_logic;
signal b_tb: std_logic;
signal carry_tb: std_logic;
signal Re: std_logic;
signal sai: std_logic;
----------------------------------------------------------------
begin
uut : Overflow 
   port map (Binvert_O => Bin_tb, 
             sinal1 => a_tb, 
             sinal2 => b_tb, 
             CarryOut_O => carry_tb, 
             Result_O => Re, 
             s => sai);
tb: process
	begin

     a_tb <= '1';
     b_tb <= '1';
     Bin_tb <= '1';
     carry_tb <= '1';
     Re <= '1';
    wait for 100 ns;
    
     a_tb <= '0';
     b_tb <= '1';
     Bin_tb <= '0';
     carry_tb <= '1';
     Re <= '0';
    wait for 100 ns;
    
     a_tb <= '0';
     b_tb <= '1';
     Bin_tb <= '1';
     carry_tb <= '0';
     Re <= '0';
    wait for 100 ns;
    
    wait;
end process;
end arch_Overflow_tb; 