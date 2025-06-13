library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- This module converts a 4-digit BCD number into its binary equivalent.
-- Valid decimal input range: 0000 to 9999.

entity bcd_2_bin is
    Port (
        bcd_in_0    : in  STD_LOGIC_VECTOR (3 downto 0);  -- Units digit (0-9)
        bcd_in_10   : in  STD_LOGIC_VECTOR (3 downto 0);  -- Tens digit (0-9)
        bcd_in_100  : in  STD_LOGIC_VECTOR (3 downto 0);  -- Hundreds digit (0-9)
        bcd_in_1000 : in  STD_LOGIC_VECTOR (3 downto 0);  -- Thousands digit (0-9)
        bin_out     : out STD_LOGIC_VECTOR (13 downto 0) := (others => '0')  -- Binary output (0-9999)
    );
end bcd_2_bin;

architecture Behavioral of bcd_2_bin is
begin

    -- Convert each BCD digit to its corresponding binary value by multiplying with its positional weight
    bin_out <= (bcd_in_0 * "01")              -- Units digit × 1
             + (bcd_in_10 * "1010")           -- Tens digit × 10
             + (bcd_in_100 * "1100100")       -- Hundreds digit × 100
             + (bcd_in_1000 * "1111101000");  -- Thousands digit × 1000

end Behavioral;
