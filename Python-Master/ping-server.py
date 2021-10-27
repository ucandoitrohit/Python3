import subprocess
import platform

def ping(host):
    param = '-n' if platform.system().lower() == 'windows' else '-c'
    command = ['ping', param,'1', host]
    return subprocess.call(command)

#host = 'google.com'
host = 'localhost'
print(ping(host))