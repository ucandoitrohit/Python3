from googlesearch import search
# to search 
query = "facebook"
  
for j in search(query, tld="co.in", num=10, stop=2, pause=2): 
    print(j)