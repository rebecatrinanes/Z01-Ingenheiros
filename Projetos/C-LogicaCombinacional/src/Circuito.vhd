Library ieee;
use ieee.std_logic_1164.all;
entity Circ is
port(
	a : in std_logic;
	b : in std_logic;
	c : in std_logic;
	q : out std_logic;
);
end Circ;
architecture rtl of Circ is
begin

	q <= (not c) and (a or b);

end rtl;
