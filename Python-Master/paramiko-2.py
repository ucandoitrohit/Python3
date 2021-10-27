# Login to Multiple Server and Run a Command
import paramiko

p = paramiko.SSHClient()
cred = open("Book1.csv","r")
for i in cred.readlines():
    try:
        line = i.strip()
        ls = line.split(",")
        print(line)
        print(ls)
        p.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        p.connect("%s"%ls[0],port=22, username="%s"%ls[1],password="%s"%ls[2])
        #p.connect("localhost",port=22, username="rohit",password="password")
        stdin,stdout,stderr = p.exec_command("uname -a")
        out = stdout.readlines()
        out = "".join(out)
        print(out)
        temp = open("%s.txt"%ls[0],"w")
        temp.write(out)
        temp.close()
    except Exception as e:
        print(e)
cred.close()

