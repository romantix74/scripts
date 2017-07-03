	
#for i in range(76,122+1):
#	print('10.5.9.{}'.format(i))

out = []	
	
with open('input.txt', 'r') as f:
	out = f.readlines()
	
for i,str in enumerate(out):
	s = str.split()
	#str(i)
	print('10.5.9.{0} {1}'.format(i+96, s[1]))