def display(**karg):
    print(f"{karg}")

display(a=3,b=5,v=6,c=7)


def display(p,**karg):
    print(f"p={p}")
    print(f"{karg}")
    return None

display(32,a=3,b=5,v=6,c=7)

