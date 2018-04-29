/**
 * Curso: Elementos de Sistemas
 * Arquivo: SymbolTable.java
 */
package assembler;

import java.util.HashMap;
import java.util.Map;

public class SymbolTable{
	
	Map<String, Integer> dictionary = new HashMap<String, Integer>();
	

    public SymbolTable() {
    	    	
		for (int i=0; i<16; i++){
			dictionary.put("R"+Integer.toString(i), new Integer(i));
    	}
		dictionary.put("SP", new Integer(0));
		dictionary.put("LCL", new Integer(1));
		dictionary.put("ARG", new Integer(2));
		dictionary.put("THIS", new Integer(3));
		dictionary.put("THAT", new Integer(4));
		dictionary.put("SCREEN", new Integer(16384));
		dictionary.put("LED", new Integer(21184));
		dictionary.put("SW", new Integer(21185));
    }
    
    public void addEntry(String symbol, int address) {
    	dictionary.put(symbol, address);
    }

    public Boolean contains(String symbol) {    	
    	return dictionary.containsKey(symbol);
    }

    
    public Integer getAddress(String symbol) {
    	dictionary.get(symbol);
    	return null;
    }

}