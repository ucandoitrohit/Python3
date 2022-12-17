from datetime import time

# time(hour = 0, minute = 0, second = 0)
a = time()
print("a =", a)

# time(hour, minute and second)
b = time(6, 34, 56)
print("b =", b)

# time(hour, minute and second)
c = time(hour = 6, minute = 34, second = 56)
print("c =", c)

# time(hour, minute, second, microsecond)
d = time(6, 34, 56, 234566)
print("d =", d)