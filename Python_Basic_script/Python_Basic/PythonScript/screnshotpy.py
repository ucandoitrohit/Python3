import pyscreenshot
import datetime



img =  pyscreenshot.grab()

dt = datetime.datetime.now().strftime("%d_%b_%Y_%H_%M_%S_%f.png")
img.save("test-"+ dt)

print("test-"+dt)
