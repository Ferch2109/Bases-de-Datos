ALTER TABLE Socio
ADD CONSTRAINT PK_idSocio
PRIMARY KEY (CURP_Socio);

ALTER TABLE Membresia
ADD CONSTRAINT PK_idMemb
PRIMARY KEY (CURP_Socio, Tipo);

ALTER TABLE TipoMembresia
ADD CONSTRAINT PK_TipoMemb
PRIMARY KEY (Tipo);

ALTER TABLE Producto
ADD CONSTRAINT PK_idProd
PRIMARY KEY (Id_Producto);

ALTER TABLE Compra
ADD CONSTRAINT PK_idCompra
PRIMARY KEY (CURP_Socio, Id_Producto);

ALTER TABLE Entrenador
ADD CONSTRAINT PK_idEntrenador
PRIMARY KEY (CURP_Entrenador);

ALTER TABLE Impartir
ADD CONSTRAINT PK_Impartir
PRIMARY KEY (CURP_Entrenador, Nombre_Clase);

ALTER TABLE Clase
ADD CONSTRAINT PK_Clase
PRIMARY KEY (Nombre);

ALTER TABLE TomarClase
ADD CONSTRAINT PK_TomarClase
PRIMARY KEY (CURP_Socio, Nombre_Clase);

ALTER TABLE Dias
ADD CONSTRAINT PK_Dias
PRIMARY KEY (Id_Dia);

ALTER TABLE Membresia
ADD CONSTRAINT FK_Memb_Socio
FOREIGN KEY (CURP_Socio)
REFERENCES Socio(CURP_Socio);

ALTER TABLE Membresia
ADD CONSTRAINT FK_Memb_Tipo
FOREIGN KEY (Tipo)
REFERENCES TipoMembresia(Tipo);

ALTER TABLE Compra
ADD CONSTRAINT FK_Comp_Socio
FOREIGN KEY (CURP_Socio)
REFERENCES Socio(CURP_Socio);

ALTER TABLE Compra
ADD CONSTRAINT FK_Comp_Produ
FOREIGN KEY (Id_Producto)
REFERENCES Producto(Id_Producto);

ALTER TABLE Impartir
ADD CONSTRAINT FK_Impa_Entre
FOREIGN KEY (CURP_Entrenador)
REFERENCES Entrenador(CURP_Entrenador);

ALTER TABLE Impartir
ADD CONSTRAINT FK_Impa_Clase
FOREIGN KEY (Nombre_Clase)
REFERENCES Clase(Nombre);

ALTER TABLE TomarClase
ADD CONSTRAINT FK_Toma_Socio
FOREIGN KEY (CURP_Socio)
REFERENCES Socio(CURP_Socio);

ALTER TABLE TomarClase
ADD CONSTRAINT FK_Toma_Clas
FOREIGN KEY (Nombre_Clase)
REFERENCES Clase(Nombre);

ALTER TABLE Socio
ADD CONSTRAINT CHK_Curp
CHECK (CURP_Socio IS NOT NULL);

ALTER TABLE Socio
ADD CONSTRAINT CHK_SEXO_Soc
CHECK (Sexo = 'M' OR Sexo = 'F');

ALTER TABLE Membresia
ADD CONSTRAINT CHK_CURP_MEM
CHECK (CURP_Socio IS NOT NULL);

ALTER TABLE Membresia
ADD CONSTRAINT CHK_TIPO_MEM
CHECK (Tipo in ('Basica','Plus','Premium'));

ALTER TABLE Membresia
ADD CONSTRAINT CHK_COST_MEM
CHECK (Costo > 0);

ALTER TABLE Membresia
ADD CONSTRAINT CHK_FECH_MEM
CHECK (Fecha_Registro < Fecha_Vencimiento);

ALTER TABLE TipoMembresia
ADD CONSTRAINT CHK_TIPO_TIP
CHECK (Tipo in ('Basica','Plus','Premium'));

ALTER TABLE Producto
ADD CONSTRAINT CHK_ID_PROD
CHECK (Id_Producto IS NOT NULL);

ALTER TABLE Producto
ADD CONSTRAINT CHK_CANT_PRO
CHECK (Cantidad_Existencia >=  0);

ALTER TABLE Compra
ADD CONSTRAINT CHK_CURP_COM
CHECK (CURP_Socio IS NOT NULL); 

ALTER TABLE Compra
ADD CONSTRAINT CHK_ID_COM
CHECK (Id_Producto IS NOT NULL);

ALTER TABLE Entrenador
ADD CONSTRAINT CHK_ID_ENT
CHECK (Id_Entrenador IS NOT NULL);

ALTER TABLE Entrenador
ADD CONSTRAINT CHK_SEXO_ENT
CHECK (Sexo IN ('F','M'));

ALTER TABLE Impartir
ADD CONSTRAINT CHK_CURP_IMP
CHECK (CURP_Entrenador IS NOT NULL);

ALTER TABLE Impartir
ADD CONSTRAINT CHK_NOMB_IMP
CHECK (Nombre_Clase IS NOT NULL);

ALTER TABLE Clase
ADD CONSTRAINT CHK_NOMB_CLA
CHECK (Nombre IS NOT NULL);

ALTER TABLE Clase
ADD CONSTRAINT CHK_NOMVAL_CLA
CHECK (Nombre IN ('Zumba','Danza Arabe','Twerk','Boxeo','Yoga'));

ALTER TABLE Clase
ADD CONSTRAINT CHK_HRIN_CLA
CHECK (Hora_Inicio < Hora_Fin);

ALTER TABLE Clase
ADD CONSTRAINT CHK_COST_CLA
CHECK (Costo >= 0);

ALTER TABLE TomarClase
ADD CONSTRAINT CHK_CURP_TOMCLA
CHECK (CURP_Socio IS NOT NULL);

ALTER TABLE TomarClase
ADD CONSTRAINT CHK_NOM_TOM
CHECK (Nombre_Clase IS NOT NULL);

ALTER TABLE TomarClase
ADD CONSTRAINT CHK_NOMIN_TOM
CHECK (Nombre_Clase IN ('Zumba','Danza Arabe','Twerk','Boxeo','Yoga'));

ALTER TABLE Dias
ADD CONSTRAINT CHK_NOM_DIA
CHECK (Nombre IN ('LUN','MAR','MIE','JUE','VIE','SAB'));

ALTER TABLE Dias
ADD CONSTRAINT CHK_ID_DIA
CHECK (Id_Dia IS NOT NULL);

ALTER TABLE DiasClase
ADD CONSTRAINT CHK_NOM_CLA
CHECK (Nombre_Clase IS NOT NULL);

ALTER TABLE DiasClase
ADD CONSTRAINT CHK_IDD_DIA
CHECK (Id_Dia IS NOT NULL);

ALTER TABLE Clase
ADD CONSTRAINT CHK_PUN_CLA
CHECK (Puntos > 0);
