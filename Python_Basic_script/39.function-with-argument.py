def sum(value):   # parameter/positional argument
    result=value+10
    print(f"Sum add with 10+{value}= ",result)
    return None

def main():
    num=eval(input("Enter the Number-"))
    sum(num)  # Argument
    return None

main()