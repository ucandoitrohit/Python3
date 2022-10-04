#https://www.restapitutorial.com/httpstatuscodes.html
#from urllib import response
import requests
import pandas as pd
data = pd.read_excel("E:\\PythonScript\\Excel\\website.xlsx")
for index, website in data.iterrows():
    #print(index, website["Name"])
    try:
            response = requests.get(website["Name"])
            #print(response.status_code)
            data.at[index, "status_code"] = "Site is OK {}".format(response.status_code)
    except:
            data.at[index, "status_code"] = "Site is not avaiable"
            #print("Website {} are not avaiable".format(website["Name"]))
print(data)
#data.to_html("E:\\PythonScript\\Excel\\website.html")
#data.to_html("E:\\PythonScript\\Excel\\website.html",index=False)
#data.to_html("E:\\PythonScript\\Excel\\website.html",index=False,col_space=50)
data.to_html("E:\\PythonScript\\Excel\\website.html",index=False,justify='right')
#
# print(data)
# response = requests.get("http://localhost/test.py")
#print(response.status_code)

