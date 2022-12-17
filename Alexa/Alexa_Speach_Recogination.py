import pyttsx3
import speech_recognition as sr
import datetime
import wikipedia
import webbrowser
import apiclient
import os
import sys
from googlesearch import search
from googlesearch import search_images
from googleapiclient.discovery import build
from google_images_download import google_images_download 


engine = pyttsx3.init('sapi5')
voices = engine.getProperty('voices')
#print(voices)
#print(voices[0].id)        voice for male
#print(voices[1].id)        voice for female

#engine.setProperty('voice', voices[0].id)
engine.setProperty('voice', voices[1].id)

#def speak(audio):
#   pass

def speak(audio):
    engine.say(audio)
    engine.runAndWait()

def wishMe():
    hour = int(datetime.datetime.now().hour)
    if hour >=0 and hour<12:
        speak("Good Morning Rohit !")

    elif hour >=12 and hour<18:
        speak("Good Afternoon Rohit !")

    else:
        speak("Good Evening Rohit!")

    speak("I am Alexa ! How may Help you !")

def takeCommand():

    r = sr.Recognizer()
    with sr.Microphone() as source:
        print("Please say something ! I am Listening to you.......")
        speak("Please say something ! I am Listening to you.......")

        print(" ")

        r.pause_threshold = 1
        audio = r.listen(source)

    try:
        print("Recognizing your voice....... Please Wait......!")
        #speak("Recognizing your voice....... Please Wait......!")

        query = r.recognize_google(audio, language='en-in')
        print(" ")
        print(f"You Said:{query}\n")
        print(" ")

    except Exception as e:
        print(" ")
        print("Please say Again.... ! I did't Get you ? ")
        #speak("Please say Again....  ")
        
        
        return "None"
    return query





if __name__ == "__main__":
    speak("Welcome to Alexa World !")

    wishMe()
    while True:
#if 1:
        query = takeCommand().lower()
        keyword = query.replace("","+")
        response = google_images_download.googleimagesdownload() 


        if 'wikipedia' in query:
            speak('Searching in Wikipedia.....')
            query = query.replace("wikipedia","")
            
            results = wikipedia.summary(query,sentences=2)
            speak("I Found your query in wikipedia")
            print(results)
            speak(results)
        
      

        elif 'open youtube' in query:
            webbrowser.open("https://youtube.com")

        elif 'open google' in query:
            webbrowser.open("https://google.co.in")
        
        elif 'new tab' in query:
            webbrowser.open_new_tab("https://google.co.in")

        elif 'open facebook' in query:
            webbrowser.open("https://facebook.com")

        elif 'open whatsapp' in query:
            webbrowser.open("https://web.whatsapp.com")

        elif 'open outlook' in query:
            webbrowser.open("https://outlook.office.com/owa/")

        elif 'open my wipro' in query:
            webbrowser.open("https://mywipro.wipro.com/#/Home")

        elif 'play music' in query:
            music_dir = 'D:\\Music'
            songs = os.listdir(music_dir)
            print(songs)
            os.startfile(os.path.join(music_dir, songs[0]))

        elif 'time' in query:
            strTime = datetime.datetime.now().strftime("%H:%M:%S")
            speak(f"The Time is {strTime}")
            


        elif 'open detail' in query:
            path = "D:\\NIC-Work\\MM.xlsx"
            os.startfile(path)

        elif 'open excel' in query:
            path = "C:\\ProgramData\\Microsoft\\Windows\\Start Menu\\Programs\\Microsoft Office 2013\\Excel 2013"
            os.startfile(path)

        elif 'mailbox' in query:
            path = "D:\\NIC-Work\\Mailboxs.xlsx"
            os.startfile(path)

        elif 'close mailbox' in query:
            #path = "C:\\ProgramData\\Microsoft\\Windows\\Start Menu\\Programs\\Microsoft Office 2013\\Excel 2013"
            path = "D:\\NIC-Work\\Mailboxs.xlsx"
            #os.close('TASKKILL /IM excel.exe /F')
            os.close( path)

        elif 'open word' in query:
            path = "C:\\ProgramData\\Microsoft\\Windows\\Start Menu\\Programs\\Microsoft Office 2013\\Word 2013"
            os.startfile(path)
        
        elif 'how are you' in query:
            msgs = ['I am Fine ! How you are !']
            speak(msgs)

        elif 'hello' in query:
            msgs = ['Hello! I am Fine ! How are you !']
            speak(msgs)

        elif 'hi alexa' in query:
            msgs = ['Hi Rohit ! How are you !']
            speak(msgs)

        elif 'i am fine' in query:
            msgs = ['Nice to Meet you Rohit ! !']
            speak(msgs)



        elif  'facebook' in query:
            for j in search(query, tld="co.in", num=10, stop=1, pause=2):
             print("Your Url:" + j)
             speak("Your Url:" + j)



        elif 'close' in query or 'exit' in query or 'bye' in query:
            speak("Good Bye ! Have a Nice day")
            sys.exit()



