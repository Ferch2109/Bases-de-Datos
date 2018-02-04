CREATE TABLE Socio(
  CURP_Socio VARCHAR2(18),
  Nombre VARCHAR2(25),
  Ap_Pat VARCHAR2(25),
  Ap_Mat VARCHAR2(25),
  Fecha_Nacimiento DATE,
  Telefono INTEGER,
  Sexo CHAR(1),
  Email VARCHAR2(100),
  Contacto VARCHAR2(100)
);
                

CREATE TABLE TipoMembresia(
  Tipo CHAR(7),
  AccesoAreas CHAR(1),
  Regaderas CHAR(1),
  Casillero CHAR(1),
  Entrenador_Pers CHAR(1),
  Esp_Nutricion CHAR(1)
);

CREATE TABLE Producto(
  Id_Producto VARCHAR2(7),
  Nombre VARCHAR2(25),
  Marca VARCHAR2(25),
  Precio INTEGER,
  Cantidad_Existencia INTEGER,
  Descripción VARCHAR2(100),
  Presentación VARCHAR2(25)
);

CREATE TABLE Compra(
  CURP_Socio VARCHAR2(18),
  Id_Producto VARCHAR2(7)
);

CREATE TABLE Entrenador(
  CURP_Entrenador VARCHAR2(18),
  Nombre VARCHAR2(25),
  Ap_Pat VARCHAR2(25),
  Ap_Mat VARCHAR2(25),
  Fecha_Nacimiento DATE,
  Sexo CHAR(1)
);
                  
CREATE TABLE Impartir(
  CURP_Entrenador VARCHAR2(18),
  Nombre_Clase CHAR(5)
);            
 
CREATE TABLE Clase(
  Nombre CHAR(20),
  Hora_Inicio CHAR(4),
  Hora_Fin CHAR (4),
  Costo INTEGER,
  Puntos INTEGER,
  Duracion INTEGER
);

CREATE TABLE TomarClase(
  CURP_Socio VARCHAR2(18),
  Nombre_Clase CHAR(5)
);

CREATE TABLE Dias(
  Id_Dia INTEGER,
  Nombre CHAR(10)
);

CREATE TABLE DiasClase(
  Nombre_Clase CHAR(5),
  Id_Dia INTEGER
);