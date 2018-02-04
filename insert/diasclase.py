import random
import linecache

insert = ""

clases = ["Yoga","Danza Árabe","Boxeo","Twerk","Zumba"]
for clase in clases:
	rand = [0]
	r = random.randint(1,7)
	for x in range(0,r):
		insert = insert+"INSERT into DiasClase VALUES("
		insert = insert+"'"+clase+"','"
		r2 = random.randint(1,7)
		if r2 not in rand:
			rand.append(r2)
		else:
			while(r2 in rand):
				r2 = random.randint(1,7)
			rand.append(r2)
		insert = insert+str(r2)+"');\n"

file = open("diasclase.sql","w")
file.write(insert)
file.close()