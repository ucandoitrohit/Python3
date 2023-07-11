import re

#regular expression
# is a procedure  in any language  to look for a specifined pttern in a given text
# it is a sequance of character which represent multiple string
# Ex - i[st] -> is, it
# python[23] -> python2 , python3
# different operation are-
# match(), search(), findall(), finditer(), sub(), split(), complie()
# syntax- re.match(pattern,text)

# a,x,9 - ordinary character that match themselves
# [abc] - matches a or b or c
# [a-c] - matches a or b or c
# [a-zA-Z0-9] - match any letter from a-z, A-Z , 0-9
# \w    - match any single letter, digit or underscore
# \W    - match any character not part of \w
# \d    - match decimal digit 0-9


str="Python is simple and it easy"
print(re.split("i[st]",str))

pattern1="\w"
pattern2="\w\w"
pattern3="\w\w\w"
pattern4="\w\w\w\w"
pattern5="\w\w\w\w\w"
pattern6="\w\w\w\w\w\w"

print(re.findall(pattern1,str))
print(re.findall(pattern2,str))
print(re.findall(pattern3,str))
print(re.findall(pattern4,str))
print(re.findall(pattern5,str))
print(re.findall(pattern6,str))

str7="this is my db server : 255.123.54.67"
pattern7="\d\d\d.\d\d\d.\d\d.\d\d"
print(re.findall(pattern7,str7))


str8="this is my db server : 255.123.54.67 7848274827482742"
pattern8="\d\d\d.\d\d\d.\d\d.\d\d"
print(re.findall(pattern8,str8))

str9="this is my db server : 255.123.54.67 7848274827482742"
pattern9="\d\d\d\.\d\d\d\.\d\d\.\d\d"
print(re.findall(pattern9,str9))
