import csv
# creating CSV file
csv_file="E:\\python_repo\\Python3\\Python_Basic_script\\new_emp.csv"
fo=open(csv_file,'w',newline="")
csv_writer=csv.writer(fo,delimiter=",")
csv_writer.writerow(['Sno,Name,Last'])
csv_writer.writerow([1,"Rohit","Sharma"])
fo.close()