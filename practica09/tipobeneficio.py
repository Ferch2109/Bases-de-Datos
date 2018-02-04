import random

tipo = open("tipo.txt","w")
beneficios = open("beneficios.txt","w")
costo = open("costo.txt", "w")

for x in range(0,100):
	i = random.randint(1,3)
	if i == 1:
		tipo.write("Básica\n")
		beneficios.write("Acceso ilimitado a todas las áreas de entrenamiento y regaderas.\n")
		costo.write("300\n")
	if i == 2:
		tipo.write("Plus\n")
		beneficios.write("Acceso ilimitado a todas las áreas de entrenamiento y regaderas, asignación de casillero y entrenador personal.\n")
		costo.write("450\n")
	if i == 3:
		tipo.write("Premium\n")
		beneficios.write("Acceso ilimitado a todas las áreas de entrenamiento,regaderas y saunas, asignación de casillero, entrenador personal, especialista en nutrición y un sistema de puntos.\n")
		costo.write("700\n")


tipo.close()
beneficios.close()
costo.close()