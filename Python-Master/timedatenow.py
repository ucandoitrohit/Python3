from datetime import date, datetime, timedelta
current = datetime.now()
dt = current.date()
ti = current.time()
print(current)
print(dt)
print(ti)
print("=============Time Difference adding=========================")
timediff = timedelta(
        days=2,
        hours=30,
        minutes=10
)

nowdate = current+timediff
print(nowdate)
print(nowdate.date())

print("=============Only Date import=========================")

from datetime import date
nowd = date(
    year=2019,
    month=9,
    day=2
)

print(nowd)

print("=============Only Time import=========================")

from datetime import time
nowt = time(
    hour=9,
    minute=20
)

print(nowt)