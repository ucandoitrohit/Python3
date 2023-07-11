
import pyscreenshot
import datetime

from win10toast import ToastNotifier

noti = ToastNotifier()

img = pyscreenshot.grab()

dt = datetime.datetime.now().strftime("%d_%b_%Y_%H_%M_%S_%f.png")
img.save("test-"+ dt)

print("test-"+dt)
noti.show_toast(title="Screenshot Taken", msg="Screen", duration=5)