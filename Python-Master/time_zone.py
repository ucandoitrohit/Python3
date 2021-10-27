from datetime import datetime
from datetime import datetime
import pytz

print(pytz.all_timezones)

tz_india = pytz.timezone("Asia/Calcutta")
dt_india = datetime.now(tz_india)
print(tz_india)
print(dt_india)


tstamp = datetime.now().timestamp()

print(tstamp)

dt_object = datetime.fromtimestamp(tstamp)

print(dt_object)
