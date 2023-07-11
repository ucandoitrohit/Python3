myDict = {
    "Name": "rohit",
    "Age":  "50",
    "Marks": [1,2,3,4],
    "anotherD": {
            "Biology": "Name",
            "Marks": "30",
            1:2   
             }
}

print(myDict.keys())
print(myDict.items())
print(myDict.values())

print(myDict)
upD={
    "Add": "Rohi",
    "Roll": "33"
}

myDict.update(upD)
print(myDict)

print(myDict.get("Roll"))