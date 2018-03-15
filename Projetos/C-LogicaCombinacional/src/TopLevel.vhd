--
-- Elementos de Sistemas - Aula 5 - Logica Combinacional
-- Rafael . Corsi @ insper . edu . br 
--
-- Arquivo exemplo para acionar os LEDs e ler os bottoes
-- da placa DE0-CV utilizada no curso de elementos de 
-- sistemas do 3s da eng. da computacao

----------------------------
-- Bibliotecas ieee       --
----------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

----------------------------
-- Entrada e saidas do bloco
----------------------------
entity TopLevel is
	port(
		A    : in  std_logic;
		B    : in  std_logic;
		C    : in  std_logic;
		Q    : out std_logic
	);
end entity;

----------------------------
-- Implementacao do bloco -- 
----------------------------
architecture rtl of TopLevel is
--begin
--	q <= (not c) and (a or b);
--$4$end rtl;

--------------
-- signals
--------------
signal s1 : std_logic:='0';
signal s2 : std_logic:='0';

component Or8Way is
	port ( 
			a:   in  STD_LOGIC;
			b:   in  STD_LOGIC;
			c:   in  STD_LOGIC;
			d:   in  STD_LOGIC;
			e:   in  STD_LOGIC;
			f:   in  STD_LOGIC;
			g:   in  STD_LOGIC;
			h:   in  STD_LOGIC;
			q:   out STD_LOGIC);
end component;
			
component And16 is
	port ( 
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			b:   in  STD_LOGIC_VECTOR(15 downto 0);
			q:   out STD_LOGIC_VECTOR(15 downto 0));
end component;
component Not16 is
	port ( 
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			q:   out STD_LOGIC_VECTOR(15 downto 0));
end component;

---------------
-- implementacao
---------------
begin

	Not1: Not16 port map(a(0)           => C, 
								a(15 downto 1) =>  "000000000000000",
								q(0)           => s1,
								q(15 downto 1) => open
								);
								
	Or1: Or8Way port map(a=>A, b=>B, c=>'0', d=>'0', e=>'0', f=>'0', g=>'0', h=>'0', q=>s2);
	And1: And16 port map(a(0)=>s1,
								a(15 downto 1) => "000000000000000",
								b(0)=>s2,
								b(15 downto 1) => "000000000000000",
								q(0)           => Q,
								q(15 downto 1) => open);
  

end rtl;
