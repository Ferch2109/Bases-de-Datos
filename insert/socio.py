archivos = ["curp", "nombres", "appat", "apmat", "date", "telefonos", "sexo", "correos", "contactos"]

files = []
for arch in archivos:
	file = open(arch+".txt", "r")
	files.append(file.readlines())

insert = ""
for x in range(0,100):
	insert = insert+"INSERT into Socio VALUES("
	insert = insert+"'"+files[0][x].rstrip('\n')+"','"+files[1][x].rstrip('\n')+"','"
	insert = insert+files[2][x].rstrip('\n')+"','"+files[3][x].rstrip('\n')+"',TO_DATE('"
	insert = insert+files[4][x].rstrip('\n')+"','YYYYMMDD'),"+files[5][x].rstrip('\n')+",'"
	insert = insert+files[6][x].rstrip('\n')+"','"+files[7][x].rstrip('\n')+"','"
	insert = insert+files[8][x].rstrip('\n')+"');\n"


file = open("inserta.txt","w")
file.write(insert)
file.close()