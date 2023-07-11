import pandas as pd
data1 = pd.read_csv("E:\\PythonScript\\Excel\\Ser.csv")
print(data1)
#print(data1.shape)
#print(data1.columns)
#print(data1.dtypes)

#data1 = pd.read_csv("E:\\PythonScript\\Excel\\Ser.csv",sep=',')
#data1 = pd.read_csv("E:\\PythonScript\\Excel\\Ser.csv",header=1)
#data2 = pd.read_csv("E:\\PythonScript\\Excel\\Ser.csv",usecols=['Product','Country'])
#print(data2)
#or

data3 = pd.read_csv("E:\\PythonScript\\Excel\\Ser.csv",dtype="str")
#print(data3.dtypes)

data4 = pd.read_csv("E:\\PythonScript\\Excel\\Ser.csv")
#print(data4.head(2))
#print(data4.tail(2))
data15= pd.read_csv("E:\\PythonScript\\Excel\\Ser.csv")

print(data15['Value'].isnull())

na_val = ['-1','n-a']
data16= pd.read_csv("E:\\PythonScript\\Excel\\Ser.csv", na_values= na_val)

print(data16['Value'].isnull())
print(data16[data16['Value'].isnull()])
print(data16['Value'].isnull().sum())
print(data16.isnull().sum())

#replace the null value with different value
print(data16.isnull().sum())
print(data16['Value'].fillna('Other',inplace=True))
print(data16.isnull().sum())
data16.to_csv("E:\\PythonScript\\Excel\\Ser2.csv", index=False)

data2 = pd.read_csv("E:\\PythonScript\\Excel\\Ser.csv")
print(data2.filter(['Country']))
print(data2[data2['Country'] == 'UK'])

print(data2[(data2['Country']== 'UK') | (data2['Country'] == 'Peru')])