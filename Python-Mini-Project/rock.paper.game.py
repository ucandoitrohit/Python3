from itertools import count
import random
l = ["rock","paper","scissor"]


while True:
    ccount = 0
    ucount = 0
    uc = int(input('''
        Game Start.....!
        1 Yes
        2 NO | Exit
        '''))

    if uc==1:
           for a in range(1,3):
                userInput = int(input('''
                        1. Rock
                        2. Scissor
                        3. Paper
                        '''))
                if userInput==1:
                    uChoice = "rock"
                elif userInput==2:
                    uChoice ="scissor"
                elif userInput==3:
                    uChoice ="paper"
                cchoice=random.choice(l)
                if cchoice==uChoice:
                    print("Game Draw....")
                    print("Computer Value:-",cchoice)
                    print("User Value:-", uChoice)
                    ucount=ucount+1
                    ccount=ccount+1
                elif (uChoice=="rock" and cchoice=="scissor" ) or (uChoice=="paper" and cchoice=="rock") or (uChoice == "scissor" and cchoice == "paper"):
                    print("You Win....")
                    print("Computer Value:-",cchoice)
                    print("User Value:-", uChoice)
                    ucount=ucount+1
                else:
                    print("Computer Win....")
                    print("Computer Value:-",cchoice)
                    print("User Value:-", uChoice)
                    ccount=ccount+1                        


    else:
        break