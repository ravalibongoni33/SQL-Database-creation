/* Create TABLE TECHNOLOGY*/

CREATE TABLE TECHNOLOGY (
TechID        Int              NOT NULL,
Name   		  Char (25)        NOT NULL,
Description   Char (100)       NULL,
Type   		  Char (25)        NULL,
Purpose		  Char (100)        NULL,
CONSTRAINT TechnologyPK      PRIMARY KEY (TechID),
);
/*Insert records into table TECHNOLOGY */

INSERT INTO TECHNOLOGY (TechID, Name, Description, Type, Purpose)
 
VALUES (1, 'BlockChain Technology','Security','Software','resistant to modification of the data'); 

INSERT INTO TECHNOLOGY (TechID, Name, Description, Type, Purpose)
VALUES (2, 'Smart ATMs', 'Able to conduct contactless ATM transactions using a smartphone','Hardware','Transaction');

INSERT INTO TECHNOLOGY (TechID, Name, Description, Type, Purpose)
 
VALUES (3, 'Wearables', 'Used for software', 'Software', 'Tracking');

INSERT INTO TECHNOLOGY (TechID, Name, Description, Type, Purpose)
 
VALUES (4, 'Partnerships', 'used for banking system', 'Software', 'Marketing');

/* Create Table VENDOR*/

CREATE TABLE VENDOR (
VendorID   	 Int             NOT NULL,
Name  		 Char(25)        NOT NULL,
Address 	 Char(50)        NULL,
Email  		 Char(25)        NULL,
Phone 		 Char(10)        NOT NULL,
CONSTRAINT VendorPK           PRIMARY KEY (VendorID),
);

/*Insert records into VENDOR */

INSERT INTO VENDOR (VendorID, Name, Address, Email, Phone) VALUES (100, 'Jessi', '5073 street', 'jessi@gmail.com', 3138191345)
INSERT INTO VENDOR (VendorID, Name, Address, Email, Phone) VALUES (101, 'John', '8093 Nectar Dr', 'john@gmail.com', 1267124988)
INSERT INTO VENDOR (VendorID, Name, Address, Email, Phone) VALUES (102, 'Julie', '6897 Hamilton Ave', 'julie@gmail.com', 6812721838)
INSERT INTO VENDOR (VendorID, Name, Address, Email, Phone) VALUES (103, 'Sara', '83476 Napoleon Road', 'sara@gmail.com', 7869272338)


/* Create table ACCOUNT*/

CREATE TABLE ACCOUNT (
AccountType		     Char (15)     NOT NULL,
Description		     Char (100)    NULL,
MinBalanceReq  	     Int	        NOT NULL,
MaxBalancePermitted  Int           NOT NULL,
CONSTRAINT AccountPK         PRIMARY KEY (AccountType),
);

/*Insert records into ACCOUNT */ 

INSERT INTO ACCOUNT (AccountType, Description, MinBalanceReq, MaxBalancePermitted) VALUES ('Savings', 'Min balance required', 500, 1000000)
INSERT INTO ACCOUNT (AccountType, Description, MinBalanceReq, MaxBalancePermitted) VALUES ('Checking', 'Min balance not required', 0, 1000000)
INSERT INTO ACCOUNT (AccountType, Description, MinBalanceReq, MaxBalancePermitted) VALUES ('Credit card', 'Min balance required', 500, 10000)
INSERT INTO ACCOUNT (AccountType, Description, MinBalanceReq, MaxBalancePermitted) VALUES ('Mortgage', 'Min balance not required', 0, 100000)

/* Create Table VENDOR_QUOTE*/

CREATE TABLE VENDOR_QUOTE (
VendorTechID	 Int              NOT NULL,
VendorID	 	 Int	            NOT NULL,
TechID	 	 Int        	 NOT NULL,
Specification	 Char(50)		 NULL,
PriceQuote		 Int		   	 NOT NULL,
Date			 Char(10)        NULL,
CONSTRAINT VendorQuotePK    PRIMARY KEY (VendorTechID),
CONSTRAINT VendorTechFK  FOREIGN KEY (VendorID)
                         REFERENCES VENDOR(VendorID)
					     ON UPDATE CASCADE
					     ON DELETE NO ACTION,
CONSTRAINT TechVendorFK  FOREIGN KEY (TechID)
                         REFERENCES TECHNOLOGY(TechID)
					     ON UPDATE CASCADE
					     ON DELETE NO ACTION,

);

/*Insert records into VENDOR_QUOTE */ 

INSERT INTO VENDOR_QUOTE (VendorTechID, VendorID, TechID, Specification, PriceQuote, Date) VALUES (201, 100, 1, 'laptop', 1000, '12/08/2019')
INSERT INTO VENDOR_QUOTE(VendorTechID, VendorID, TechID, Specification, PriceQuote, Date) VALUES (202, 101, 2, 'phone', 1500, '05/10/2019')
INSERT INTO VENDOR_QUOTE (VendorTechID, VendorID, TechID, Specification, PriceQuote, Date) VALUES (203, 102, 3, 'book', 1300, '03/07/2019')
INSERT INTO VENDOR_QUOTE (VendorTechID, VendorID, TechID, Specification, PriceQuote, Date) VALUES (204, 103, 4, 'desktop', 1500, '09/10/2019')


/* Create Table BRANCH, EMPLOYEE without any FK definitions */

CREATE TABLE BRANCH (
BranchID	Int              NOT NULL,
Address		Char (50)        NULL,
PhoneNumber   char(10)    NOT NULL,
Description Char (100)       NULL,
OpenDate	Char(10)	 NOT NULL,
ManagerID	Int	         NULL
CONSTRAINT BranchPK      PRIMARY KEY (BranchID),
);

CREATE TABLE EMPLOYEE (
EmployeeID	Int         NOT NULL,
FirstName	Char (25)   NOT NULL,
LastName	Char (25)   NULL,
HireDate	Char(10)	NULL,
Salary		Int	        NULL,
BranchID	Int	        NOT NULL,
CONSTRAINT EmployeePK	PRIMARY KEY (EmployeeID),
CONSTRAINT BranchFK	FOREIGN KEY (BranchID)
					REFERENCES BRANCH(BranchID)
					ON UPDATE CASCADE
					ON DELETE NO ACTION,
);




/* Create the relationships by adding the FK definitions */ 

ALTER TABLE	BRANCH ADD CONSTRAINT ManagerIDFK	FOREIGN KEY (ManagerID)
						REFERENCES EMPLOYEE(EmployeeID)
								ON UPDATE NO ACTION
								ON DELETE NO ACTION

/*Insert records into BRANCH */

INSERT INTO BRANCH (BranchID, Address, PhoneNumber, Description, OpenDate) VALUES (10, 'Canton', 6783298345, 'abcdef', '6/08/2009')
INSERT INTO BRANCH (BranchID, Address, PhoneNumber, Description, OpenDate) VALUES (11, 'Dearborn', 5675876884, 'dfwfe', '3/21/2008')
INSERT INTO BRANCH (BranchID, Address, PhoneNumber, Description, OpenDate) VALUES (12, 'Westland', 3453656364, 'ewvferc', '6/17/2007')
INSERT INTO BRANCH (BranchID, Address, PhoneNumber, Description, OpenDate) VALUES (13, 'Plymouth', 5545645654, 'svfevwfv', '09/16/2015')

/*Insert records into EMPLOYEE */

INSERT INTO EMPLOYEE (EmployeeID, FirstName, LastName, HireDate, Salary, BranchID) VALUES (20, 'Tally', 'Josh', '9/2/2005', 35000, 10)
INSERT INTO EMPLOYEE (EmployeeID, FirstName, LastName, HireDate, Salary, BranchID) VALUES (21, 'Will', 'Rose', '6/5/2010', 37000, 11)
INSERT INTO EMPLOYEE (EmployeeID, FirstName, LastName, HireDate, Salary, BranchID) VALUES (22, 'Shane', 'Baden', '10/17/2009', 33000, 12)
INSERT INTO EMPLOYEE (EmployeeID, FirstName, LastName, HireDate, Salary, BranchID) VALUES (23, 'Rachel', 'Hardy', '8/19/2017', 36000, 13) 

/*Update BRANCH column of ManagerID */

UPDATE BRANCH SET ManagerID = 20 WHERE BranchID = '10';
UPDATE BRANCH SET ManagerID = 21 WHERE BranchID = '11';
UPDATE BRANCH SET ManagerID = 22 WHERE BranchID = '12';
UPDATE BRANCH SET ManagerID = 23 WHERE BranchID = '13';

ALTER TABLE BRANCH ALTER COLUMN ManagerID Int NOT NULL;

/* Create table DEPENDANT*/

CREATE TABLE DEPENDANT (
DependantID      Int              NOT NULL,
FirstName        Char (25)        NOT NULL,
LastName  	     Char (25)        NOT NULL,
Address   		 Char (50)        NULL,
Relation  		 Char (25)        NULL,
EmployeeID		 Int 		      NOT NULL,
CONSTRAINT DependantPK      PRIMARY KEY (DependantID),
CONSTRAINT EmployeeDeptFK	   FOREIGN KEY	(EmployeeID)
						REFERENCES EMPLOYEE(EmployeeID)
						ON UPDATE NO ACTION
						ON DELETE NO ACTION,
						);

/*Insert records into DEPENDANT */

INSERT INTO DEPENDANT (DependantID, FirstName, LastName, Address, Relation, EmployeeID) VALUES (400, 'Hassan', 'Perry', 'McKiney Road', 'Son', 21)
INSERT INTO DEPENDANT (DependantID, FirstName, LastName, Address, Relation, EmployeeID) VALUES (401, 'Daniel', 'Ruth', 'Warries Farms', 'Son', 22)
INSERT INTO DEPENDANT (DependantID, FirstName, LastName, Address, Relation, EmployeeID) VALUES (402, 'Amy', 'James', 'Ford Road', 'Daughter',20)
INSERT INTO DEPENDANT (DependantID, FirstName, LastName, Address, Relation, EmployeeID) VALUES (403, 'Angela', 'Shank', 'Schifer Road', 'Daughter',23)


/* Create table OFFICE_ROOMS*/

CREATE TABLE OFFICE_ROOMS (
RoomID        Int           NOT NULL,
Size   		  Char (25)     NULL,
Capacity  	  Int	        NULL,
SmartRoom     Char (25)     NULL,
BranchID	  Int		    NOT NULL,
CONSTRAINT OfficeRoomsPK      PRIMARY KEY (RoomID),
CONSTRAINT BranchOfficeFK FOREIGN KEY (BranchID)
						REFERENCES BRANCH(BranchID)
						ON UPDATE CASCADE
						ON DELETE NO ACTION,

);

/*Insert records into OFFICE_ROOMS */

INSERT INTO OFFICE_ROOMS (RoomID, Size, Capacity, SmartRoom, BranchID) VALUES (300, '6786', 45, 'yes', 12)
INSERT INTO OFFICE_ROOMS (RoomID, Size, Capacity, SmartRoom, BranchID) VALUES (301, '1798', 20, 'no', 10)
INSERT INTO OFFICE_ROOMS (RoomID, Size, Capacity, SmartRoom, BranchID) VALUES (302, '2783', 25, 'no', 13)
INSERT INTO OFFICE_ROOMS (RoomID, Size, Capacity, SmartRoom, BranchID) VALUES (303, '1783', 20, 'yes', 11)

/* Create table CUSTOMER*/


CREATE TABLE CUSTOMER (
CustomerID       Int              NOT NULL,
FirstName   	 Char (25)        NOT NULL,
LastName  	     Char (25)        NOT NULL,
Address   		 Char (50)        NULL,
Email  			 Char (25)        NULL,
DOB			     Char(10)	      NULL,
AdvisorID		 Int			  NULL,
CONSTRAINT CustomerPK      PRIMARY KEY (CustomerID),
CONSTRAINT AdvisorCustFK	  FOREIGN KEY (AdvisorID)
					REFERENCES EMPLOYEE(EmployeeID)
					ON UPDATE NO ACTION
					ON DELETE NO ACTION,
);


/*Insert records into CUSTOMER */

INSERT INTO CUSTOMER (CustomerID, FirstName, LastName, Address, Email, DOB, AdvisorID) VALUES (500, 'David', 'Austin', '876 Parking street', 'davidA@gmail.com', '09/23/1999', 20)
INSERT INTO CUSTOMER (CustomerID, FirstName, LastName, Address, Email, DOB, AdvisorID) VALUES (501, 'James', 'Run', '921 Luis Road', 'jamesR@gmail.com', '05/05/1991', 22)
INSERT INTO CUSTOMER (CustomerID, FirstName, LastName, Address, Email, DOB, AdvisorID) VALUES (502, 'Stephen', 'Hawking', '102 Justin street', 'stephenH@gmail.com', '03/03/1997', 21)
INSERT INTO CUSTOMER (CustomerID, FirstName, LastName, Address, Email, DOB, AdvisorID) VALUES (503, 'Doty', 'Peter', '185 Frank street', 'DotyP@gmail.com', '08/08/1992', 23)

/* Create table BILL*/

CREATE TABLE BILL (
BillID        Int           NOT NULL,
ServiceDesc	  Char (50)     NULL,
Amount  	  Int	        NOT NULL,
Date   	      Char(10)      NOT NULL,
CustomerID	  Int		    NOT NULL,
CONSTRAINT BillPK      PRIMARY KEY (BillID),
CONSTRAINT CustomerbillFK  FOREIGN KEY (CustomerID)
                       REFERENCES CUSTOMER (CustomerID)
					   ON UPDATE NO ACTION
					   ON DELETE NO ACTION,
);

/*Insert records into BILL */

INSERT INTO BILL (BillID, ServiceDesc, Amount, Date, CustomerID) VALUES (600, 'Account opening', 500, '08/13/2019', 500)
INSERT INTO BILL (BillID, ServiceDesc, Amount, Date, CustomerID) VALUES (601, 'loan service', 6000, '06/25/2019', 502)
INSERT INTO BILL (BillID, ServiceDesc, Amount, Date, CustomerID) VALUES (602, 'advising service', 4500, '07/25/2019', 501)
INSERT INTO BILL (BillID, ServiceDesc, Amount, Date, CustomerID) VALUES (603, 'deposit service',5000, '07/23/2019', 503)

/* Create CUST_ACCOUNT */

CREATE TABLE CUST_ACCOUNT (
AccountID     	     Int           NOT NULL,
CustomerID	 	     Int	       NOT NULL,
AccountType	 	     Char(15)       NOT NULL,
IndividualOrJoint    Char(25)      NULL,
CurrentBalance	  	 Int	   	   NOT NULL,
CONSTRAINT AccountCusPK   PRIMARY KEY (AccountID),
CONSTRAINT CustomerAccFK  FOREIGN KEY (CustomerID)
                          REFERENCES CUSTOMER(CustomerID)
					      ON UPDATE NO ACTION
					      ON DELETE NO ACTION,
CONSTRAINT AccountTypeFK  FOREIGN KEY (AccountType)
                          REFERENCES ACCOUNT(AccountType)
					      ON UPDATE NO ACTION
					      ON DELETE NO ACTION,

);

/*Insert records into CUST_ACCOUNT */

INSERT INTO CUST_ACCOUNT (AccountID, CustomerID, AccountType, IndividualOrJoint, CurrentBalance) VALUES (700, 501, 'Savings', 'Joint',7800)
INSERT INTO CUST_ACCOUNT (AccountID, CustomerID, AccountType, IndividualOrJoint, CurrentBalance) VALUES (701, 500, 'Checking', 'Individual', 3300)
INSERT INTO CUST_ACCOUNT (AccountID, CustomerID, AccountType, IndividualOrJoint, CurrentBalance) VALUES (702, 502, 'Credit card', 'Joint', 8900)
INSERT INTO CUST_ACCOUNT (AccountID, CustomerID, AccountType, IndividualOrJoint, CurrentBalance) VALUES (703, 503, 'Mortgage', 'Individual', 5200)

/* Create OFFICE_ASSIGNMENT*/

CREATE TABLE OFFICE_ASSIGNMENT (
RoomAssignmentID   Int           NOT NULL,
RoomID	 		   Int	         NOT NULL,
EmployeeID	 	   Int        	 NOT NULL,
DateOccupied 	   Char(10)      NULL,
PhoneNumber	  	   Char(10)	   	 NULL,
CONSTRAINT RoomAssignmentPK    PRIMARY KEY (RoomAssignmentID),
CONSTRAINT RoomOfficeFK  FOREIGN KEY (RoomID)
                         REFERENCES OFFICE_ROOMS(RoomID)
				         ON UPDATE CASCADE
				         ON DELETE NO ACTION,
CONSTRAINT EmployeeOfficeFK  FOREIGN KEY (EmployeeID)
                             REFERENCES EMPLOYEE(EmployeeID)
					         ON UPDATE NO ACTION
					         ON DELETE NO ACTION,

);

/*Insert records into OFFICE_ASSIGNMENT */

INSERT INTO OFFICE_ASSIGNMENT (RoomAssignmentID, RoomID, EmployeeID, DateOccupied, PhoneNumber) VALUES (800, 302, 20, '4/15/2008', 5767656745)
INSERT INTO OFFICE_ASSIGNMENT (RoomAssignmentID, RoomID, EmployeeID, DateOccupied, PhoneNumber) VALUES (801, 303, 21, '6/21/2018', 2135434253)
INSERT INTO OFFICE_ASSIGNMENT (RoomAssignmentID, RoomID, EmployeeID, DateOccupied, PhoneNumber) VALUES (802, 300, 22, '7/18/2002', 4636365654)
INSERT INTO OFFICE_ASSIGNMENT (RoomAssignmentID, RoomID, EmployeeID, DateOccupied, PhoneNumber) VALUES (803, 301, 23, '8/19/2001', 4563453345)

/* Create Table PURCHASE*/

CREATE TABLE PURCHASE (
PurchaseID	      Int              NOT NULL,
VendorTechID	   Int	           NOT NULL,
BranchID	  Int        	   NOT NULL,
Purchaseprice	  Int		   NOT NULL,
InvoiceNo		  Char(25)         Null, 
Date			  Char(10)         NULL,
CONSTRAINT PurchasePK    PRIMARY KEY (PurchaseID),
CONSTRAINT VendorPurchaseFK  FOREIGN KEY (VendorTechID)
							 REFERENCES VENDOR_QUOTE(VendorTechID)
							 ON UPDATE CASCADE
					         ON DELETE NO ACTION,
CONSTRAINT BranchPurchaseFK  FOREIGN KEY (BranchID)
							 REFERENCES Branch(BranchID)
					         ON UPDATE CASCADE
					         ON DELETE NO ACTION,

);

/*Insert records into PURCHASE */

INSERT INTO PURCHASE (PurchaseID, VendorTechID, BranchID, PurchasePrice, InvoiceNo, Date) VALUES (900, 201, 13, 6758, '65475FYO', '12/13/2016')
INSERT INTO PURCHASE (PurchaseID, VendorTechID, BranchID, PurchasePrice, InvoiceNo, Date) VALUES (901, 202, 10, 87966, '56876HGL', '05/24/2009')
INSERT INTO PURCHASE (PurchaseID, VendorTechID, BranchID, PurchasePrice, InvoiceNo, Date) VALUES (902, 203, 12, 38787, '46475SDF', '08/18/2003')
INSERT INTO PURCHASE (PurchaseID, VendorTechID, BranchID, PurchasePrice, InvoiceNo, Date) VALUES (903, 204, 11, 45657, '45758FDF', '01/28/2010')

