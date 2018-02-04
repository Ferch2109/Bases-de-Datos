archivos = ["curp", "tipo", "costo", "beneficios", "puntos","datereg","dateven"]

files = []
for arch in archivos:
	file = open(arch+".txt", "r")
	files.append(file.readlines())

insert = ""
for x in range(0,100):
	insert = insert+"INSERT into Membresia VALUES("
	insert = insert+"'"+files[0][x].rstrip('\n')+"','"+files[1][x].rstrip('\n')+"',"
	insert = insert+files[2][x].rstrip('\n')+",'"+files[3][x].rstrip('\n')+"',"
	insert = insert+files[4][x].rstrip('\n')
	insert = insert+",TO_DATE('"+files[5][x].rstrip('\n')+"','YYYYMMDD'),"
	insert = insert+"TO_DATE('"+files[6][x].rstrip('\n')+"','YYYYMMDD'));\n"


file = open("membresia.sql","w")
file.write(insert)
file.close()