__author__ = 'Prabal Soni'
import re
import pyodbc
import datetime

i = 2
cnt = 1
list = []
data_hash = {}

#ODBC connection to SQL Server
connection = pyodbc.connect('DRIVER={SQL Server};SERVER=localhost;DATABASE=AMI;UID=root;PWD=redhat')
cursor = connection.cursor()
cursor2 = connection.cursor()

#Replace Method
def replacenth(string, sub, wanted, n):
    where = [m.start() for m in re.finditer(sub, string)][n - 1]
    before = string[:where]
    after = string[where:]
    after = after.replace(sub, wanted, 1)
    newString = before + after
    return newString



# Read data_catalog table
def get_datacatalog():
    cursor2.execute("""select lower(column_name) as column_name,data_type from ami.dbo.data_catalog""")
    data_catalog = cursor2.fetchall()
    for col in data_catalog:
        data_hash[col[0]] = col[1]

get_datacatalog()
print(data_hash)



def validator(key,value):
    if(data_hash[key] == 'numeric' or data_hash[key] ==  'float'):
        return (value)
    else:
        return ('\'%s\'' % value)


# Execute sql Query
cursor.execute("""select lower(column_name) as column_name,value from ami.dbo.matching_criteria a, (select max(ruleid) as max_ruleid
from ami.dbo.matching_criteria)b where ruleid = max_ruleid""")
result_set = cursor.fetchall()


# Read the matching conditions
for row in result_set:
    if (cnt == 1):
        mylist = [row[0], validator(row[0],row[1])]
        cnt = cnt + 1
    else:
        list = [row[0], validator(row[0],row[1])]
    mylist.extend(list)
print("hi")
final_list = '='.join(mylist)
print("bye")
# Preparing the select statement to get PO orders
while i < final_list.count('='):
    final_list = replacenth(final_list, '=', ' and ', i)
    i = i + 1
try:
    query = ('select * from ami.dbo.po_orders where %s ' % final_list)
    cursor.execute(query)
    row_set = cursor.fetchall()
    for row in row_set:
        print(row)
except Exception as e:
    print(e)
    print("DataType miss-match: Please provide correct datatypes....")

#print(query)



# Close the cursor
cursor.close()

# Commit the transaction
connection.commit()

# Close the database connection
connection.close()