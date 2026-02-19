--------------------------------------------------------------------------------
-- Design Name   : alu
-- File Name     : alu.vhd
-- Created       :
-- Last modified : 2025/12/18 20:05:55
-- Author        :
-- Version       :
--------------------------------------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity alu is
    port (
        A      : in    std_logic_vector(7 downto 0);
        B      : in    std_logic_vector(7 downto 0);
        ALU    : in    std_logic_vector(1 downto 0);
        Z      : out   std_logic;
        SALIDA : out   std_logic_vector(7 downto 0)
    );
end alu;

architecture Behavioral of alu is

    signal a_usv  : unsigned(7 downto 0);
    signal b_usv  : unsigned(7 downto 0);
    signal op_add : unsigned(7 downto 0);
    signal op_xor : unsigned(7 downto 0);
    signal result : unsigned(7 downto 0);

begin

    a_usv <= unsigned(A);
    b_usv <= unsigned(B);

    op_add <= a_usv + b_usv;
    op_xor <= a_usv xor b_usv;

    result <= op_add when ALU = "00" else
              op_xor when ALU = "01" else
              b_usv;

    Z <= '1' when result = "00000000" else
         '0';

    SALIDA <= std_logic_vector(result);

end Behavioral;

