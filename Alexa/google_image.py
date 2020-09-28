import pyttsx3
import speech_recognition as sr
engine = pyttsx3.init('sapi5')
voices = engine.getProperty('voices')
engine.setProperty('voice', voices[1].id)


def speak(audio):
    engine.say(audio)
    engine.runAndWait()


from google_images_download import google_images_download 
response = google_images_download.googleimagesdownload() 

search_queries =[ 'computer'] 
def downloadimages(query): 
	arguments = {"keywords": query, 
				"format": "jpg", 
				"limit":2, 
				"print_urls":True, 
				"size": "medium"
                } 
	try: 
		response.download(arguments) 
	except FileNotFoundError: 
		arguments = {"keywords": query, 
					"format": "jpg", 
					"limit":2, 
					"print_urls":True, 
					"size": "medium"} 
					
		try: 
			response.download(arguments) 
		except: 
			pass

for query in search_queries: 
	downloadimages(query) 
	print() 


speak("You quuery has been downloaded" + query)

