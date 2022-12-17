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

print("==============Convert datetime object to YYYY/MM/DD HH/MM/SS (string)====================")
from datetime import datetime
curr = datetime.now()
format_dt = datetime.strftime(curr,"%Y/%m/%d %H/%M/%S")

print(curr)
print(format_dt)
print(type(format_dt))


print("==============Convert YYYY/MM/DD HH/MM/SS (string) to datetime object====================")
from datetime import datetime
curr = datetime.now()
format_dt = datetime.strftime(curr,"%Y/%m/%d %H/%M/%S")

print(curr)
print(format_dt)
print(type(format_dt))

cont = datetime.strptime(format_dt,"%Y/%m/%d %H/%M/%S")
print(cont)
print(type(cont))
