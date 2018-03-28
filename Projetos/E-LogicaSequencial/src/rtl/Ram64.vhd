-- Elementos de Sistemas
-- by Luciano Soares
-- Ram64.vhd

Library ieee; 
use ieee.std_logic_1164.all;
  
entity Ram64 is
	port(
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR( 5 downto 0);
		output:  out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture rtl of Ram64 is

	component Ram8 is
			port(
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR( 2 downto 0);
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
	signal ram8out1,ram8out2,ram8out3,ram8out4,ram8out5,ram8out6,ram8out7,ram8out8 :STD_LOGIC_VECTOR(15 downto 0); -- sinais da saída dos ram8

begin

	dmux: DMux8Way port map(a=>load, 
									sel=>address(5 downto 3),
									q0=>s(0),
									q1=>s(1),
									q2=>s(2),
									q3=>s(3),
									q4=>s(4),
									q5=>s(5),
									q6=>s(6),
									q7=>s(7));
	
	ram81: Ram8 port map(clock=>clock , input=>input , load=>s(0) , address=>address(2 downto 0) , output=>ram8out1);
	ram82: Ram8 port map(clock=>clock , input=>input , load=>s(1) , address=>address(2 downto 0) , output=>ram8out2);
	ram83: Ram8 port map(clock=>clock , input=>input , load=>s(2) , address=>address(2 downto 0) , output=>ram8out3);
	ram84: Ram8 port map(clock=>clock , input=>input , load=>s(3) , address=>address(2 downto 0) , output=>ram8out4);
	ram85: Ram8 port map(clock=>clock , input=>input , load=>s(4) , address=>address(2 downto 0) , output=>ram8out5);
	ram86: Ram8 port map(clock=>clock , input=>input , load=>s(5) , address=>address(2 downto 0) , output=>ram8out6);
	ram87: Ram8 port map(clock=>clock , input=>input , load=>s(6) , address=>address(2 downto 0) , output=>ram8out7);
	ram88: Ram8 port map(clock=>clock , input=>input , load=>s(7) , address=>address(2 downto 0) , output=>ram8out8);
	
	mux: Mux8Way16 port map(a=>ram8out1,
									b=>ram8out2,
									c=>ram8out3,
									d=>ram8out4,
									e=>ram8out5,
									f=>ram8out6,
									g=>ram8out7,
									h=>ram8out8,
									sel=>address(5 downto 3),
									q=>output);
									
end architecture rtl;