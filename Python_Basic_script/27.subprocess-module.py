import os

print(os.system('dir'))
dircmd= os.system('dir')
print(dircmd)

# above cmd can store the output of dir in variable so we can  use this, so we use subprocess
import subprocess

#syntax
#===========
#sp=subprocess.Popen(cmd, shell=True/False, stdout=subprocess.PIPE,stderr=subprocess.PIPE)
#src=sp.wait()
#out,err = sp.communicate()
#print(f"OutPut is - {out}")
#print(f"Error os -  {err}")

#if Shell=True then we use below cmd as a string
#cmd = 'dir'
#cmd = 'ls -ltr'
#Shell=True

# if Shell=False then we use below cmd as a list
#cmd = ['ls','-ltr']
#Shell=False


#Example
import subprocess
cmd = 'ls -ltr'
sp=subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE,stderr=subprocess.PIPE)
rc=sp.wait()
out,err = sp.communicate()
print(f"Return Code is - {rc}")

print(f"OutPut is - {out}")
print(f"Error os -  {err}")

print("==========================================================================")
cmd = 'ls -ltr'
sp=subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE,stderr=subprocess.PIPE, universal_newlines=True)
rc=sp.wait()
out,err = sp.communicate()
print(f"Return Code is - {rc}")

print(f"OutPut is - {out}")
print(f"Error os -  {err}")

  
print("==========================================================================")
#cmd = 'ls -ltr'.split()
#cmd2=['ls','-ltr']
cmd2=['echo' ,'$HOME']
sp=subprocess.Popen(cmd2, shell=False, stdout=subprocess.PIPE,stderr=subprocess.PIPE, universal_newlines=True)
rc=sp.wait()
out,err = sp.communicate()
print(f"Return Code is - {rc}")

print(f"OutPut is - {out}")
print(f"Error os -  {err}")


print("==========================================================================")
#cmd = 'ls -ltr'.split()
#cmd2=['ls','-ltr']
cmd="echo $HOME"

sp=subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE,stderr=subprocess.PIPE, universal_newlines=True)
rc=sp.wait()
out,err = sp.communicate()
print(f"Return Code is - {rc}")

print(f"OutPut is - {out}")
print(f"Error os -  {err}")

  
# if we work on env variable it must use shell=true then only out will come
# shell= False don't work on your os env variable