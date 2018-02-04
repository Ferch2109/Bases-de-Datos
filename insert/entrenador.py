archivos = ["curp", "nombres", "appat", "apmat", "date","sexo"]

files = []
for arch in archivos:
	file = open(arch+".txt", "r")
	files.append(file.readlines())

insert = ""
for x in range(0,100):
	insert = insert+"INSERT into Entrenador VALUES("
	insert = insert+"'"+files[0][x].rstrip('\n')+"','"+files[1][x].rstrip('\n')+"','"
	insert = insert+files[2][x].rstrip('\n')+"','"+files[3][x].rstrip('\n')+"',TO_DATE('"
	insert = insert+files[4][x].rstrip('\n')+"','YYYYMMDD'),'"
	insert = insert+files[5][x].rstrip('\n')+"');\n"


file = open("entrenador.sql","w")
file.write(insert)
file.close()