datos = open("datos.txt","r")
dateaux = open("dateaux.txt","w")

x = 0
for line in datos:
	x = x+1
	#if x == 1:
	#	curp.write(line)
	#	print(line)
	#if x == 2:
	#	nombres.write(line)
	#if x == 3:
	#	appat.write(line)
	#if x == 4:
	#	apmat.write(line)
	if x == 5:
		dateaux.write(line)
	#if x == 7:
	#	sexo.write(line)
	if x == 19:
		x = 0

datos.close()
dateaux.close()