package models;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

public class Listas {
	
	public static HashMap<String, String> prioridad(){
		HashMap<String, String> lista = new HashMap<String, String>();
		lista.put("baja","Baja");
		lista.put("media","Media");
		lista.put("alta","Alta");
		
		return lista;
		
	}
	
	public static HashMap<String, String> fases(){
		HashMap<String, String> lista = new HashMap<String, String>();
		lista.put("inicial","Inicial");
		lista.put("progreso","En Progreso");
		lista.put("cerrada","Cerrada");		
		return lista;
		
	}
	
	public static HashMap<String, String> codigoCerrada(){
		HashMap<String, String> lista = new HashMap<String, String>();
		lista.put("satisfactoria","Completada satisfactoriamente");
		lista.put("insatisfactoria","No se completo satisfactoriamente");
		
		
		
		return lista;
		
		
		
	}
	
	
	
}
