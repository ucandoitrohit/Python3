import keyword
keys = ["for", "while", "ram", "break", "welcome","elif", "dance", "rohit", "lambda", "else", "sakshar","git"]
 
for i in range(len(keys)):
    if keyword.iskeyword(keys[i]):
        print(keys[i] + " is python keyword")
    else:
        print(keys[i] + " is not a python keyword")