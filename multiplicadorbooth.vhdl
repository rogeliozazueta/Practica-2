library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity multiplicadorbooth is
port (
		a: in  std_logic_vector (3 downto 0);
		b: in  std_logic_vector (3 downto 0);
		z: out std_logic_vector (7 downto 0)
    );
end multiplicadorbooth;


architecture behave of multiplicadorbooth is

component fadder
port (x, y : std_logic ; Ci : std_logic;
s : out std_logic;
Co : out std_logic);
end component;

component hadder
port (x, y : in std_logic;
s : out std_logic;
co : out std_logic);
end component;



signal A0B0, A1B0 , A2B0 , A3B0 : std_logic;
signal A0B1, A1B1 , A2B1 , A3B1 : std_logic;
signal A0B2, A1B2 , A2B2 , A3B2 : std_logic;
signal A0B3, A1B3 , A2B3 , A3B3 : std_logic;

signal Ci1, Ci2, Ci3, Ci4, Ci5, Ci6,Ci7, Ci8, Ci9, Ci10, Ci11, Ci12: std_logic;
signal ztemp1, ztemp2, ztemp3, ztemp4, ztemp5, ztemp6: std_logic;
signal temp: std_logic;

begin
  A0B0 <= a(0) AND b(0); A1B0 <= a(1) AND b(0); A2B0 <= a(2) AND b(0); A3B0 <= a(3) AND b(0);
  
  A0B1 <= a(0) AND b(1); A1B1 <= a(1) AND b(1); A2B1 <= a(2) AND b(1); A3B1 <= a(3) AND b(1);
  
  
  A0B2 <= a(0) AND b(2); A1B2 <= a(1) AND b(2); A2B2 <= a(2) AND b(2); A3B2 <= a(3) AND b(2);
  
  A0B3 <= a(0) AND b(3); A1B3 <= a(1) AND b(3);A2B3 <= a(2) AND b(3); A3B3 <= a(3) AND b(3);   --LINEAS
  

  z(0) <= a0b0;
  ha1:hadder port map(a1b0,a0b1,z(1), ci1);
  fa1:fadder port map(a2b0,a1b1, ci1, ztemp1, ci2);
  fa2:fadder port map(a3b0,a2b1, ci2, ztemp2, ci3);
  fa3:fadder port map('0', a3b1, ci3, ztemp3, ci4);

  ha2:hadder port map(a0b2, ztemp1, z(2), ci5);
  fa4:fadder port map(a1b2, ztemp2, ci5, ztemp4, ci6);
  fa5:fadder port map(a2b2, ztemp3, Ci6, ztemp5, ci7);
  fa6:fadder port map(a3b2, ci4, ci7, ztemp6, ci8);

  ha3:hadder port map(a0b3, ztemp4, z(3), ci9);
  fa7:fadder port map(a1b3, ztemp5, ci9, z(4), ci10);
  fa8:fadder port map(a2b3, ztemp6, ci10, z(5), ci11);
  fa9:fadder port map(a3b3, ci8, ci11, z(6), ci12);
  ha4:hadder port map('0', ci12, z(7), temp);
  
 
end behave;