
with open("Sample1.txt", 'r') as f:
    content = f.read()

content = content.replace("donkey", "#######")
with open("Sample1.txt", "w") as f:
    f.write(content)    