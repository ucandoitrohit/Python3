'''
file_open=open('newdemo.txt','w')
print(file_open.mode)
print(file_open.readable)
print(file_open.writable)
file_open.close()
'''

print("==================================")
#write some content ine by line
print("write some content ine by line")
file_open=open('newdemo1.txt','w')
file_open.write("This is first line\n")
file_open.write("This is seconf` line\n")
file_open.close()

print("==================================")
#write some content by listing
content=["This is First Line\n","This is Second listing Line\n"]
file_open=open('newdemo2.txt','w')
file_open.writelines(content)
file_open.close()

print("==================================")
#write some content by listing by loop
content=["This is First Line\n","This is Second Line loop\n"]
file_open=open('newdemo3.txt','w')
for each_line in content:
    file_open.write(each_line+"\n")
file_open.close()

# Use append mode
# if file is not there then append mode will create it
file_open=open('newdemo3.txt','a')
for each_line in content:
    file_open.write(each_line+"\n")
file_open.close()

#===============================================================
# Use read mode
# if file is not there then append mode will create it
file_open=open('newdemo3.txt','r')
for each_line in content:
    print(file_open.readlines())
file_open.close()


