datos = open("datos.txt", "r")
correo = datos.read()

emails = correo.split(", ")
correos = open("correos.txt", "w")

for email in emails:
	correos.write(email.rstrip('\n')+"\n")

datos.close()
correos.close()