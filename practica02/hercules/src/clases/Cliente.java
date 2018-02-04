package hercules.src.clases;
import hercules.src.clases.auxiliares.*;
import java.io.IOException;

public class Cliente extends LERegistros{

	private int id;	
	private String name;
	private String direccion;
	private int telefono;

	Cliente(String name, String direccion, int telefono){

		id = generaId();
		this.name = name;
		this.direccion = direccion;
		this.telefono = telefono;

	}

	private int generaId(){
		
		boolean existente = true;
		int id = 0;

		while(existente){
			id = Id.genera();
			existente = (buscar(id) != null);
		}

		return id;

	}

	public static String buscar(int id){
		String registro = null;
		try{
			registro = buscar(id,Archivos.CLIENTES);
		}catch(IOException e){
			System.out.println("Hubo un error al accesar"+
								"a los registros de clientes.");
		}

		return registro;
	}

}