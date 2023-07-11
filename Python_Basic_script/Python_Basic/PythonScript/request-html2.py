#In this user will be asked to open an excel file to transform into html

import requests
import pandas as pd
import os
from tkinter import Tk
from tkinter.filedialog import askopenfilename

Tk().withdraw()
filename = askopenfilename()

table_class = "rwd-table"

html = """<style>
@import "https://fonts.googleapis.com/css?family=Montserrat:300,400,700";
.rwd-table {
  margin: 1em 0;
  min-width: 300px;
}
.rwd-table tr {border-top: 1px solid #ddd; border-bottom: 1px solid #ddd; } .rwd-table th {display: none; } .rwd-table td {display: block; } .rwd-table td:first-child {padding-top: .5em; } .rwd-table td:last-child {padding-bottom: .5em; } .rwd-table td:before {content: attr(data-th) ": "; font-weight: bold; width: 6.5em; display: inline-block; } @media (min-width: 480px) {.rwd-table td:before {display: none; } } .rwd-table th, .rwd-table td {text-align: left; } @media (min-width: 480px) {.rwd-table th, .rwd-table td {display: table-cell; padding: .25em .5em; } .rwd-table th:first-child, .rwd-table td:first-child {padding-left: 0; } .rwd-table th:last-child, .rwd-table td:last-child {padding-right: 0; } } h1 {font-weight: normal; letter-spacing: -1px; color: #34495E; } .rwd-table {background: #34495E; color: #fff; border-radius: .4em; overflow: hidden; } .rwd-table tr {border-color: #46637f; } .rwd-table th, .rwd-table td {margin: .5em 1em; } @media (min-width: 480px) {.rwd-table th, .rwd-table td {padding: 1em !important; } } .rwd-table th, .rwd-table td:before {color: #dd5; } </style>

<script>
  window.console = window.console || function(t) {};
</script>
<script>
  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
</script>"""

df = pd.read_excel(filename)
for index, website in df.iterrows():
    try:
            response = requests.get(website["Name"])
            df.at[index, "status_code"] = "Site is OK {}".format(response.status_code)
    except:
            df.at[index, "status_code"] = "Site is not avaiable"

weburl = "E:\\PythonScript\\Excel\\website3.html"


df.to_html(weburl)
with open(weburl) as file:
    file = file.read()
file = file.replace("<table ", "<table class=\"" + table_class + "\" ")
with open(weburl, "w") as file_to_write:
    file_to_write.write(html + file)
os.startfile(weburl)