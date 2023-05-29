try:
    a=10
    print(a)
except NameError:
    print("Varaible not define")
except Exception as e:
    print("Exception occur",e)
else:
    print("NO Exception")
