DELETE FROM Socio
WHERE Nombre LIKE 'J%';

DELETE FROM Entrenador
WHERE Nombre Like '%a';

DELETE FROM Membresia
WHERE Tipo = 'Basica';

DELETE FROM Dias
WHERE Id_Dia = 1;