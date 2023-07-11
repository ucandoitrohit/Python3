words = ["donkey", "kudda","mote"]

with open("Sample1.txt", 'r') as f:
    content = f.read()


for word in words:
    content = content.replace(word, "#######")
with open("Sample1.txt", "w") as f:
    f.write(content)    