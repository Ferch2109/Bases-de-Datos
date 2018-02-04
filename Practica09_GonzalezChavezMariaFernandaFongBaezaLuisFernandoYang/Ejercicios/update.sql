UPDATE Socio
SET Nombre = 'Actualizado'
WHERE Nombre LIKE '%s%';

UPDATE Entrenador
SET Nombre = 'Actualizado'
WHERE Nombre LIKE '%e%';

UPDATE Dias
Set Nombre = 'LUN'
WHERE Id_Dia IN (2,7);