class bikeShop:
    def __init__(self,stock):
        self.stock=stock

    def displayBike(self):
        print("Total Bikes",self.stock)

    def rentForBike(self,quantity1):
        if quantity1<=0:
            print("Enter the +ve value or greater than 0-")
        elif quantity1>self.stock:
            print("Enter the value (less than stock-")
        else:
            self.stock=self.stock-quantity1
            print("Total Price--", quantity1*100)    
            print("Total Bike--",self.stock)

while True:
    obj=bikeShop(100)
    uchoice=int(input('''
    1. Display Stock
    2. Rent a Bike
    3. Exit
    '''))

    if uchoice==1:
        obj.displayBike()
    elif uchoice==2:
        n=int(input("Enter the quantity-"))
        obj.rentForBike(n)
    else:
        break    


    
