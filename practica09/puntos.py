import random

puntos = open("cantext.txt","w")

for x in range(0,100):
	puntos.write(str(random.randint(10,780))+'\n')

puntos.close()