--PO_Orders
CREATE TABLE [dbo].[PO_Orders](
	[PO_Line_Reference1] [varchar](255) NULL,
	[PO_Line_Reference2] [varchar](255) NULL,
	[PO_Line_Reference3] [varchar](255) NULL,
	[PO_Line_Reference4] [varchar](255) NULL,
	[PO_Line_Reference5] [varchar](255) NULL,
	[PO_Line_Reference6] [varchar](255) NULL,
	[PO_Line_Reference7] [varchar](255) NULL,
	[PO_Line_Reference8] [varchar](255) NULL,
	[PO_Line_Reference9] [varchar](255) NULL,
	[PO_Line_Reference10] [varchar](255) NULL,
	[PO_Line_Reference11] [varchar](255) NULL,
	[PO_Line_Reference12] [varchar](255) NULL,
	[PO_Line_Reference13] [varchar](255) NULL,
	[PO_Line_Reference14] [varchar](255) NULL,
	[PO_Line_Reference15] [varchar](255) NULL,
	[PO_Line_Reference16] [varchar](255) NULL,
	[PO_Line_Reference17] [varchar](255) NULL,
	[PO_Line_Reference18] [varchar](255) NULL,
	[PO_Line_Reference19] [varchar](255) NULL,
	[PO_Line_Reference20] [varchar](255) NULL,
	[Actual_Receipt_Date] [datetime] NULL,
	[Booked_Cartons] [numeric](18, 0) NULL,
	[Booked_CBM] [float] NULL,
	[Booked_Quantity] [numeric](18, 0) NULL,
	[Booked_Weight] [float] NULL,
	[Consignee] [varchar](255) NULL,
	[Expected_Cargo_Receipt_Date] [datetime] NULL,
	[Expected_Cargo_Receipt_Week] [numeric](18, 0) NULL,
	[Expected_Delivery_Date] [datetime] NULL,
	[Latest_Delivery_Date] [datetime] NULL,
	[Latest_Cargo_Receipt_Date] [datetime] NULL,
	[Order_Type] [varchar](255) NULL,
	[POD_Country] [varchar](255) NULL,
	[POD_Province] [varchar](255) NULL,
	[POD_City] [varchar](255) NULL,
	[POR_Country] [varchar](255) NULL,
	[POR_Province] [varchar](255) NULL,
	[POR_City] [varchar](255) NULL,
	[Plant] [varchar](255) NULL,
	[PO_Number] [varchar](255) NULL,
	[PO_Line] [varchar](255) NULL,
	[Product_Type_Code] [varchar](255) NULL,
	[Product_Type] [varchar](255) NULL,
	[PSLV] [varchar](255) NULL,
	[Received_Catons] [numeric](18, 0) NULL,
	[Received_CBM] [float] NULL,
	[Received_Quantity] [numeric](18, 0) NULL,
	[Received_Weight] [float] NULL,
	[Shipto] [varchar](255) NULL,
	[Shipper] [varchar](255) NULL,
	[SKU_Number] [varchar](255) NULL,
	[Vendor] [varchar](255) NULL,
	[SO_Reference1] [varchar](255) NULL,
	[SO_Reference2] [varchar](255) NULL,
	[SO_Reference3] [varchar](255) NULL,
	[SO_Reference4] [varchar](255) NULL,
	[SO_Reference5] [varchar](255) NULL,
	[SO_Reference6] [varchar](255) NULL,
	[SO_Reference7] [varchar](255) NULL,
	[SO_Reference8] [varchar](255) NULL,
	[SO_Reference9] [varchar](255) NULL,
	[SO_Reference10] [varchar](255) NULL,
	[SO_Reference11] [varchar](255) NULL,
	[SO_Reference12] [varchar](255) NULL,
	[SO_Reference13] [varchar](255) NULL,
	[SO_Reference14] [varchar](255) NULL,
	[SO_Reference15] [varchar](255) NULL,
	[SO_Reference16] [varchar](255) NULL,
	[SO_Reference17] [varchar](255) NULL,
	[SO_Reference18] [varchar](255) NULL,
	[SO_Reference19] [varchar](255) NULL,
	[SO_Reference20] [varchar](255) NULL,
	[Booking_Number] [varchar](255) NULL,
	[Carrier] [varchar](255) NULL,
	[Destination_Shipment_Type] [varchar](255) NULL,
	[Discharge_Port_City] [varchar](255) NULL,
	[Discharge_Port_Country] [varchar](255) NULL,
	[Discharge_Port_Province] [varchar](255) NULL,
	[ETA] [datetime] NULL,
	[ETD] [datetime] NULL,
	[Load_Plan_City] [varchar](255) NULL,
	[Load_Plan_Country] [varchar](255) NULL,
	[Load_Plan_Province] [varchar](255) NULL,
	[Origin_Shipment_Type] [varchar](255) NULL,
	[Shipment_Status] [varchar](255) NULL
) ON [PRIMARY]
GO

--Nike_PO_Orders
CREATE TABLE [dbo].[Nike_PO_Orders](
	[Booking_Number] [varchar](255) NULL,
	[Vendor] [varchar](255) NULL,
	[Expected_Cargo_Receipt_Date] [datetime] NULL,
	[Expected_Cargo_Receipt_Week] [numeric](18, 0) NULL,
	[POD_City] [varchar](255) NULL,
	[POD_Province] [varchar](255) NULL,
	[POD_Country] [varchar](255) NULL,
	[Product_Type_Code] [varchar](255) NULL,
	[Product_Type] [varchar](255) NULL,
	[Order_Type] [varchar](255) NULL,
	[AA_Flag] [varchar](255) NULL,
	[PO_Number] [varchar](255) NULL,
	[PO_Line] [varchar](255) NULL,
	[SKU_Number] [varchar](255) NULL,
	[Booked_Quantity] [numeric](18, 0) NULL,
	[Booked_Cartons] [numeric](18, 0) NULL,
	[Booked_Weight] [float] NULL,
	[Booked_CBM] [float] NULL,
	[Shipto] [varchar](255) NULL,
	[Demand_Key] [varchar](255) NULL
) ON [PRIMARY]
GO


--Data_Catalog
CREATE TABLE [dbo].[Data_Catalog](
	[Sno] [numeric](18, 0) NOT NULL,
	[Column_name] [varchar](255) NOT NULL,
	[Level] [varchar](255) NULL,
	[Data_type] [varchar](255) NOT NULL
) ON [PRIMARY]
GO

--Rule
CREATE TABLE [dbo].[Rule](
	[RULE_ID] [numeric](18, 0) NOT NULL,
	[CREATED] [datetime] NOT NULL,
	[RULE_NAME] [varchar](255) NULL,
) ON [PRIMARY]
GO

--Matching_Criteria
CREATE TABLE [dbo].[Matching_Criteria](
	[CRITERIA_ID] [numeric](18, 0) NOT NULL,
	[CRITERIA_NAME] [varchar](255) NOT NULL,
	[CRITERIA_VALUE] [varchar](255) NULL,
	[RULE_ID] [numeric](18, 0) NOT NULL
) ON [PRIMARY]
GO

--Action
CREATE TABLE [dbo].[Action](
	[ACTION_ID] [numeric](18, 0) NOT NULL,
	[ACTION_NAME] [datetime] NULL,
	[RULE_ID] [numeric](18, 0)NOT NULL,
) ON [PRIMARY]
GO

--Rule_Condition
CREATE TABLE [dbo].[Rule_Condition](
	[CONDITION_ID] [numeric](18, 0) NOT NULL,
	[CONDITION_NAME] [varchar](255) NULL,
	[RULE_ID] [numeric](18, 0)NOT NULL,
) ON [PRIMARY]
GO