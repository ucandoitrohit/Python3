import os

if os.uname()[-1] == 'x86_64':
    print('Os is 64 Bit.')
else:
    print('OS is 32 Bit.')