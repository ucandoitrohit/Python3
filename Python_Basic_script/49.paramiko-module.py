import paramiko
#paramiko module used to work with remote server
# it will create a ssh client by using this it will connect remote server and execute comand
# we can also transfer file from one server to another or local
# Local Server          Remote Server
# Windows               Windows
# Windows               Linux
# Linnux                 Windows
# Linux                 Linux


ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy)
ssh.connect(hostname='192.168.0.107',username='root',password='redhat',port='22')
#ssh.connect(hostname='192.168.0.107',username='root',password='redhat', key_filename='file.txt' port='22')
stdin, stdout, stderr = ssh.exec_command('whoami')
print("Output--")
print(stdout.readline())

print("error--")
print(stderr.read())
