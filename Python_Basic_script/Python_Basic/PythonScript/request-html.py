#https://www.restapitutorial.com/httpstatuscodes.html
#https://pythonprogramming.altervista.org/make-html-tables-with-pandas/
#from urllib import response
import requests
import pandas as pd
import os
html = """<style>
@import "https://fonts.googleapis.com/css?family=Montserrat:300,400,700";
.rwd-table {
  margin: 1em 0;
  min-width: 300px;
}
.rwd-table tr {
  border-top: 1px solid #ddd;
  border-bottom: 1px solid #ddd;
}
.rwd-table th {
  display: none;
}
.rwd-table td {
  display: block;
}
.rwd-table td:first-child {
  padding-top: .5em;
}
.rwd-table td:last-child {
  padding-bottom: .5em;
}
.rwd-table td:before {
  content: attr(data-th) ": ";
  font-weight: bold;
  width: 6.5em;
  display: inline-block;
}
@media (min-width: 480px) {
  .rwd-table td:before {
    display: none;
  }
}
.rwd-table th, .rwd-table td {
  text-align: left;
}
@media (min-width: 480px) {
  .rwd-table th, .rwd-table td {
    display: table-cell;
    padding: .25em .5em;
  }
  .rwd-table th:first-child, .rwd-table td:first-child {
    padding-left: 0;
  }
  .rwd-table th:last-child, .rwd-table td:last-child {
    padding-right: 0;
  }
}


h1 {
  font-weight: normal;
  letter-spacing: -1px;
  color: #34495E;
}

.rwd-table {
  background: #34495E;
  color: #fff;
  border-radius: .4em;
  overflow: hidden;
}
.rwd-table tr {
  border-color: #46637f;
}
.rwd-table th, .rwd-table td {
  margin: .5em 1em;
}
@media (min-width: 480px) {
  .rwd-table th, .rwd-table td {
    padding: 1em !important;
  }
}
.rwd-table th, .rwd-table td:before {
  color: #dd5;
}
</style>
<script>
  window.console = window.console || function(t) {};
</script>
<script>
  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
</script>"""

df = pd.read_excel("E:\\PythonScript\\Excel\\website.xlsx")
for index, website in df.iterrows():
    try:
            response = requests.get(website["Name"])
            df.at[index, "status_code"] = "Site is OK {}".format(response.status_code)
    except:
            df.at[index, "status_code"] = "Site is not avaiable"
#print(df)

#weburl = "E:\\PythonScript\\Excel\\website2.html"

df.to_html("E:\\PythonScript\\Excel\\website2.html")

with open("E:\\PythonScript\\Excel\\website2.html") as file:
	file = file.read()
file = file.replace("<table ", "<table class='rwd-table'")
with open("E:\\PythonScript\\Excel\\website2.html", "w") as file_to_write:
	file_to_write.write(html + file)
os.startfile("E:\\PythonScript\\Excel\\website2.html")
