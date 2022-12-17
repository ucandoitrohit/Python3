import keyword
keys = ["for", "while", "ram", "break", "welcome","elif", "dance", "rohit", "lambda", "else", "sakshar","git","False", "elif", "lambda", 
"None", "else", "nonlocal", "True", "except", "not", "and", "finally", "or", "as", "for", "pass", "assert", "from", "raise", 
"break", "global", "return", "class", "if", "try", "continue", "import", "while", "def", "in", "with", "del" ,"is", "yield" ]

for i in range(len(keys)):
    if keyword.iskeyword(keys[i]):
        print(keys[i] + " is python keyword")
    else:
        print(keys[i] + " is not a python keyword")


print("=================================================")
print ("The list of keywords is : ")
print (keyword.kwlist)