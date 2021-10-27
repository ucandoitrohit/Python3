import paramiko
p = paramiko.SSHClient()
p.set_missing_host_key_policy(paramiko.AutoAddPolicy())
p.connect("localhost",port=22, username="rohit",password="password")
stdin,stdout,stderr = p.exec_command("uname -a")
out = stdout.readlines()
out = "".join(out)
print(out)