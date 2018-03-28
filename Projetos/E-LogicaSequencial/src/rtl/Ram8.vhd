-- Elementos de Sistemas
-- by Luciano Soares
-- Ram8.vhd

Library ieee; 
use ieee.std_logic_1164.all;
  
entity Ram8 is
	port(
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR( 2 downto 0);
		output:  out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture rtl of ram8 is
	
	component Register16 is
		port(
			clock:   in STD_LOGIC;
			input:   in STD_LOGIC_VECTOR(15 downto 0);
			load:    in STD_LOGIC;
			output: out STD_LOGIC_VECTOR(15 downto 0)
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

	signal dmuxout0,dmuxout1,dmuxout2,dmuxout3,dmuxout4,dmuxout5,dmuxout6,dmuxout7 :std_logic; --sinais da saída do Dmux
	signal regout0,regout1,regout2,regout3,regout4,regout5,regout6,regout7 :STD_LOGIC_VECTOR(15 downto 0); -- sinais da saída dos registradores

begin
	

	-- o dmux nesse código tem a função de selecionar por conta do address, os sinais load que irão para cada um do registradores
	dmuxsel: DMux8Way port map(a=>load , sel=>address,
		q0=>dmuxout0,
		q1=>dmuxout1,
		q2=>dmuxout2,
		q3=>dmuxout3,
		q4=>dmuxout4,
		q5=>dmuxout5,
		q6=>dmuxout6,
		q7=>dmuxout7);

	-- os registradores irão através do sinal enviado pelo dmux, saber se é necessário ou não guardar o vetor de 16 bits do input
	reg1: Register16 port map(clock=>clock , input=>input , load=>dmuxout0 , output=>regout0);
	reg2: Register16 port map(clock=>clock , input=>input , load=>dmuxout1 , output=>regout1);
	reg3: Register16 port map(clock=>clock , input=>input , load=>dmuxout2 , output=>regout2);
	reg4: Register16 port map(clock=>clock , input=>input , load=>dmuxout3 , output=>regout3);
	reg5: Register16 port map(clock=>clock , input=>input , load=>dmuxout4 , output=>regout4);
	reg6: Register16 port map(clock=>clock , input=>input, load=>dmuxout5 , output=>regout5);
	reg7: Register16 port map(clock=>clock , input=>input , load=>dmuxout6 , output=>regout6);
	reg8: Register16 port map(clock=>clock , input=>input , load=>dmuxout7 , output=>regout7);

	-- O Mux recebe todos outputs dos registradores para gerar o output do que deve ser guardado ou não
	mux: Mux8Way16 port map(a=>regout0,
		b=>regout1,
		c=>regout2,
		d=>regout3,
		e=>regout4,
		f=>regout5,
		g=>regout6,
		h=>regout7,
		sel=>address,
		q=>output);
end architecture rtl;