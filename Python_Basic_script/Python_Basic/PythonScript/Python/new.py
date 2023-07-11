import pyautogui
pyautogui.alert('This is an alert box.')
pyautogui.confirm('Shall I proceed?')
#pyautogui.confirm('Enter option.', buttons=['A', 'B', 'C'])
#pyautogui.prompt('What is your name?')
#pyautogui.password('Enter password (text will be hidden)')
cname = pyautogui.prompt(text="",title="Enter")
print(cname)
pyautogui.hotkey('ctrl','t')

pyautogui.write("https://www.youtube.com")
#pyautogui.hotkey('enter')
pyautogui.write('Hello world!', interval=0.25)