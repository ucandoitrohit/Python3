def func1(first, second, age):
    print(f"Name {first}")
    print(f"Last {second}")
    print(f"age {age}")

func1("Rohit","Sharma","44")


def func1(first, second, age = 4):
    print(f"Name {first}")
    print(f"Last {second}")
    print(f"age {age}")

func1("Rohit","Sharma","34")

def func1(first, second, age = None):
    print(f"Name {first}")
    print(f"Last {second}")
    print(f"age {age}")

func1("Rohit","Sharma")
