import subprocess
import datetime
from reportlab.pdfgen import canvas
from reportlab.lib.units import inch

def disk():
    p = subprocess.Popen("df -h", shell=True,stdout = subprocess.PIPE)
    return p.stdout.readlines()
    
def cpdf(input,output="disk.pdf"):
    now = datetime.datetime.today()
    date = now.strftime("%h %d %Y %H:%M:%S")
    c = canvas.Canvas(output)
    textobject = c.beginText()
    textobject.setTextOrigin(inch, 11*inch)
    textobject.textLine('''  
    Disk Capacity Report: %s
    '''  % date)
    for line in input:
        textobject.textLine(line.strip())
    c.drawText(textobject)
    c.showPage()
    c.save()


dd = disk()
cpdf(dd)