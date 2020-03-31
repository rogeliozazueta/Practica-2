library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity hadder is
port (x, y : in std_logic;
s : out std_logic;
co : out std_logic);
end hadder;

architecture Behavioral of hadder is


begin
s<= x xor y;
co<=x and y;

end Behavioral;
