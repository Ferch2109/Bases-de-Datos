import java.sql.*;
import java.io.IOException;
import java.lang.ClassNotFoundException;
/* Cargamos el controlador */


class ConexionDB{

	/** Creamos un objeto <Statement> a través del cual ejecutaremos sentencias
	  * sql en la BD.
	*/
	private static Statement sentence;
	/*Objeto que sirve para recibir los resultados de una consulta a la BD.*/
	private static ResultSet answer;
	
	/** Método que genera una conexión con la base de datos.
	  * @param <url/> que representa a la base de datos.
	  * @param <user/> usuario de la base de datos.
	  * @param <password/> contraseña.
	  */
	public static void connection(String url, String user, String password){
		
		/*Cargamos el controlador.*/
		try {

            Class.forName("oracle.jdbc.driver.OracleDriver");
        
        } catch (ClassNotFoundException e) {
        
            System.out.println("Error al cargar el controlador.");
            return;
        
        }

        Connection db = null;
		/*Conectamos con la Base de Datos*/
		try {

            db = DriverManager.getConnection(url,user,password);

        } catch (SQLException e) {

            System.out.println("Error para conectar con la base de datos");
            return;

        }

        if (db == null)
            System.out.println("Error para conectar con la base de datos");

        /** Objeto <Statement> a través del cual ejecutaremos sentencias
	  	  * sql en la BD.
		  */
        sentence = db.createStatement();
    }
	
	public static void main(String[] args) {
	
		/*Generamos la conexión con la bd*/
		connection(url,user,password);


		/** Ejecución de una consulta a la BD.
		  * @return La respuesta de la consulta se guarda en <answer>.
		  */
		answer =sentence.executeQuery("");

		/** Leemos los valores (tuplas) devueltas por la ejecución de la sentencia.
		  * En caso de que no se hayan devuelto tuplas el método <next()> devuelve
		  * <false> y <true> en otro caso.*/
		while( answer.next() ){
			
		}

	}

}