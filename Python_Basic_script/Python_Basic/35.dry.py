winning = 43
guess =1
num = int(input("Gues your num 1 to 100 "))
game_over = False

while not game_over:
    if num == winning:
        print(f"you win, in number in {guess} time")
        game_over = True
    else:
        if num < winning:
            print("too low")
        else:
            print("too high")
            
        guess = guess + 1
        num = int(input("guess again"))
            
