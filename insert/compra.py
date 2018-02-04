import random
import linecache

def socio():
	i = random.randint(1,100)
	return (linecache.getline("curp_socio.txt",i)).rstrip('\n')

def producto():
	i = random.randint(1,100)
	return (linecache.getline("idprod.txt",i)).rstrip('\n')


insert = ""
for x in range(0,100):
	insert = insert+"INSERT into Compra VALUES("
	insert = insert+"'"+socio()+"','"
	insert = insert+producto()+"');\n"


file = open("compra.sql","w")
file.write(insert)
file.close()