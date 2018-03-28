-- Elementos de Sistemas
-- by Luciano Soares
-- Ram4K.vhd

Library ieee; 
use ieee.std_logic_1164.all;
  
entity Ram4K is
	port(
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR(11 downto 0);
		output:  out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture arch of Ram4K is

	component Ram512 is
		port(
			clock:   in  STD_LOGIC;
			input:   in  STD_LOGIC_VECTOR(15 downto 0);
			load:    in  STD_LOGIC;
			address: in  STD_LOGIC_VECTOR( 8 downto 0);
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
	signal Ram512out1,Ram512out2,Ram512out3,Ram512out4,Ram512out5,Ram512out6,Ram512out7,Ram512out8 :STD_LOGIC_VECTOR(15 downto 0); -- sinais da saída dos ram8

begin

	dmux: DMux8Way port map(a=>load, 
									sel=>address(11 downto 9),
									q0=>s(0),
									q1=>s(1),
									q2=>s(2),
									q3=>s(3),
									q4=>s(4),
									q5=>s(5),
									q6=>s(6),
									q7=>s(7));
	
	Ram5121: Ram512 port map(clock=>clock , input=>input , load=>s(0) , address=>address(8 downto 0) , output=>ram512out1);
	Ram5122: Ram512 port map(clock=>clock , input=>input , load=>s(1) , address=>address(8 downto 0) , output=>Ram512out2);
	Ram5123: Ram512 port map(clock=>clock , input=>input , load=>s(2) , address=>address(8 downto 0) , output=>ram512out3);
	Ram5124: Ram512 port map(clock=>clock , input=>input , load=>s(3) , address=>address(8 downto 0) , output=>Ram512out4);
	Ram5125: Ram512 port map(clock=>clock , input=>input , load=>s(4) , address=>address(8 downto 0) , output=>Ram512out5);
	Ram5126: Ram512 port map(clock=>clock , input=>input , load=>s(5) , address=>address(8 downto 0) , output=>Ram512out6);
	Ram5127: Ram512 port map(clock=>clock , input=>input , load=>s(6) , address=>address(8 downto 0) , output=>Ram512out7);
	Ram5128: Ram512 port map(clock=>clock , input=>input , load=>s(7) , address=>address(8 downto 0) , output=>Ram512out8);
	
	mux: Mux8Way16 port map(a=>Ram512out1,
									b=>Ram512out2,
									c=>Ram512out3,
									d=>Ram512out4,
									e=>Ram512out5,
									f=>Ram512out6,
									g=>Ram512out7,
									h=>Ram512out8,
									sel=>address(11 downto 9),
									q=>output);
									
end architecture arch;