import random

idprod = open("presentacion.txt","w")


ids = ["1029475"]

for x in range(0,99):

	i = random.randint(1,1)
	line = ""
	while i > 0:
		r = ''.join(random.sample("ABCDEFGHIJKLMNOPQRSTUVWXZ", 25))
		line = line+r
		i = i-1

	idprod.write(line+'\n')


idprod.close()