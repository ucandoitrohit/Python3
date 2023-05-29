import os
sfile="source.txt"
dfile="destination.txt"

sfo=open(sfile,'r')
content=sfo.read()
sfo.close()

print(content)


dfo=open(dfile,'w')

cc = dfo.write(content)
dfo.close()

