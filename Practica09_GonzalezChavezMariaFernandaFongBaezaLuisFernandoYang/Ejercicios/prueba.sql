INSERT into Socio VALUES('AAAJ000820HMNLLSA3','Jesus Daniel','Alvarado','Aldama',TO_DATE('19751231','YYYYMMDD'),77205109,'H','social12@clearevents.ie','Vanessa Jazmin Andrade Ayala 66141811');
--No pasa la prueba porque para el campo del Sexo, forzosamente nos pide que sea Masculino o Femenino.

INSERT into Socio VALUES('AAAJ000820HMNLLSA3','Jesus Daniel','Alvarado','Aldama',TO_DATE('19751231','YYYYMMDD'),77205109,'M','social12@clearevents.ie','Vanessa Jazmin Andrade Ayala 66141811');

INSERT into Entrenador VALUES('GUGF700406MVZTRR06','Francisca','Gutierrez','Garcia',TO_DATE('19700406','YYYYMMDD'),'f');
--No es insertada en la tabla porque el sexo debe de ser escrito en mayúscula.

INSERT into Entrenador VALUES('GUGF700406MVZTRR06','Francisca','Gutierrez','Garcia',TO_DATE('19700406','YYYYMMDD'),'F');

INSERT into Membresia VALUES('AABL980829MMNNRL02','Básica',300,'Acceso ilimitado a todas las Ã¡reas de entrenamiento y regaderas',30,TO_DATE('20171012','YYYYMMDD'),TO_DATE('20201027','YYYYMMDD'));

INSERT into Membresia VALUES('','',300,'Acceso ilimitado a todas las Ã¡reas de entrenamiento y regaderas',,TO_DATE('20171012','YYYYMMDD'),TO_DATE('20201027','YYYYMMDD'));
--No es insertada por llave nula.

INSERT into Dias VALUES(1, 'Lunes');
--Está mal escrito el día.

INSERT into Dias VALUES(1,'LUN');