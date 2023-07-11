content = True
i = 1
with open("Sample1.txt",'r') as f:
    while content:
        content = f.readline()
        if 'python' in content.lower():
            print(content)
            print("Found")       
            print(i)
        i+=1    
