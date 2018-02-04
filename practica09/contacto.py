import random
import linecache

nombres = open("nombres.txt", "r")
appat = open("appat.txt", "r")
apmat = open("apmat.txt", "r")
telefonos = open("telefonos.txt", "r")
contactos = open("contactos.txt","w")

def generate_random_contact(n):
	x = random.randint(0,100)
	contacto = ""
	while x == n:
		x = random.randint(0,100)
	
	contacto = (linecache.getline("nombres.txt",x)).rstrip('\n')+" "
	contacto = contacto+(linecache.getline("appat.txt",x)).rstrip('\n')+" "
	contacto = contacto+(linecache.getline("apmat.txt",x)).rstrip('\n')+" "
	return contacto+(linecache.getline("telefonos.txt",x)).rstrip('\n')+"\n"
	

for x in range(0,100):
	contactos.write(generate_random_contact(x))

nombres.close()
appat.close()
apmat.close()
telefonos.close()
contactos.close()