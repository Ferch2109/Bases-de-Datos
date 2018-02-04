CREATE TABLE Socio(
    id_socio INTEGER PRIMARY KEY NOT NULL,
    nombre VARCHAR(25),
    ap_paterno VARCHAR(25),
    ap_materno VARCHAR(25),
    fecha_nac DATE,
    edad INTEGER,
    sexo char(1),
    CONSTRAINT CHK_Socio CHECK (sexo = 'M' OR sexo = 'F')
);

CREATE TABLE Membresía(
    id_socio INTEGER PRIMARY KEY NOT NULL,
    tipo char(7),
    costo INTEGER,
    beneficios VARCHAR(100),
    fecha_venc DATE,
    CONSTRAINT FK_idSocio FOREIGN KEY (id_socio) REFERENCES Socio(id_socio)
);

CREATE TABLE Producto(
    id_producto INTEGER PRIMARY KEY NOT NULL,
    nombre VARCHAR(50),
    marca VARCHAR(25),
    precio INTEGER,
    cant_exist INTEGER,
    descrip VARCHAR(100),
    presentacion VARCHAR(25)
);

CREATE TABLE Clase(
    nombre VARCHAR(10) PRIMARY KEY NOT NULL,
    hrIni NUMBER(2,2),
    hrFin NUMBER(2,2)
);

ALTER TABLE Clase
ADD costo INTEGER;

CREATE TABLE Entrenador(
    idEntrenador INTEGER PRIMARY KEY NOT NULL,
    nombre VARCHAR(50),
    apPat VARCHAR(50),
    apMat VARCHAR(50),
    fechaNac DATE,
    edad INTEGER,
    sexo CHAR(1)
);

CREATE TABLE Dias(
    nombreClase VARCHAR(50) PRIMARY KEY NOT NULL,
    lun char(1),
    mar char(1),
    mie char(1),
    jue char(1),
    vie char(1),
    sab char(1),
    CONSTRAINT FK_nomClase FOREIGN KEY (nombreClase) REFERENCES Clase(nombre)
);

CREATE TABLE Compra(
    idSocio INTEGER NOT NULL,
    idProducto INTEGER NOT NULL,
    CONSTRAINT FK_idSocio FOREIGN KEY (idSocio) REFERENCES Socio(id_socio),
    CONSTRAINT FK_idProd FOREIGN KEY (idProducto) REFERENCES Producto(id_producto)
);

CREATE TABLE TomarClase(
    idSocio INTEGER NOT NULL,
    nombreClase VARCHAR(10) NOT NULL
);

ALTER TABLE TomarClase
ADD CONSTRAINT FK_idSocioTomarClase
FOREIGN KEY (idSocio) REFERENCES Socio(id_socio);


CREATE TABLE Impartir(
    idEntrenador INTEGER,
    nombreClase VARCHAR(10),
    CONSTRAINT FK_idEntrenador FOREIGN KEY (idEntrenador) REFERENCES Entrenador(idEntrenador),
    CONSTRAINT FK_nombreClaseImp FOREIGN KEY (nombreClase) REFERENCES Clase(nombre)
);
