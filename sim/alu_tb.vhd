--------------------------------------------------------------------------------
-- Design Name   : Test bench alu
-- File Name     : alu_tb.vhd
-- Created       :
-- Last modified : 2026/01/25 21:11:46
-- Author        :
-- Version       :
--------------------------------------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;

entity alu_tb is
--  Port ( );
end alu_tb;

architecture Behavioral of alu_tb is

    -- Definición del componente alu
    component alu
        port (
            A      : in    std_logic_vector(7 downto 0);
            B      : in    std_logic_vector(7 downto 0);
            ALU    : in    std_logic_vector(1 downto 0);
            SALIDA : out   std_logic_vector(7 downto 0);
            Z      : out   std_logic
        );
    end component;

    -- Señales internas
    signal a_tb      : std_logic_vector(7 downto 0);
    signal b_tb      : std_logic_vector(7 downto 0) := "00000000";
    signal alu_tb    : std_logic_vector(1 downto 0) := "10";
    signal salida_tb : std_logic_vector(7 downto 0);
    signal z_tb      : std_logic;

begin

    -- Instanciación del componente
    ALU_0 : alu
        port map (
            A      => a_tb,
            B      => b_tb,
            ALU    => alu_tb,
            SALIDA => salida_tb,
            Z      => z_tb
        );

    -- Proceso de estímulo
    stim_proc : process
    begin

        -- Suma

        b_tb   <= x"03";
        alu_tb <= x"00";
        wait for 200 ns;

        -- XOR
        a_tb   <= x"0F";
        b_tb   <= x"F0";
        alu_tb <= "01";
        wait for 200 ns;

        -- Resultado cero (para probar Z)
        a_tb   <= x"00";
        b_tb   <= x"00";
        alu_tb <= "00";
        wait for 200 ns;

        -- Paso directo de B
        a_tb   <= x"AA";
        b_tb   <= x"55";
        alu_tb <= "10";
        wait for 200 ns;

        -- Fin de simulación
        wait;

    end process stim_proc;

end Behavioral;

