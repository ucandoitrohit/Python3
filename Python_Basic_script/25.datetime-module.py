import datetime
import pytz

print(datetime.datetime.now())
print("============================")
print(datetime.datetime.today())
print("============================")

PST=pytz.timezone('America/New_York')
print(datetime.datetime.now(PST))

# now() - funcition can provide you timezone for other country
# today() - only provide a local timezone which configured on server

#print(datetime.datetime.today(PST)) -- error

print(type(PST))

#format
print(datetime.datetime.now().year)
print(datetime.datetime.now().month)
print(datetime.datetime.now().day)

# strftie.org -- example and format

print(datetime.datetime.now().strftime("%y-%m-%d"))
print(datetime.datetime.now().strftime("%Y-%m-%d"))
print(datetime.datetime.now().strftime("%c"))
print("============================")

print(datetime.datetime.now().fromtimestamp(1234567894))




