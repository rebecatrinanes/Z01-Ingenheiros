library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



ARCHITECTURE logic OF MemoryIO IS

  component Screen is
      PORT(
          INPUT        : IN STD_LOGIC_VECTOR(15 downto 0);
          LOAD         : IN  STD_LOGIC;
          ADDRESS      : IN STD_LOGIC_VECTOR(13 downto 0);

          -- Sistema
          CLK_FAST : IN  STD_LOGIC;
          CLK_SLOW : IN  STD_LOGIC;
          RST 	   : IN  STD_LOGIC;

          -- LCD EXTERNAL I/OS
          LCD_INIT_OK  : OUT STD_LOGIC;
          LCD_CS_N     : OUT   STD_LOGIC;
          LCD_D        : INOUT STD_LOGIC_VECTOR(15 downto 0);
          LCD_RD_N     : OUT   STD_LOGIC;
          LCD_RESET_N  : OUT   STD_LOGIC;
          LCD_RS       : OUT   STD_LOGIC;	-- (DCx) 0 : reg, 1: command
          LCD_WR_N     : OUT   STD_LOGIC
          );
  end component;

  	component RAM16K IS
     	 PORT
      		(
          	address	: IN STD_LOGIC_VECTOR (13 DOWNTO 0);
          	clock		: IN STD_LOGIC  := '1';
          	data		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
         	wren		: IN STD_LOGIC ;
          	q		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
      		);
 	end component;

  	component Register16 
		port(

		clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(15 downto 0);
		load:    in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;
	component Mux16
		port(
			
		a:   in  STD_LOGIC_VECTOR(15 downto 0);
		b:   in  STD_LOGIC_VECTOR(15 downto 0);
		sel: in  STD_LOGIC;
		q:   out STD_LOGIC_VECTOR(15 downto 0)
	);
	end component;
	
	 component DMux4Way
	    port(
		    
	    a:   in  STD_LOGIC;
	    sel: in  STD_LOGIC_VECTOR(1 downto 0);
	    q0:  out STD_LOGIC;
	    q1:  out STD_LOGIC;
	    q2:  out STD_LOGIC;
	    q3:  out STD_LOGIC
  );
  end component;
	
signal s1: STD_LOGIC_VECTOR(1 downto 0);
signal s2: STD_LOGIC;
signal v0,v1,v2, vi: STD_LOGIC;
signal v3,v4,v5: STD_LOGIC_VECTOR(15 DOWNTO 0);
signal a1: STD_LOGIC_VECTOR(13 downto 0);
signal f1: STD_LOGIC_VECTOR(15 downto 0);





BEGIN


s1<= "00" when ADDRESS < "011111111111111";
s1<= "00" when ADDRESS = "011111111111111";
s1<= "00" when ADDRESS = "101001011000000";
s1<= "01" when ADDRESS > "011111111111111" and ADDRESS < "101001010111111";
s1<= "01" when ADDRESS = "101001010111111";
s1<= "10" when ADDRESS = "101001011000000";

s2<= '0' when address = "101001011000000";
s2<= '1' when address < "011111111111111";
s2<= '1' when address = "011111111111111";

  
a1<= ADDRESS(13 downto 0);
m0: DMux4Way port map('1',s1,v0,v1,v2,vi);

m1: RAM16K port map(a1,CLK_FAST,INPUT,v0,v3);

f1 <= "000000" & SW;
m2: Mux16 port map(f1, v3,s2,v4);
OUTPUT <= v4;

LeeD: Register16 port map(CLK_SLOW,INPUT,v1,v5);
LED <= v5(9 downto 0);

 ScReeNN: Screen port map(INPUT,V2,a1,CLK_FAST,CLK_SLOW,RST,LCD_INIT_OK,LCD_CS_N,LCD_D,LCD_RD_N,LCD_RS,LCD_RESET_N,LCD_WR_N);



END logic;
