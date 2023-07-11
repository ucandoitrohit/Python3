from selenium import webdriver
from PIL import Image

driver = webdriver.Chrome()
url = "https://www.geeksforgeeks.org/"
driver.get(url)
 
driver.save_screenshot("image.png")
 
# Loading the image
image = Image.open("image.png")
 
# Showing the image
image.show()