from selenium import webdriver

path = 'C://chromedriver.exe'

br = webdriver.Chrome(executable_path=path)
br.get("http://www.google.com")
br.save_screenshot('scrr.png')