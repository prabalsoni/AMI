#### WORK FLOW ####
STEP 1:
Create tables into SQL Server using 'Table_schema.sql' file.

STEP 2:
Insert data into :
	Nike_po_order using ExcelToNike_PO_Orders.py script
	Data_Catalog using 'Data_catalog_insert_statement.txt'
	PO_Orders using Map_to_generic_PO.sql script

STEP 3:
Manually create matching criteria into Matching_Criteria table.

STEP 4:
Run Matching_criteria_execution.py script
to get the matching POs from the PO_Orders table.

#### DATABASE DETAILS ####

--DATABASE
SQL SERVER 2017

--DATABASE NAME
AMI

#### TABLES UNDER AMI DATA MODEL ####

--GENERIC PURCHASE ORDER TABLE
PO_Orders

--NIKE PURCHASE ORDER TABLE
Nike_PO_Orders

--DATA CATALOG TABLE
Data_Catalog

--MATCHING CRITERIA TABLE
Matching_Criteria

--RULE TABLE
Rule

--Action Conditions Table
Action

--Rule Conditions Table
Condition