#shutil module
import shutil
print(dir(shutil))

#'copy', 'copy2', 'copyfile', 'copyfileobj', 'copymode', 'copystat', 'copytree

#copyfile- it will not presever the permission
src=''
dest=''
shutil.copyfile(src,dest)
#copy will presever the permission also
shutil.copy(src,dest)
