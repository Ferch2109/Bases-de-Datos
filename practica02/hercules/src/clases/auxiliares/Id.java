package hercules.src.clases.auxiliares;
import java.util.Random;
import java.lang.Integer;
import java.text.DecimalFormat;
import java.io.IOException;
/**
 * Clase que modela un objeto Id.
 * Posee un único método estático.
 **/
public class Id{

	/**
	 * Genera un id de longitud 7.
	 * @return id de longitud 7, -1 en caso de error.
	 **/
	public static int genera(Archivos archivo){

		Random r = new Random();
		int id = -1;

		try{
			do{
				//Número random de 0-7 digitos.
				id = r.nextInt(10000000);
				//Formato de 7 dígitos.
				DecimalFormat df = new DecimalFormat("0000000");
				//Aplicación del formato.
				String idPrevio = df.format(id);
				//Conversión a entero.
				id = Integer.parseInt(idPrevio);

			/*Genera un id hasta que no haya coincidencia con los
			ya existentes.*/
			}while(LERegistros.buscar(id,archivo) != null);
		
		}catch(IOException e){
			System.out.println("Error al acceder a archivo.");
			id = -1;
		}

		return id;
	}

}