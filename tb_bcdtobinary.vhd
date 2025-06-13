LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Testbench entity declaration for bcd_2_bin
ENTITY tb_bb IS
END tb_bb;

ARCHITECTURE behavior OF tb_bb IS 

    -- Component declaration of the Unit Under Test (UUT): bcd_2_bin
    COMPONENT bcd_2_bin
        PORT(
            bcd_in_0    : IN  std_logic_vector(3 downto 0);  -- Units digit
            bcd_in_10   : IN  std_logic_vector(3 downto 0);  -- Tens digit
            bcd_in_100  : IN  std_logic_vector(3 downto 0);  -- Hundreds digit
            bcd_in_1000 : IN  std_logic_vector(3 downto 0);  -- Thousands digit
            bin_out     : OUT std_logic_vector(13 downto 0)  -- Binary output
        );
    END COMPONENT;

    -- Signals to connect to the UUT
    signal bcd_in_0    : std_logic_vector(3 downto 0) := (others => '0');
    signal bcd_in_10   : std_logic_vector(3 downto 0) := (others => '0');
    signal bcd_in_100  : std_logic_vector(3 downto 0) := (others => '0');
    signal bcd_in_1000 : std_logic_vector(3 downto 0) := (others => '0');
    signal bin_out     : std_logic_vector(13 downto 0);

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: bcd_2_bin
        PORT MAP (
            bcd_in_0    => bcd_in_0,
            bcd_in_10   => bcd_in_10,
            bcd_in_100  => bcd_in_100,
            bcd_in_1000 => bcd_in_1000,
            bin_out     => bin_out
        );

    -- Stimulus process to apply test vectors
    stim_proc: process
    begin        
        -- Test case 1: Input BCD = 3210 → Decimal 3210
        bcd_in_0    <= x"0";
        bcd_in_10   <= x"1";
        bcd_in_100  <= x"2";
        bcd_in_1000 <= x"3";
        wait for 100 ns;

        -- Test case 2: Input BCD = 9999 → Decimal 9999 (max valid input)
        bcd_in_0    <= x"9";
        bcd_in_10   <= x"9";
        bcd_in_100  <= x"9";
        bcd_in_1000 <= x"9";
        wait for 100 ns;

        -- Test case 3: Input BCD = 6429 → Decimal 6429
        bcd_in_0    <= x"9";
        bcd_in_10   <= x"2";
        bcd_in_100  <= x"4";
        bcd_in_1000 <= x"6";
        wait for 100 ns;

        -- Test case 4: Input BCD = 0000 → Decimal 0
        bcd_in_0    <= x"0";
        bcd_in_10   <= x"0";
        bcd_in_100  <= x"0";
        bcd_in_1000 <= x"0";
        wait;

    end process;

END;
