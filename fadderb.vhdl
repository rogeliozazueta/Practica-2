
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity fadder is
port (x, y : std_logic ; Ci : std_logic;
s : out std_logic;
Co : out std_logic);

end fadder;

architecture Behavioral of fadder is

begin
s<=x xor y  xor ci;
co<=(x and y) or (x and ci) or(y and ci);

end Behavioral;

