email = input("Enter your Email ID:-")
k,j,d =0,0,0
if len(email) >=6:
    if email[0].isalpha(): # check first character of email id should letter
        if ("@" in email) and (email.count("@") == 1):
            if (email[-4] ==".") ^ (email[-3]== "."):
                for i in email:
                    if i == i.isspace():
                        k = 1
                    elif i.isalpha():
                        if i == i.upper():
                            j = 1
                    elif i.isdigit():
                        continue
                    elif i == "_" or i == "." or i == "@":
                        continue
                    else:
                        d = 1
                if k == 1 or j == 1 or d == 1:
                    print("Wrong email id seem found special character")
                else:
                    print("Email ID is correct-",email)
            else:
                print("CHeck root domain is wrong")

        else:
            print("@ is more than once")

    else:
        print("First Word of email id should be Characher")
    
else:
    print("Length of email id should be more than 6 word..!")


#OutPut:
#$ python email-validation.py 
#Enter your Email ID:-rohit
#Length of email id should be more than 6 word..!

#Enter your Email ID:-2rohit@gmail.com
#First Word of email id should be Characher

#Enter your Email ID:-rohit@vish@gmail.com
#@ is more than once

#Enter your Email ID:-rohitone@gmail.ccomm
#CHeck root domain is wrong


