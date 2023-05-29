#Example
# get bash version by subprocess
import subprocess
cmd = ["bash","--version"]
sp=subprocess.Popen(cmd, shell=False, stdout=subprocess.PIPE,stderr=subprocess.PIPE,universal_newlines=True)
rc=sp.wait()
out,err = sp.communicate()
if rc==0:
    for each_line in out.splitlines():
        if "version" in each_line and "release" in each_line:
            ver=each_line.split()[3].split('(')[0]
            print(f"Python Version is:- {ver}")
else:
    print("Command was failed ad error is ",err)
