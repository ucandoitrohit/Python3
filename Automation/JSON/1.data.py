import json

employee_data='''
{
    "people":[
        {
            "name":"rohit",
            "age":"23",
            "email":["rohit@gmail.com","rohitnew@yahoo.com"],
            "married":false
        }
    ]
}
'''
print(employee_data)
data=json.loads(employee_data)

print(data)