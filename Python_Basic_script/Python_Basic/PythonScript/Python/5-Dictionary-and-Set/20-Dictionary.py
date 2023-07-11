myDict = {
    "Name": "rohit",
    "Age":  "50",
    "Marks": [1,2,3,4],
    "anotherD": {
            "Biology": "Name",
            "Marks": "30"   
             }
}

print(myDict['Name'])
print(myDict["Age"])
print(myDict["Marks"])
print(myDict["anotherD"])
print(myDict['anotherD']['Marks'])
