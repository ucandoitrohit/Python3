def game():
    return 675

score = game()
with open("Sample.txt", "r") as f:
    ReadValue = f.read()
if ReadValue == '':
    with open("Sample.txt","w") as f:
        f.write(str(score))
elif int(ReadValue)<score:
    with open("Sample.txt", "w") as f:
        f.write(str(score))
