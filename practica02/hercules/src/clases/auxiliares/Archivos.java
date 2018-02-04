package hercules.src.clases.auxiliares;

/**
 * Enumeración para manejar las rutas de archivos
 * en la clase {@link LERegistros} y las subopciones
 * de menu en la clase principal {@link Hercules}.
 **/
public enum Archivos{

	CLIENTES("../../archivos/Clientes.txt"),
	CLASES("../../archivos/Clases.txt"),
	CLASES_IMPARTIDAS("../../archivos/CLasesImpartidas.txt");

	private final String ruta;

	Archivos(String ruta){
		this.ruta = ruta;
	}

	/**
	 * Regresa la ruta del archivo correspondiente a la
	 * enumeración.
	 * @return ruta del archivo.
	 **/
	public String getRuta(){ return ruta; }

}