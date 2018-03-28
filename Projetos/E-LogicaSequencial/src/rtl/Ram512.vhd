-- Elementos de Sistemas
-- by Luciano Soares
-- Ram512.vhd

Library ieee; 
use ieee.std_logic_1164.all;
  
entity Ram512 is
	port(
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR( 8 downto 0);
		output:  out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture rtl of Ram512 is

	component Ram64 is
			port(
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR( 5 downto 0);
		output:  out STD_LOGIC_VECTOR(15 downto 0)
	);
	end component;
	
	component Mux8Way16 is
	port ( 
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			b:   in  STD_LOGIC_VECTOR(15 downto 0);
			c:   in  STD_LOGIC_VECTOR(15 downto 0);
			d:   in  STD_LOGIC_VECTOR(15 downto 0);
			e:   in  STD_LOGIC_VECTOR(15 downto 0);
			f:   in  STD_LOGIC_VECTOR(15 downto 0);
			g:   in  STD_LOGIC_VECTOR(15 downto 0);
			h:   in  STD_LOGIC_VECTOR(15 downto 0);
			sel: in  STD_LOGIC_VECTOR(2 downto 0);
			q:   out STD_LOGIC_VECTOR(15 downto 0));
	end component;
	
	component DMux8Way is
	port ( 
			a:   in  STD_LOGIC;
			sel: in  STD_LOGIC_VECTOR(2 downto 0);
			q0:  out STD_LOGIC;
			q1:  out STD_LOGIC;
			q2:  out STD_LOGIC;
			q3:  out STD_LOGIC;
			q4:  out STD_LOGIC;
			q5:  out STD_LOGIC;
			q6:  out STD_LOGIC;
			q7:  out STD_LOGIC);
	end component;
	
	
	signal s : STD_LOGIC_VECTOR(7 downto 0);
	signal ram64out1,ram64out2,ram64out3,ram64out4,ram64out5,ram64out6,ram64out7,ram64out8 :STD_LOGIC_VECTOR(15 downto 0); -- sinais da saída dos ram8

begin

	dmux: DMux8Way port map(a=>load, 
									sel=>address(8 downto 6),
									q0=>s(0),
									q1=>s(1),
									q2=>s(2),
									q3=>s(3),
									q4=>s(4),
									q5=>s(5),
									q6=>s(6),
									q7=>s(7));
	
	ram641: Ram64 port map(clock=>clock , input=>input , load=>s(0) , address=>address(5 downto 0) , output=>ram64out1);
	ram642: Ram64 port map(clock=>clock , input=>input , load=>s(1) , address=>address(5 downto 0) , output=>ram64out2);
	ram643: Ram64 port map(clock=>clock , input=>input , load=>s(2) , address=>address(5 downto 0) , output=>ram64out3);
	ram644: Ram64 port map(clock=>clock , input=>input , load=>s(3) , address=>address(5 downto 0) , output=>ram64out4);
	ram645: Ram64 port map(clock=>clock , input=>input , load=>s(4) , address=>address(5 downto 0) , output=>ram64out5);
	ram646: Ram64 port map(clock=>clock , input=>input , load=>s(5) , address=>address(5 downto 0) , output=>ram64out6);
	ram647: Ram64 port map(clock=>clock , input=>input , load=>s(6) , address=>address(5 downto 0) , output=>ram64out7);
	ram648: Ram64 port map(clock=>clock , input=>input , load=>s(7) , address=>address(5 downto 0) , output=>ram64out8);
	
	mux: Mux8Way16 port map(a=>ram64out1,
									b=>ram64out2,
									c=>ram64out3,
									d=>ram64out4,
									e=>ram64out5,
									f=>ram64out6,
									g=>ram64out7,
									h=>ram64out8,
									sel=>address(8 downto 6),
									q=>output);
									
end architecture rtl;