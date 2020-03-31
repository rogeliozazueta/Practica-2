
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tbmultiplicador IS
END tbmultiplicador;
 
ARCHITECTURE behavior OF tbmultiplicador IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT multiplicadorbooth
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         z : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal z : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: multiplicadorbooth PORT MAP (
          a => a,
          b => b,
          z => z
        );

  

   -- Stimulus process
   stim_proc: process
   begin		
      
      wait for 100 ns;	

      A <= "1000"; 
        B <= "0100"; 

        wait for 10 ns;	
        A <= "1010"; 
        B <= "0001"; 
        wait for 10 ns;
        A <= "1010"; 
        B <= "0010"; 

        wait for 10 ns;	
        A <= "1000"; 
        B <= "0100"; 
        wait for 10 ns;
        A <= "1001"; 
        B <= "1001"; 

        wait for 10 ns;	
        A <= "1111"; 
        B <= "0010"; 

        wait for 10 ns;	
        A <= "0000"; 
        B <= "0000"; 


   

      wait;
   end process;

END;