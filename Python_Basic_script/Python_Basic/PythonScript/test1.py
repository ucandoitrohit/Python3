import subprocess
subprocess.call(["ls","-l"])

print("\n")
uname = "uname"
uname_arg = "-a"
subprocess.call([uname, uname_arg])

subprocess.call("df -h", shell=True)

subprocess.call?
