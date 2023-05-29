#AssertionError
age=230
try:
    assert age<30
    print("valid age")
except AssertionError:
    print("Raised with assert because")    
except:
    print("Not valid")

