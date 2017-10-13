#################### IMPORT NIKE EXCEL FILE TO NIKE_PO_ORDERS(MSSQL SERVER) ########################
__author__ ='Prabal Soni'
import xlrd
import pyodbc
import datetime

# Read Excel
book = xlrd.open_workbook("E:\sql_data.xlsx")
sheet = book.sheet_by_name("Sheet1")


# Connect to SQL Server
connection = pyodbc.connect('DRIVER={SQL Server};SERVER=localhost;DATABASE=AMI;UID=root;PWD=redhat')
cursor = connection.cursor()

query = """INSERT INTO AMI.DBO.NIKE_PO_ORDERS(Booking_number,Vendor,Expected_cargo_receipt_date,Expected_cargo_receipt_week,pod_city,pod_province,pod_country,Product_type_code,Product_type,Order_type,AA_flag,PO_number,PO_line,SKU_number,Booked_quantity,booked_cartons,booked_weight,booked_cbm,Shipto,Demand_key) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"""


# Mapping Nike_PO_Orders with PO_Orders

for r in range(1, sheet.nrows):
    Booking_number = sheet.cell(r, 0).value
    Vendor = sheet.cell(r, 1).value
    ECR_Date = sheet.cell(r, 2).value
    Expected_cargo_receipt_date = datetime.datetime(*xlrd.xldate_as_tuple(ECR_Date, book.datemode))
    Expected_cargo_receipt_week = sheet.cell(r, 3).value
    pod_city = sheet.cell(r, 4).value
    pod_province = sheet.cell(r, 5).value
    pod_country = sheet.cell(r, 6).value
    Product_type_code = sheet.cell(r, 7).value
    Product_type = sheet.cell(r, 8).value
    Order_type = sheet.cell(r, 9).value
    AA_flag = sheet.cell(r, 10).value
    PO_number = str(sheet.cell(r, 11).value)
    PO_line = sheet.cell(r, 12).value
    SKU_number = str(sheet.cell(r, 13).value)
    Booked_quantity = sheet.cell(r, 14).value
    booked_cartons = sheet.cell(r, 15).value
    booked_weight = sheet.cell(r, 16).value
    booked_cbm = sheet.cell(r, 17).value
    Shipto = str(sheet.cell(r, 18).value)
    Demand_key = str(sheet.cell(r, 19).value)

    # Assign values from each row
    values = (Booking_number, Vendor, Expected_cargo_receipt_date, Expected_cargo_receipt_week, pod_city, pod_province,
              pod_country, Product_type_code, Product_type, Order_type, AA_flag, PO_number, PO_line, SKU_number,
              Booked_quantity, booked_cartons, booked_weight, booked_cbm, Shipto, Demand_key)
    # Execute sql Query
    cursor.execute(query, values)
# Close the cursor
cursor.close()

# Commit the transaction
connection.commit()

# Close the database connection
connection.close()
