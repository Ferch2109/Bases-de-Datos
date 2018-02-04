import random
import linecache

def clase():
	i = random.randint(0,4)
	clases = ["Yoga","Danza Árabe","Boxeo","Twerk","Zumba"]
	return clases[i]

archivos = ["curp_entrenador"]

files = []
for arch in archivos:
	file = open(arch+".txt", "r")
	files.append(file.readlines())

insert = ""
for x in range(0,100):
	clases = [" "]
	clas = ""
	r = random.randint(0,2)
	if(r > 0):
		for i in range(0,r):
			insert = insert+"INSERT into Impartir VALUES("
			insert = insert+"'"+files[0][x].rstrip('\n')+"','"
			clas = clase()
			if clas not in clases:
				clases.append(clas)
			else:
				while( clas in clases):
					clas = clase()
				clases.append(clas)
			insert = insert+clas+"');\n"

file = open("impartir.sql","w")
file.write(insert)
file.close()