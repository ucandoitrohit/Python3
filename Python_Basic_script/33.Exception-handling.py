#Exception Handling
# 2 types of error
# --- Syntax Error --> No way to handler
#---- Runtime Error - can be handle by exception

#Example:
'''
try:
    print(4/0)
except:
    print("Zero Can't divide Value")
'''

try:
    print(4/0)
except Exception as e:
    print(e,"Zero Can't divide Value")   

#excption are-
#NameError
#TypeError
#FileNotFoundError
#ZeroDivisionError
# 
print("=="*30) 
try:
    print(a)
    #print(4+"hi")
    #open('filename.txt')
    #print(5/0)
    #import fabric
except FileNotFoundError:
    print("File not found")
except NameError:
    print("Variable not define")    
except TypeError:
    print("Adding number to string in not possible")   
except ZeroDivisionError:
    print("Division with zero is not present")
except ModuleNotFoundError:
    print("Please install fabrix")
except Exception as e:
    print(e)
finally:
    print("Done")      