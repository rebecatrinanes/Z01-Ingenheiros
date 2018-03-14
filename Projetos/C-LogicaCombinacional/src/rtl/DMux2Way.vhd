library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DMux2Way is
	port ( 
			a:   in  STD_LOGIC;
			sel: in  STD_LOGIC;
			q0:  out STD_LOGIC;
			q1:  out STD_LOGIC);
<<<<<<< HEAD
end entity;

architecture Comp of DMux2Way is

	-- Declarations (optional)

begin

	q0 <= a and (not sel);
	q1 <= a and sel;

end Comp;
=======
end entity
>>>>>>> upstream/master
