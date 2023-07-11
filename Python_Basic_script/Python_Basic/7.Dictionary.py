dict ={}
print(type(dict))

dict2= {"Rohit": "Smart",
        "Test": "Math",
        "Pic":"Kabir",
        "Shubham":{"Class":"8","Hobby":"Cricket","Test":"MAth"}}
print(dict2)
print(dict2["Rohit"])
print(dict2["Pic"])
print(dict2["Shubham"])
print(dict2["Shubham"]["Class"])
dict2["Address"] = "New delhi"
print(dict2)
dict2[120] = "new"
print(dict2)
del dict2[120]
dict2.update({"best":"movies"})
print(dict2)

print(dict2.keys())
print(dict2.items())

