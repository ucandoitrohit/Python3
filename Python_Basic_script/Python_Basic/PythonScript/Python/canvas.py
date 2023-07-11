from reportlab.pdfgen import canvas

def h():
    c = canvas.Canvas("h.pdf")
    c.drawString(100,100,"Hello Rohit")
    c.showPage()
    c.save()

h()


