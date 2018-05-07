/**
 * Curso: Elementos de Sistemas
 * Arquivo: SymbolTableTest.java
 * Created by Luciano Soares <lpsoares@insper.edu.br> 
 * Date: 16/04/2017
 */

package assembler;

import org.junit.Test;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertNotNull;

import assembler.SymbolTable;

public class SymbolTableTest {

    SymbolTable table = null;

    /**
     * Create the test case
     *
     */
    public SymbolTableTest() {
        table = new SymbolTable();
    }

    /**
     * Teste verificar s�mbolos padr�es, inserido ao iniciar o sistema
     */
    @Test
    public void testSymbolTable_initialization() {

    	
        assertNotNull("Falha a criar o SymbolTable",table);

        try {
        	org.junit.Assume.assumeNotNull( table.contains("X") );		// ignora test
        } catch(Exception e) { 
        	org.junit.Assume.assumeNoException(e);
        }
        
        try {

            assertTrue("Testando se Tabela de S�mbolos CONT�M R0",table.contains("R0"));
            assertTrue("Verificando se R0 vale 0 na Tabela de S�mbolos",table.getAddress("R0")==0);

            assertTrue("Testando se Tabela de S�mbolos CONT�M R1",table.contains("R1"));
            assertTrue("Verificando se R1 vale 1 na Tabela de S�mbolos",table.getAddress("R1")==1);

            assertTrue("Testando se Tabela de S�mbolos CONT�M R2",table.contains("R2"));
            assertTrue("Verificando se R2 vale 2 na Tabela de S�mbolos",table.getAddress("R2")==2);

            assertTrue("Testando se Tabela de S�mbolos CONT�M R3",table.contains("R3"));
            assertTrue("Verificando se R3 vale 3 na Tabela de S�mbolos",table.getAddress("R3")==3);

            assertTrue("Testando se Tabela de S�mbolos CONT�M R4",table.contains("R4"));
            assertTrue("Verificando se R4 vale 4 na Tabela de S�mbolos",table.getAddress("R4")==4);

            assertTrue("Testando se Tabela de S�mbolos CONT�M R5",table.contains("R5"));
            assertTrue("Verificando se R5 vale 5 na Tabela de S�mbolos",table.getAddress("R5")==5);

            assertTrue("Testando se Tabela de S�mbolos CONT�M R6",table.contains("R6"));
            assertTrue("Verificando se R6 vale 6 na Tabela de S�mbolos",table.getAddress("R6")==6);

            assertTrue("Testando se Tabela de S�mbolos CONT�M R7",table.contains("R7"));
            assertTrue("Verificando se R7 vale 7 na Tabela de S�mbolos",table.getAddress("R7")==7);

            assertTrue("Testando se Tabela de S�mbolos CONT�M R8",table.contains("R8"));
            assertTrue("Verificando se R8 vale 8 na Tabela de S�mbolos",table.getAddress("R8")==8);

            assertTrue("Testando se Tabela de S�mbolos CONT�M R9",table.contains("R9"));
            assertTrue("Verificando se R9 vale 9 na Tabela de S�mbolos",table.getAddress("R9")==9);

            assertTrue("Testando se Tabela de S�mbolos CONT�M R10",table.contains("R10"));
            assertTrue("Verificando se R10 vale 10 na Tabela de S�mbolos",table.getAddress("R10")==10);

            assertTrue("Testando se Tabela de S�mbolos CONT�M R11",table.contains("R11"));
            assertTrue("Verificando se R11 vale 11 na Tabela de S�mbolos",table.getAddress("R11")==11);

            assertTrue("Testando se Tabela de S�mbolos CONT�M R12",table.contains("R12"));
            assertTrue("Verificando se R12 vale 12 na Tabela de S�mbolos",table.getAddress("R12")==12);

            assertTrue("Testando se Tabela de S�mbolos CONT�M R13",table.contains("R13"));
            assertTrue("Verificando se R13 vale 13 na Tabela de S�mbolos",table.getAddress("R13")==13);

            assertTrue("Testando se Tabela de S�mbolos CONT�M R14",table.contains("R14"));
            assertTrue("Verificando se R14 vale 14 na Tabela de S�mbolos",table.getAddress("R14")==14);

            assertTrue("Testando se Tabela de S�mbolos CONT�M R15",table.contains("R15"));
            assertTrue("Verificando se R15 vale 15 na Tabela de S�mbolos",table.getAddress("R15")==15);


            assertTrue("Testando se Tabela de S�mbolos CONT�M LED",table.contains("LED"));
            assertTrue("Verificando se LED vale 21184 na Tabela de S�mbolos",table.getAddress("LED")==21184);

            assertTrue("Testando se Tabela de S�mbolos CONT�M SW",table.contains("SW"));
            assertTrue("Verificando se SW vale 21185 na Tabela de S�mbolos",table.getAddress("SW")==21185);


            assertTrue("Testando se Tabela de S�mbolos CONT�M SCREEN",table.contains("SCREEN"));
            assertTrue("Verificando se SCREEN vale 16384 na Tabela de S�mbolos",table.getAddress("SCREEN")==16384);

            assertTrue("Testando se Tabela de S�mbolos CONT�M SP",table.contains("SP"));
            assertTrue("Verificando se SP vale 0 na Tabela de S�mbolos",table.getAddress("SP")==0);

            assertTrue("Testando se Tabela de S�mbolos CONT�M LCL",table.contains("LCL"));
            assertTrue("Verificando se LCL vale 1 na Tabela de S�mbolos",table.getAddress("LCL")==1);

            assertTrue("Testando se Tabela de S�mbolos CONT�M ARG",table.contains("ARG"));
            assertTrue("Verificando se ARG vale 2 na Tabela de S�mbolos",table.getAddress("ARG")==2);

            assertTrue("Testando se Tabela de S�mbolos CONT�M THIS",table.contains("THIS"));
            assertTrue("Verificando se THIS vale 3 na Tabela de S�mbolos",table.getAddress("THIS")==3);

            assertTrue("Testando se Tabela de S�mbolos CONT�M THAT",table.contains("THAT"));
            assertTrue("Verificando se THAT vale 4 na Tabela de S�mbolos",table.getAddress("THAT")==4);
	    	
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Teste para adicionar e checar se s�mbolos j� inserido
     */
    @Test
    public void testSymbolTable_addEntry() {

    	try {
    		table.addEntry("X",0);
    		org.junit.Assume.assumeNotNull( table.contains("X") );		// ignora test
        } catch(Exception e) { 
        	org.junit.Assume.assumeNoException(e);
        }
    	
        try {

            assertFalse("Testando se Tabela de S�mbolos N�O cont�m A",table.contains("A"));
            table.addEntry("A",127);
            assertTrue("Testando se Tabela de S�mbolos CONT�M A",table.contains("A"));
            assertTrue("Verificando se A vale 127 na Tabela de S�mbolos",table.getAddress("A")==127);

            assertFalse("Testando se Tabela de S�mbolos N�O cont�m i",table.contains("i"));
            table.addEntry("i",16);
            assertTrue("Testando se Tabela de S�mbolos CONT�M A",table.contains("i"));
            assertTrue("Verificando se i vale 16 na Tabela de S�mbolos",table.getAddress("i")==16);

            assertFalse("Testando se Tabela de S�mbolos N�O cont�m WxYz",table.contains("WxYz"));
            table.addEntry("WxYz",16383);
            assertTrue("Testando se Tabela de S�mbolos CONT�M WxYz",table.contains("WxYz"));
            assertTrue("Verificando se WxYz vale 16 na Tabela de S�mbolos",table.getAddress("WxYz")==16383);

            assertFalse("Testando se Tabela de S�mbolos N�O cont�m _123",table.contains("_123"));
            table.addEntry("_123",123);
            assertTrue("Testando se Tabela de S�mbolos CONT�M _123",table.contains("_123"));
            assertTrue("Verificando se _123 vale 16 na Tabela de S�mbolos",table.getAddress("_123")==123);

            assertFalse("Testando se Tabela de S�mbolos N�O cont�m LOOP",table.contains("LOOP"));
            table.addEntry("LOOP",0);
            assertTrue("Testando se Tabela de S�mbolos CONT�M LOOP",table.contains("LOOP"));
            assertTrue("Verificando se LOOP vale 16 na Tabela de S�mbolos",table.getAddress("LOOP")==0);
	    	
        } catch(Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * Teste para adicionar e checar v�rios s�mbolos inseridos
     */
    @Test
    public void testSymbolTable_repetitive() {

    	try {
    		table.addEntry("X",0);
    		org.junit.Assume.assumeNotNull( table.contains("X") );		// ignora test
        } catch(Exception e) { 
        	org.junit.Assume.assumeNoException(e);
        }
    	
        try {
    	
            for (int i = 0; i < 16384; i++) {
                table.addEntry("TESTE"+i,0);
            }

            for (int i = 0; i < 16384; i++) {
                assertTrue("Testando intensamente Tabela de S�mbolos",table.contains("TESTE"+i));
            }

            for (int i = 0; i < 16384; i++) {
                assertTrue("Verificando intensamente exist�ncia de S�mbolos",table.getAddress("TESTE"+i)==0);
            }

            for (int i = 0; i < 16384; i++) {
                table.addEntry("END"+i,16383);
            }

            for (int i = 0; i < 16384; i++) {
                assertTrue("Testando intensamente Tabela de S�mbolos",table.contains("END"+i));
            }

            for (int i = 0; i < 16384; i++) {
                assertTrue("Verificando intensamente exist�ncia de S�mbolos",table.getAddress("END"+i)==16383);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

    }


}
