package hercules.src.clases.auxiliares;
import java.io.*;

/**
 * Clase que registra, busca, elimina y actualiza registros.
 * <Throws> {@link IOException}
 **/
public class LERegistros{
	
	private static File f;
	private static FileReader fr;
	private static FileWriter fw;
	private static BufferedReader br;
	private static BufferedWriter bw;

	/**
	 * Método auxiliar.
	 * Prepara un archivo <archivo> para su escritura o lectura. 
	 * @param archivo ruta del archivo.
	 * @param io bandera que indica si es para lectura o escritura.
	 **/
	private static void open(Archivos archivo, IOFile io) 
							throws IOException{

		File f = new File(archivo.getRuta());

		if(io == IOFile.LEER){
			fr = new FileReader(archivo.getRuta());
			br = new BufferedReader(fr);
		}

		if(io == IOFile.ESCRIBIR){
			fw = new FileWriter(archivo.getRuta());
			bw = new BufferedWriter(fw);
		}

	}

	/**
	 * Método auxiliar.
	 * Cierra un archivo <archivo>.
	 * @param io bandera que indica si el archivo
	 * era para lectura o escritura.
	 **/
	private static void close(IOFile io) throws IOException{
		
		if(io == IOFile.LEER)
			br.close();

		if(io == IOFile.ESCRIBIR)
			bw.close();

	}

	/**
	 * Método auxiliar.
	 * Extrae el id de un registro.
	 * @param registro el registro del cual extraer el id.
	 * @return id regresa el id correspondiente al registro.
	 **/
	private static int getId(String registro){
		
		//Substrae los primeros 7 caracteres.
		String id = registro.substring(0,7);
		//Regresa el valor entero.
		return Integer.parseInt(id);

	}

	/**
	 * Método auxiliar que realiza modificaciones en los archivos
	 * de registros.
	 * @modificacion parametro que indica si se debe eliminar (0)
	 * o actualizar (1).
	 **/
	private static void auxiliarModificaciones( String anterior, String actual, 
											Archivos archivo, int modificacion)
											throws IOException{

		//Preparamos el archivo para leer.
		open(archivo, IOFile.LEER);
		//Aquí se guardará cada linea que se lea del archivo.
		String registro = new String();
		//Creamos un archivo temporal.
		File temporal = new File(f.getAbsolutePath()+".tmp");
		FileWriter tmp = new FileWriter(temporal);

		//Recorremos el archivo
		while( (registro = br.readLine()) == null ){
			//Buscamos coincidencia con el registro a eliminar.
			if( !(registro.trim().equals(anterior.trim())) )
				//copiamos el registro al nuevo archivo.
				tmp.write(registro);
			else
				//En caso de que haya que actualizar adjuntamos la modificación.
				if(modificacion == 1)
					//escribimos la actualización
					tmp.write(actual);
		}
		//Cerramos el archivo temporal.
		tmp.close();
		//Cerramos el archivo.
		close(IOFile.LEER);
		//Eliminamos el archivo original.
		f.delete();
		//Renombramos el archivo temporal como el actual.
		temporal.renameTo(f);

	}

	/**
	 * Escribe un registro en un archivo.
	 * @param registro registro a escribir.
	 * @param archivo ruta del archivo.
	 **/
	public static void registrar(String registro, Archivos archivo)
								throws IOException{

		//Preparamos el archivo para leer.
		open(archivo, IOFile.ESCRIBIR);
		
		//Escribimos en el archivo
		bw.write(registro);
		//Salto de linea para el siguiente registro.
		bw.newLine();

		//Cerramos el archivo.
		close(IOFile.ESCRIBIR);

	}

	/**
	 * Dado un id y una ruta de archivos devuelve el registro relacionado.
	 * @param id identificador del registro.
	 * @param archivo ruta del archivo.
	 * @return el registro a buscado si existe, <null> en otro caso.
	 **/
	public static String buscar(int id, Archivos archivo)throws IOException{

		//Preparamos el archivo para leer.
		open(archivo, IOFile.LEER);
		//Aquí se guardará cada linea que se lea del archivo.
		String registro = new String();
		//Bandera para saber si se encontro el registro.
		boolean buscando = true;

		//Recorremos el archivo
		while( buscando ){
			//En caso de terminar interrumpimos el ciclo.
			if( (registro = br.readLine()) == null )
				break;
			//Buscamos coincidencia con el id a encontrar.
			if( getId(registro) == id )
				buscando = false;
		}

		//Cerramos el archivo.
		close(IOFile.LEER);
		/*En caso de que la bandera sea true regresamos null
		ya que no se encuentra el registro.*/
		return ( (buscando) ? null : registro );

	}


	/**
	 * Actualiza un registro de un archivo.
	 * @param registroAnterior registro a actualizar.
	 * @param registroNuevo actualización del registro.
	 * @param archivo ruta del archivo.
	 **/
	public static void actualizar( String registroAnterior, 
									String registroNuevo, Archivos archivo )
								throws IOException{

		auxiliarModificaciones( registroAnterior, registroNuevo, archivo, 1 );
	
	}

	/**
	 * Elimina un registro de un archivo.
	 * @param registro registro a eliminar.
	 * @param archivo ruta del archivo.
	 **/
	public static void eliminar( String registro, Archivos archivo )
								throws IOException{

		auxiliarModificaciones( registro, null, archivo, 0 );
	
	}
	 
	 		
}