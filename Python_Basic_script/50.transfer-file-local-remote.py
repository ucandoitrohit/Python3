import paramiko

ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())

ssh.connect(hostname='192.168.0.107',username='root',password='redhat',port='22')
sftp_client=ssh.open_sftp()
print(dir(sftp_client))

sftp_client.chdir('/home/rohit')
print(sftp_client.getcwd())
sftp_client.get('source location', 'destination-remoteserer')

sftp_client.close()
ssh.close()

