SQL> CREATE TABLE CustomerCategory(
  2  CustomerCategoryID INT NOT NULL PRIMARY KEY,
  3  CustomerCategory VARCHAR2(15) NOT NULL,
  4  DiscountRate DECIMAL NOT NULL);

Table created.

SQL> 
SQL> Desc CustomerCategory;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CUSTOMERCATEGORYID                        NOT NULL NUMBER(38)
 CUSTOMERCATEGORY                          NOT NULL VARCHAR2(15)
 DISCOUNTRATE                              NOT NULL NUMBER(38)

SQL> CREATE TABLE Customer(
  2  CustomerID INT NOT NULL PRIMARY KEY,
  3  CustomerName VARCHAR2(30) NOT NULL,
  4  Address VARCHAR2(50) NOT NULL,
  5  CustomerCategoryID INT NOT NULL,
  6  FOREIGN KEY (CustomerCategoryID) REFERENCES CustomerCategory(CustomerCategoryID));

Table created.

SQL> 
SQL> Desc Customer;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CUSTOMERID                                NOT NULL NUMBER(38)
 CUSTOMERNAME                              NOT NULL VARCHAR2(30)
 ADDRESS                                   NOT NULL VARCHAR2(50)
 CUSTOMERCATEGORYID                        NOT NULL NUMBER(38)

SQL> CREATE TABLE Orders(
  2  OrderID INT NOT NULL,
  3  CustomerID INT NOT NULL,
  4  PRIMARY KEY (OrderID, CustomerID));

Table created.

SQL> 
SQL> Desc Orders;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ORDERID                                   NOT NULL NUMBER(38)
 CUSTOMERID                                NOT NULL NUMBER(38)

SQL> CREATE TABLE Invoice(
  2  InvoiceID INT NOT NULL PRIMARY KEY,
  3  PaymentOption VARCHAR2(30) NOT NULL,
  4  PaymentStatus VARCHAR2(30) NOT NULL,
  5  DiscountAmount DECIMAL NOT NULL,
  6  TotalPaidAmount DECIMAL NOT NULL);

Table created.

SQL> 
SQL> Desc Invoice;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 INVOICEID                                 NOT NULL NUMBER(38)
 PAYMENTOPTION                             NOT NULL VARCHAR2(30)
 PAYMENTSTATUS                             NOT NULL VARCHAR2(30)
 DISCOUNTAMOUNT                            NOT NULL NUMBER(38)
 TOTALPAIDAMOUNT                           NOT NULL NUMBER(38)

SQL> CREATE TABLE OrderDetails(
  2  OrderID INT NOT NULL PRIMARY KEY,
  3  OrderDate DATE NOT NULL,
  4  TotalOrderAmount DECIMAL NOT NULL,
  5  InvoiceID INT NOT NULL,
  6  DeliveryStatus VARCHAR2(30) NOT NULL,
  7  FOREIGN KEY (InvoiceID) REFERENCES Invoice(InvoiceID));

Table created.

SQL> Desc OrderDetails;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 ORDERID                                   NOT NULL NUMBER(38)
 ORDERDATE                                 NOT NULL DATE
 TOTALORDERAMOUNT                          NOT NULL NUMBER(38)
 INVOICEID                                 NOT NULL NUMBER(38)
 DELIVERYSTATUS                            NOT NULL VARCHAR2(30)

SQL> CREATE TABLE PurchasedProduct(
  2  CustomerID INT NOT NULL,
  3  OrderID INT NOT NULL,
  4  ProductID INT NOT NULL,
  5  PurchasedQuantity INT NOT NULL,
  6  PurchasedQuantityPrice DECIMAL NOT NULL,
  7  PRIMARY KEY (CustomerID, OrderID, ProductID));

Table created.

SQL> Desc PurchasedProduct;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CUSTOMERID                                NOT NULL NUMBER(38)
 ORDERID                                   NOT NULL NUMBER(38)
 PRODUCTID                                 NOT NULL NUMBER(38)
 PURCHASEDQUANTITY                         NOT NULL NUMBER(38)
 PURCHASEDQUANTITYPRICE                    NOT NULL NUMBER(38)

SQL> CREATE TABLE Vendor(
  2  VendorID INT NOT NULL PRIMARY KEY,
  3  Vendor VARCHAR2(30) NOT NULL,
  4  VendorContact VARCHAR2(30) NOT NULL);

Table created.

SQL> 
SQL> Desc Vendor;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 VENDORID                                  NOT NULL NUMBER(38)
 VENDOR                                    NOT NULL VARCHAR2(30)
 VENDORCONTACT                             NOT NULL VARCHAR2(30)

SQL> CREATE TABLE ProductDetails(
  2  ProductID INT NOT NULL PRIMARY KEY,
  3  ProductName VARCHAR2(30) NOT NULL,
  4  ProductCategory VARCHAR2(30) NOT NULL,
  5  Description VARCHAR2(100) NOT NULL,
  6  Price INT NOT NULL,
  7  StockLevel INT NOT NULL,
  8  AvailabilityStatus VARCHAR2(30) NOT NULL,
  9  VendorID INT NOT NULL,
 10  FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID));

Table created.

SQL> Desc ProductDetails;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 PRODUCTID                                 NOT NULL NUMBER(38)
 PRODUCTNAME                               NOT NULL VARCHAR2(30)
 PRODUCTCATEGORY                           NOT NULL VARCHAR2(30)
 DESCRIPTION                               NOT NULL VARCHAR2(100)
 PRICE                                     NOT NULL NUMBER(38)
 STOCKLEVEL                                NOT NULL NUMBER(38)
 AVAILABILITYSTATUS                        NOT NULL VARCHAR2(30)
 VENDORID                                  NOT NULL NUMBER(38)

SQL> COMMIT;

Commit complete.

SQL> SPOOL OFF;
SQL> INSERT ALL
  2  INTO CustomerCategory VALUES (1, 'Regular', 0)
  3  INTO CustomerCategory VALUES (2, 'Staff', 5)
  4  INTO CustomerCategory VALUES (3, 'VIP', 10)
  5  SELECT * FROM dual;

3 rows created.

SQL> 
SQL> SELECT * FROM CustomerCategory;

CUSTOMERCATEGORYID CUSTOMERCATEGOR DISCOUNTRATE                                 
------------------ --------------- ------------                                 
                 1 Regular                    0                                 
                 2 Staff                      5                                 
                 3 VIP                       10                                 

SQL> INSERT ALL
  2  INTO Customer VALUES (1, `Atal', `Kathmandu', 1)
  3  INTO Customer VALUES (2, `Hari', `Jhapa', 2)
  4  INTO Customer VALUES (3, `Ram', `Illam', 3)
  5  INTO Customer VALUES (4, `John', `Pokhara', 2)
  6  INTO Customer VALUES (5, `Sita', `Dhangadi', 1)
  7  INTO Customer VALUES (6, `Shyam', `Jumla', 1)
  8  INTO Customer VALUES (7, `Priya', `Nepalgunj', 2)
  9  INTO Customer VALUES (8, `Laxmi', `Dhangadi', 1)
 10  INTO Customer VALUES (9, `Saksham', `Surkhet', 3)
 11  INTO Customer VALUES (10, `Laxman', `Chitwan', 3)
 12  SELECT * FROM dual;
INTO Customer VALUES (1, `Atal', `Kathmandu', 1)
                         *
ERROR at line 2:
ORA-00911: invalid character 


SQL> 
SQL> SELECT * FROM Customer;

no rows selected

SQL> 
SQL> INSERT ALL
  2  INTO Customer VALUES (1,'Atal','Kathmandu', 1)
  3  INTO Customer VALUES (2,'Hari','Jhapa', 2)
  4  INTO Customer VALUES (3,'Ram','Illam', 3)
  5  INTO Customer VALUES (4,'John','Pokhara', 2)
  6  INTO Customer VALUES (5,'Sita','Dhangadi', 1)
  7  INTO Customer VALUES (6,'Shyam','Jumla', 1)
  8  INTO Customer VALUES (7,'Priya','Nepalgunj', 2)
  9  INTO Customer VALUES (8,'Laxmi','Dhangadi', 1)
 10  INTO Customer VALUES (9,'Saksham','Surkhet', 3)
 11  INTO Customer VALUES (10,'Laxman','Chitwan', 3)
 12  SELECT * FROM dual;

10 rows created.

SQL> 
SQL> SELECT * FROM Customer;

CUSTOMERID CUSTOMERNAME                                                         
---------- ------------------------------                                       
ADDRESS                                            CUSTOMERCATEGORYID           
-------------------------------------------------- ------------------           
         1 Atal                                                                 
Kathmandu                                                           1           
                                                                                
         2 Hari                                                                 
Jhapa                                                               2           
                                                                                
         3 Ram                                                                  
Illam                                                               3           
                                                                                

CUSTOMERID CUSTOMERNAME                                                         
---------- ------------------------------                                       
ADDRESS                                            CUSTOMERCATEGORYID           
-------------------------------------------------- ------------------           
         4 John                                                                 
Pokhara                                                             2           
                                                                                
         5 Sita                                                                 
Dhangadi                                                            1           
                                                                                
         6 Shyam                                                                
Jumla                                                               1           
                                                                                

CUSTOMERID CUSTOMERNAME                                                         
---------- ------------------------------                                       
ADDRESS                                            CUSTOMERCATEGORYID           
-------------------------------------------------- ------------------           
         7 Priya                                                                
Nepalgunj                                                           2           
                                                                                
         8 Laxmi                                                                
Dhangadi                                                            1           
                                                                                
         9 Saksham                                                              
Surkhet                                                             3           
                                                                                

CUSTOMERID CUSTOMERNAME                                                         
---------- ------------------------------                                       
ADDRESS                                            CUSTOMERCATEGORYID           
-------------------------------------------------- ------------------           
        10 Laxman                                                               
Chitwan                                                             3           
                                                                                

10 rows selected.

SQL> COLUMN CUSTOMERID FORMAT 9999
SQL> COLUMN CUSTOMERNAME FORMAT A15
SQL> COLUMN ADDRESS FORMAT A15
SQL> COLUMN CUSTOMERCATEGORYID FORMAT 9999
SQL> SELECT * FROM Customer;

CUSTOMERID CUSTOMERNAME    ADDRESS         CUSTOMERCATEGORYID                   
---------- --------------- --------------- ------------------                   
         1 Atal            Kathmandu                        1                   
         2 Hari            Jhapa                            2                   
         3 Ram             Illam                            3                   
         4 John            Pokhara                          2                   
         5 Sita            Dhangadi                         1                   
         6 Shyam           Jumla                            1                   
         7 Priya           Nepalgunj                        2                   
         8 Laxmi           Dhangadi                         1                   
         9 Saksham         Surkhet                          3                   
        10 Laxman          Chitwan                          3                   

10 rows selected.

SQL> INSERT ALL
  2  INTO Orders (1,1)
  3  INTO Orders (2,4)
  4  INTO Orders (3,5)
  5  INTO Orders (4,3)
  6  INTO Orders (5,3)
  7  INTO Orders (6,6)
  8  INTO Orders (7,7)
  9  SELECT * FROM dual;
INTO Orders (1,1)
             *
ERROR at line 2:
ORA-01747: invalid user.table.column, table.column, or column specification 


SQL> 
SQL> SELECT * FROM Orders
  2  ;

no rows selected

SQL> INSERT ALL
  2  INTO Orders VALUES (1,1)
  3  INTO Orders VALUES (2,4)
  4  INTO Orders VALUES (3,5)
  5  INTO Orders VALUES (4,3)
  6  INTO Orders VALUES (5,3)
  7  INTO Orders VALUES (6,6)
  8  INTO Orders VALUES (7,7)
  9  SELECT * FROM dual;

7 rows created.

SQL> 
SQL> SELECT * FROM Orders
  2  ;

   ORDERID CUSTOMERID                                                           
---------- ----------                                                           
         1          1                                                           
         2          4                                                           
         3          5                                                           
         4          3                                                           
         5          3                                                           
         6          6                                                           
         7          7                                                           

7 rows selected.

SQL> INSERT ALL
  2  INTO Invoice VALUES (1,'Online','Paid', 0, 3000)
  3  INTO Invoice VALUES (2,'COD','Paid', 100, 1900)
  4  INTO Invoice VALUES (3,'Online','Paid', 0, 5000)
  5  INTO Invoice VALUES (4,'Online','Paid', 200, 1800)
  6  INTO Invoice VALUES (5,'COD','Paid', 300, 2700)
  7  INTO Invoice VALUES (6,'COD','Paid', 0, 2500)
  8  INTO Invoice VALUES (7,'COD','Paid', 50, 950)
  9  SELECT * FROM dual;

7 rows created.

SQL> 
SQL> SELECT * FROM Invoice;

 INVOICEID PAYMENTOPTION                  PAYMENTSTATUS                         
---------- ------------------------------ ------------------------------        
DISCOUNTAMOUNT TOTALPAIDAMOUNT                                                  
-------------- ---------------                                                  
         1 Online                         Paid                                  
             0            3000                                                  
                                                                                
         2 COD                            Paid                                  
           100            1900                                                  
                                                                                
         3 Online                         Paid                                  
             0            5000                                                  
                                                                                

 INVOICEID PAYMENTOPTION                  PAYMENTSTATUS                         
---------- ------------------------------ ------------------------------        
DISCOUNTAMOUNT TOTALPAIDAMOUNT                                                  
-------------- ---------------                                                  
         4 Online                         Paid                                  
           200            1800                                                  
                                                                                
         5 COD                            Paid                                  
           300            2700                                                  
                                                                                
         6 COD                            Paid                                  
             0            2500                                                  
                                                                                

 INVOICEID PAYMENTOPTION                  PAYMENTSTATUS                         
---------- ------------------------------ ------------------------------        
DISCOUNTAMOUNT TOTALPAIDAMOUNT                                                  
-------------- ---------------                                                  
         7 COD                            Paid                                  
            50             950                                                  
                                                                                

7 rows selected.

SQL> COLUMN INVOICEID FORMAT 9999
SQL> COLUMN PAYMENTOPTION FORMAT A15
SQL> COLUMN PAYMENTSTATUS FORMAT A15
SQL> COLUMN DISCOUNTAMOUNT FORMAT 999999
SQL> COLUMN TOTALPAIDAMOUNT FORMAT 999999
SQL> SELECT * FROM Invoice;

INVOICEID PAYMENTOPTION   PAYMENTSTATUS   DISCOUNTAMOUNT TOTALPAIDAMOUNT        
--------- --------------- --------------- -------------- ---------------        
        1 Online          Paid                         0            3000        
        2 COD             Paid                       100            1900        
        3 Online          Paid                         0            5000        
        4 Online          Paid                       200            1800        
        5 COD             Paid                       300            2700        
        6 COD             Paid                         0            2500        
        7 COD             Paid                        50             950        

7 rows selected.

SQL> INSERT ALL
  2  INTO OrderDetails VALUES (1, DATE '2023-05-01', 3000, 1, 'Delivered')
  3  INTO OrderDetails VALUES (2, DATE '2023-05-12', 2000, 2, 'Delivered')
  4  INTO OrderDetails VALUES (3, DATE '2023-05-24', 5000, 3, 'Delivered')
  5  INTO OrderDetails VALUES (4, DATE '2023-06-05', 2000, 4, 'Delivered')
  6  INTO OrderDetails VALUES (5, DATE '2023-06-15', 3000, 5, 'Delivered')
  7  INTO OrderDetails VALUES (6, DATE '2023-06-17', 2500, 6, 'Delivered')
  8  INTO OrderDetails VALUES (7, DATE '2023-08-2', 1000, 7, 'Delivered')
  9  SELECT * FROM dual;

7 rows created.

SQL> 
SQL> SELECT * FROM OrderDetails;

   ORDERID ORDERDATE TOTALORDERAMOUNT INVOICEID DELIVERYSTATUS                  
---------- --------- ---------------- --------- ------------------------------  
         1 01-MAY-23             3000         1 Delivered                       
         2 12-MAY-23             2000         2 Delivered                       
         3 24-MAY-23             5000         3 Delivered                       
         4 05-JUN-23             2000         4 Delivered                       
         5 15-JUN-23             3000         5 Delivered                       
         6 17-JUN-23             2500         6 Delivered                       
         7 02-AUG-23             1000         7 Delivered                       

7 rows selected.

SQL> INSERT ALL
  2  INTO PurchasedProduct VALUES (1, 1, 1, 1, 1500)
  3  INTO PurchasedProduct VALUES (1, 1, 2, 1, 1500)
  4  INTO PurchasedProduct VALUES (4, 2, 4, 2, 2000)
  5  INTO PurchasedProduct VALUES (5, 3, 3, 2, 5000)
  6  INTO PurchasedProduct VALUES (3, 4, 2, 2, 2000)
  7  INTO PurchasedProduct VALUES (3, 5, 4, 4, 3000)
  8  INTO PurchasedProduct VALUES (6, 6, 7, 5, 2500)
  9  INTO PurchasedProduct VALUES (7, 7, 7, 2, 1000)
 10  SELECT * FROM dual;

8 rows created.

SQL> SELECT * FROM PurchasedProduct;

CUSTOMERID    ORDERID  PRODUCTID PURCHASEDQUANTITY PURCHASEDQUANTITYPRICE       
---------- ---------- ---------- ----------------- ----------------------       
         1          1          1                 1                   1500       
         1          1          2                 1                   1500       
         4          2          4                 2                   2000       
         5          3          3                 2                   5000       
         3          4          2                 2                   2000       
         3          5          4                 4                   3000       
         6          6          7                 5                   2500       
         7          7          7                 2                   1000       

8 rows selected.

SQL> INSERT ALL
  2  INTO Vendor VALUES(1, `Samsung', `Samsung@gmail.com')
  3  INTO Vendor VALUES(2, `Apple', `Apple @gmail.com')
  4  INTO Vendor VALUES(3, `Oppo', `Oppo @gmail.com')
  5  INTO Vendor VALUES(4, `Microsoft', `Microsoft @gmail.com')
  6  INTO Vendor VALUES(5, `Sony', `Sony@gmail.com')
  7  INTO Vendor VALUES(6, `Canon', `Canon@gmail.com')
  8  INTO Vendor VALUES(7, `Acer', `Acer@gmail.com')
  9  SELECT * FROM dual;
INTO Vendor VALUES(1, `Samsung', `Samsung@gmail.com')
                      *
ERROR at line 2:
ORA-00911: invalid character 


SQL> SELECT * FROM Vendor;

no rows selected

SQL> INSERT ALL
  2  INTO Vendor VALUES(1,'Samsung','Samsung@gmail.com')
  3  INTO Vendor VALUES(2,'Apple','Apple @gmail.com')
  4  INTO Vendor VALUES(3,'Oppo','Oppo @gmail.com')
  5  INTO Vendor VALUES(4,'Microsoft','Microsoft @gmail.com')
  6  INTO Vendor VALUES(5,'Sony','Sony@gmail.com')
  7  INTO Vendor VALUES(6,'Canon','Canon@gmail.com')
  8  INTO Vendor VALUES(7,'Acer','Acer@gmail.com')
  9  SELECT * FROM dual;

7 rows created.

SQL> SELECT * FROM Vendor;

  VENDORID VENDOR                         VENDORCONTACT                         
---------- ------------------------------ ------------------------------        
         1 Samsung                        Samsung@gmail.com                     
         2 Apple                          Apple @gmail.com                      
         3 Oppo                           Oppo @gmail.com                       
         4 Microsoft                      Microsoft @gmail.com                  
         5 Sony                           Sony@gmail.com                        
         6 Canon                          Canon@gmail.com                       
         7 Acer                           Acer@gmail.com                        

7 rows selected.

SQL> INSERT ALL
  2  INTO ProductDetails VALUES (1, 'Iphone15', 'Smartphone', 'Apple Iphone 15', 1500, 16, 'Available', 2)
  3  INTO ProductDetails VALUES (2, 'TabS4', Tablet', 'Samsung Galaxy tab s4', 1000, 12, 'Available', 1)
  4  INTO ProductDetails VALUES (3, 'MacM1', 'Laptop', 'Apple Mac', 2500, 16, 'Available', 2)
  5  INTO ProductDetails VALUES (4, 'A15', 'Smartphone', 'Oppo A15', 750, 54, 'Available', 3)
  6  INTO ProductDetails VALUES (5, 'M50', 'Camera', 'Canon M50', 800, 12, 'Available', 6)
  7  INTO ProductDetails VALUES (6, 'Xbox', 'Gaming Console', 'Xboxone', 500, 15, 'Available', 4)
  8  INTO ProductDetails VALUES (7, 'PS5', 'Gaming Console', 'Playstation', 500, 22, 'Available', 5)
  9  INTO ProductDetails VALUES (8, 'Airpods Pro', 'Headphone', 'Apple Airpods', 200, 32, 'Available', 2)
 10  INTO ProductDetails VALUES (9, 'Nitro5', 'Laptop', 'Acer Nitro5', 1650, 5, 'Available', 7)
 11  INTO ProductDetails VALUES (10, 'Ipad5', 'Tablet', 'Apple Ipad5', 1200, 12, 'Available', 2)
 12  SELECT * FROM dual;
ERROR:
ORA-01756: quoted string not properly terminated 


SQL> 
SQL> SELECT * FROM ProductDetails;

no rows selected

SQL> INSERT ALL
  2  INTO ProductDetails VALUES (1, 'Iphone15', 'Smartphone', 'Apple Iphone 15', 1500, 16, 'Available', 2)
  3  INTO ProductDetails VALUES (2, 'TabS4', Tablet', 'Samsung Galaxy tab s4', 1000, 12, 'Available', 1)
  4  INTO ProductDetails VALUES (3, 'MacM1', 'Laptop', 'Apple Mac', 2500, 16, 'Available', 2)
  5  INTO ProductDetails VALUES (4, 'A15', 'Smartphone', 'Oppo A15', 750, 54, 'Available', 3)
  6  INTO ProductDetails VALUES (5, 'M50', 'Camera', 'Canon M50', 800, 12, 'Available', 6)
  7  INTO ProductDetails VALUES (6, 'Xbox', 'Gaming Console', 'Xboxone', 500, 15, 'Available', 4)
  8  INTO ProductDetails VALUES (7, 'PS5', 'Gaming Console', 'Playstation', 500, 22, 'Available', 5)
  9  INTO ProductDetails VALUES (8, 'Airpods Pro', 'Headphone', 'Apple Airpods', 200, 32, 'Available', 2)
 10  INTO ProductDetails VALUES (9, 'Nitro5', 'Laptop', 'Acer Nitro5', 1650, 5, 'Available', 7)
 11  INTO ProductDetails VALUES (10, 'Ipad5', 'Tablet', 'Apple Ipad5', 1200, 12, 'Available', 2)
 12  SELECT * FROM dual;
ERROR:
ORA-01756: quoted string not properly terminated 


SQL> INSERT ALL
  2  INTO ProductDetails VALUES (1, 'Iphone15', 'Smartphone', 'Apple Iphone 15', 1500, 16, 'Available', 2)
  3  INTO ProductDetails VALUES (2, 'TabS4', 'Tablet', 'Samsung Galaxy tab s4', 1000, 12, 'Available', 1)
  4  INTO ProductDetails VALUES (3, 'MacM1', 'Laptop', 'Apple Mac', 2500, 16, 'Available', 2)
  5  INTO ProductDetails VALUES (4, 'A15', 'Smartphone', 'Oppo A15', 750, 54, 'Available', 3)
  6  INTO ProductDetails VALUES (5, 'M50', 'Camera', 'Canon M50', 800, 12, 'Available', 6)
  7  INTO ProductDetails VALUES (6, 'Xbox', 'Gaming Console', 'Xboxone', 500, 15, 'Available', 4)
  8  INTO ProductDetails VALUES (7, 'PS5', 'Gaming Console', 'Playstation', 500, 22, 'Available', 5)
  9  INTO ProductDetails VALUES (8, 'Airpods Pro', 'Headphone', 'Apple Airpods', 200, 32, 'Available', 2)
 10  INTO ProductDetails VALUES (9, 'Nitro5', 'Laptop', 'Acer Nitro5', 1650, 5, 'Available', 7)
 11  INTO ProductDetails VALUES (10, 'Ipad5', 'Tablet', 'Apple Ipad5', 1200, 12, 'Available', 2)
 12  SELECT * FROM dual;

10 rows created.

SQL> SELECT * FROM ProductDetails;

 PRODUCTID PRODUCTNAME                    PRODUCTCATEGORY                       
---------- ------------------------------ ------------------------------        
DESCRIPTION                                                                     
--------------------------------------------------------------------------------
     PRICE STOCKLEVEL AVAILABILITYSTATUS               VENDORID                 
---------- ---------- ------------------------------ ----------                 
         1 Iphone15                       Smartphone                            
Apple Iphone 15                                                                 
      1500         16 Available                               2                 
                                                                                
         2 TabS4                          Tablet                                
Samsung Galaxy tab s4                                                           
      1000         12 Available                               1                 

 PRODUCTID PRODUCTNAME                    PRODUCTCATEGORY                       
---------- ------------------------------ ------------------------------        
DESCRIPTION                                                                     
--------------------------------------------------------------------------------
     PRICE STOCKLEVEL AVAILABILITYSTATUS               VENDORID                 
---------- ---------- ------------------------------ ----------                 
                                                                                
         3 MacM1                          Laptop                                
Apple Mac                                                                       
      2500         16 Available                               2                 
                                                                                
         4 A15                            Smartphone                            
Oppo A15                                                                        

 PRODUCTID PRODUCTNAME                    PRODUCTCATEGORY                       
---------- ------------------------------ ------------------------------        
DESCRIPTION                                                                     
--------------------------------------------------------------------------------
     PRICE STOCKLEVEL AVAILABILITYSTATUS               VENDORID                 
---------- ---------- ------------------------------ ----------                 
       750         54 Available                               3                 
                                                                                
         5 M50                            Camera                                
Canon M50                                                                       
       800         12 Available                               6                 
                                                                                
         6 Xbox                           Gaming Console                        

 PRODUCTID PRODUCTNAME                    PRODUCTCATEGORY                       
---------- ------------------------------ ------------------------------        
DESCRIPTION                                                                     
--------------------------------------------------------------------------------
     PRICE STOCKLEVEL AVAILABILITYSTATUS               VENDORID                 
---------- ---------- ------------------------------ ----------                 
Xboxone                                                                         
       500         15 Available                               4                 
                                                                                
         7 PS5                            Gaming Console                        
Playstation                                                                     
       500         22 Available                               5                 
                                                                                

 PRODUCTID PRODUCTNAME                    PRODUCTCATEGORY                       
---------- ------------------------------ ------------------------------        
DESCRIPTION                                                                     
--------------------------------------------------------------------------------
     PRICE STOCKLEVEL AVAILABILITYSTATUS               VENDORID                 
---------- ---------- ------------------------------ ----------                 
         8 Airpods Pro                    Headphone                             
Apple Airpods                                                                   
       200         32 Available                               2                 
                                                                                
         9 Nitro5                         Laptop                                
Acer Nitro5                                                                     
      1650          5 Available                               7                 

 PRODUCTID PRODUCTNAME                    PRODUCTCATEGORY                       
---------- ------------------------------ ------------------------------        
DESCRIPTION                                                                     
--------------------------------------------------------------------------------
     PRICE STOCKLEVEL AVAILABILITYSTATUS               VENDORID                 
---------- ---------- ------------------------------ ----------                 
                                                                                
        10 Ipad5                          Tablet                                
Apple Ipad5                                                                     
      1200         12 Available                               2                 
                                                                                

10 rows selected.

SQL> COLUMN PRODUCTID FORMAT 999
SQL> COLUMN PRODUCTNAME FORMAT A15
SQL> COLUMN PRODUCTCATEGORY FORMAT A15
SQL> COLUMN DESCRIPTION FORMAT A25
SQL> COLUMN PRICE FORMAT 9999
SQL> COLUMN STOCKLEVEL FORMAT 999
SQL> COLUMN AVAILABILITYSTATUS FORMAT A15
SQL> COLUMN VENDORID FORMAT 999
SQL> SELECT * FROM ProductDetails;

PRODUCTID PRODUCTNAME     PRODUCTCATEGORY DESCRIPTION               PRICE       
--------- --------------- --------------- ------------------------- -----       
STOCKLEVEL AVAILABILITYSTA VENDORID                                             
---------- --------------- --------                                             
        1 Iphone15        Smartphone      Apple Iphone 15            1500       
        16 Available              2                                             
                                                                                
        2 TabS4           Tablet          Samsung Galaxy tab s4      1000       
        12 Available              1                                             
                                                                                
        3 MacM1           Laptop          Apple Mac                  2500       
        16 Available              2                                             
                                                                                

PRODUCTID PRODUCTNAME     PRODUCTCATEGORY DESCRIPTION               PRICE       
--------- --------------- --------------- ------------------------- -----       
STOCKLEVEL AVAILABILITYSTA VENDORID                                             
---------- --------------- --------                                             
        4 A15             Smartphone      Oppo A15                    750       
        54 Available              3                                             
                                                                                
        5 M50             Camera          Canon M50                   800       
        12 Available              6                                             
                                                                                
        6 Xbox            Gaming Console  Xboxone                     500       
        15 Available              4                                             
                                                                                

PRODUCTID PRODUCTNAME     PRODUCTCATEGORY DESCRIPTION               PRICE       
--------- --------------- --------------- ------------------------- -----       
STOCKLEVEL AVAILABILITYSTA VENDORID                                             
---------- --------------- --------                                             
        7 PS5             Gaming Console  Playstation                 500       
        22 Available              5                                             
                                                                                
        8 Airpods Pro     Headphone       Apple Airpods               200       
        32 Available              2                                             
                                                                                
        9 Nitro5          Laptop          Acer Nitro5                1650       
         5 Available              7                                             
                                                                                

PRODUCTID PRODUCTNAME     PRODUCTCATEGORY DESCRIPTION               PRICE       
--------- --------------- --------------- ------------------------- -----       
STOCKLEVEL AVAILABILITYSTA VENDORID                                             
---------- --------------- --------                                             
       10 Ipad5           Tablet          Apple Ipad5                1200       
        12 Available              2                                             
                                                                                

10 rows selected.

SQL> SET LINESIZE 120
SQL> SET PAGESIZE 50
SQL> SELECT * FROM ProductDetails;

PRODUCTID PRODUCTNAME     PRODUCTCATEGORY DESCRIPTION               PRICE STOCKLEVEL AVAILABILITYSTA VENDORID           
--------- --------------- --------------- ------------------------- ----- ---------- --------------- --------           
        1 Iphone15        Smartphone      Apple Iphone 15            1500         16 Available              2           
        2 TabS4           Tablet          Samsung Galaxy tab s4      1000         12 Available              1           
        3 MacM1           Laptop          Apple Mac                  2500         16 Available              2           
        4 A15             Smartphone      Oppo A15                    750         54 Available              3           
        5 M50             Camera          Canon M50                   800         12 Available              6           
        6 Xbox            Gaming Console  Xboxone                     500         15 Available              4           
        7 PS5             Gaming Console  Playstation                 500         22 Available              5           
        8 Airpods Pro     Headphone       Apple Airpods               200         32 Available              2           
        9 Nitro5          Laptop          Acer Nitro5                1650          5 Available              7           
       10 Ipad5           Tablet          Apple Ipad5                1200         12 Available              2           

10 rows selected.

SQL> COMMIT;

Commit complete.

SQL> SPOOL OFF;
SQL> CLEAR SCREEN

SQL> SELECT *
  2  FROM Customer
  3  WHERE CustomerID IN (SELECT DISTINCT CustomerID FROM Staff);
WHERE CustomerID IN (SELECT DISTINCT CustomerID FROM Staff)
                                                     *
ERROR at line 3:
ORA-00942: table or view does not exist 


SQL> SELECT *
  2  FROM Customer
  3  ;

CUSTOMERID CUSTOMERNAME    ADDRESS         CUSTOMERCATEGORYID                                                           
---------- --------------- --------------- ------------------                                                           
         1 Atal            Kathmandu                        1                                                           
         2 Hari            Jhapa                            2                                                           
         3 Ram             Illam                            3                                                           
         4 John            Pokhara                          2                                                           
         5 Sita            Dhangadi                         1                                                           
         6 Shyam           Jumla                            1                                                           
         7 Priya           Nepalgunj                        2                                                           
         8 Laxmi           Dhangadi                         1                                                           
         9 Saksham         Surkhet                          3                                                           
        10 Laxman          Chitwan                          3                                                           

10 rows selected.

SQL> SELECT *
  2  FROM Customer
  3  WHERE CustomerCategoryID = (SELECT CustomerCatID FROM CustomerCat WHERE CustomerCateg = 'Staff');
WHERE CustomerCategoryID = (SELECT CustomerCatID FROM CustomerCat WHERE CustomerCateg = 'Staff')
                                                      *
ERROR at line 3:
ORA-00942: table or view does not exist 


SQL> SELECT * FROM CUSTOMER
  2  WHERE CustomerCategoryID = (SELECT CustomerCatID FROM CustomerCategory WHERE CustomerCategory = 'Staff');
WHERE CustomerCategoryID = (SELECT CustomerCatID FROM CustomerCategory WHERE CustomerCategory = 'Staff')
                                   *
ERROR at line 2:
ORA-00904: "CUSTOMERCATID": invalid identifier 


SQL> SELECT *
  2  FROM Customer
  3  WHERE CustomerCategoryID = (SELECT CustomerCatID FROM CustomerCat WHERE CustomerCateg = 'Staff');
WHERE CustomerCategoryID = (SELECT CustomerCatID FROM CustomerCat WHERE CustomerCateg = 'Staff')
                                                      *
ERROR at line 3:
ORA-00942: table or view does not exist 


SQL> SELECT *
  2  FROM Customer
  3  WHERE CustomerCategoryID = (SELECT CustomerCatID FROM CustomerCategory WHERE CustomerCategory = 'Staff');
WHERE CustomerCategoryID = (SELECT CustomerCatID FROM CustomerCategory WHERE CustomerCategory = 'Staff')
                                   *
ERROR at line 3:
ORA-00904: "CUSTOMERCATID": invalid identifier 


SQL> SELECT *
  2  FROM Customer
  3  WHERE CustomerCategoryID = (SELECT CustomerCategoryID FROM CustomerCategory WHERE CustomerCategory = 'Staff');

CUSTOMERID CUSTOMERNAME    ADDRESS         CUSTOMERCATEGORYID                                                           
---------- --------------- --------------- ------------------                                                           
         2 Hari            Jhapa                            2                                                           
         4 John            Pokhara                          2                                                           
         7 Priya           Nepalgunj                        2                                                           

SQL> SELECT *
  2  FROM Orders
  3  WHERE OrderID IN (
  4  SELECT OrderID
  5  FROM OrderDetails
  6  WHERE ProductID = (SELECT ProductID FROM ProductDetails WHERE ProductName = 'A15')
  7  AND OrderDate BETWEEN TO_DATE('01-05-2023', 'DD-MM-YYYY') AND TO_DATE('28-05-2023', 'DD-MM-YYYY'));
WHERE ProductID = (SELECT ProductID FROM ProductDetails WHERE ProductName = 'A15')
      *
ERROR at line 6:
ORA-00904: "PRODUCTID": invalid identifier 


SQL> SELECT *
  2  FROM Orders
  3  WHERE OrderID IN (
  4      SELECT OrderID
  5      FROM OrderDetails
  6      WHERE ProductID = (SELECT ProductID FROM ProductDetails WHERE ProductName = 'A15')
  7      AND OrderDate BETWEEN TO_DATE('01-05-2023', 'DD-MM-YYYY') AND TO_DATE('28-05-2023', 'DD-MM-YYYY')
  8  );
    WHERE ProductID = (SELECT ProductID FROM ProductDetails WHERE ProductName = 'A15')
          *
ERROR at line 6:
ORA-00904: "PRODUCTID": invalid identifier 


SQL> desc productdetails;
 Name                                                              Null?    Type
 ----------------------------------------------------------------- -------- --------------------------------------------
 PRODUCTID                                                         NOT NULL NUMBER(38)
 PRODUCTNAME                                                       NOT NULL VARCHAR2(30)
 PRODUCTCATEGORY                                                   NOT NULL VARCHAR2(30)
 DESCRIPTION                                                       NOT NULL VARCHAR2(100)
 PRICE                                                             NOT NULL NUMBER(38)
 STOCKLEVEL                                                        NOT NULL NUMBER(38)
 AVAILABILITYSTATUS                                                NOT NULL VARCHAR2(30)
 VENDORID                                                          NOT NULL NUMBER(38)

SQL> SELECT *
  2  FROM Orders
  3  WHERE OrderID IN (
  4      SELECT OrderID
  5      FROM OrderDetails
  6      WHERE ProductID = (SELECT ProductID FROM ProductDetails WHERE ProductName = 'A15')
  7      AND OrderDate BETWEEN TO_DATE('01-05-2023', 'DD-MM-YYYY') AND TO_DATE('28-05-2023', 'DD-MM-YYYY')
  8  );
    WHERE ProductID = (SELECT ProductID FROM ProductDetails WHERE ProductName = 'A15')
          *
ERROR at line 6:
ORA-00904: "PRODUCTID": invalid identifier 


SQL> SELECT *
  2  FROM Orders
  3  WHERE OrderID on (
  4  ;
WHERE OrderID on (
              *
ERROR at line 3:
ORA-00920: invalid relational operator 


SQL> SELECT *
  2  FROM Orders
  3  WHERE OrderID in (
  4  SELECT OrderID
  5  FROM OrderDetails
  6  WHERE ProductID = (SELECT ProductID FROM ProductDetails WHERE ProductName = 'A15') AND
  7  OrderDate BETWEEN TO_DATE('01-05-2023') AND TO_DATE('38-05-2023'));
WHERE ProductID = (SELECT ProductID FROM ProductDetails WHERE ProductName = 'A15') AND
      *
ERROR at line 6:
ORA-00904: "PRODUCTID": invalid identifier 


SQL> Select * from productdetails;

PRODUCTID PRODUCTNAME     PRODUCTCATEGORY DESCRIPTION               PRICE STOCKLEVEL AVAILABILITYSTA VENDORID           
--------- --------------- --------------- ------------------------- ----- ---------- --------------- --------           
        1 Iphone15        Smartphone      Apple Iphone 15            1500         16 Available              2           
        2 TabS4           Tablet          Samsung Galaxy tab s4      1000         12 Available              1           
        3 MacM1           Laptop          Apple Mac                  2500         16 Available              2           
        4 A15             Smartphone      Oppo A15                    750         54 Available              3           
        5 M50             Camera          Canon M50                   800         12 Available              6           
        6 Xbox            Gaming Console  Xboxone                     500         15 Available              4           
        7 PS5             Gaming Console  Playstation                 500         22 Available              5           
        8 Airpods Pro     Headphone       Apple Airpods               200         32 Available              2           
        9 Nitro5          Laptop          Acer Nitro5                1650          5 Available              7           
       10 Ipad5           Tablet          Apple Ipad5                1200         12 Available              2           

10 rows selected.

SQL> SELECT *
  2  FROM Orders
  3  WHERE OrderID in (
  4  SELECT OrderID
  5  FROM OrderDetails
  6  WHERE PRODUCTID = (SELECT PRODUCT FROM ProductDetails WHERE ProductName = 'A15') AND
  7  OrderDate BETWEEN TO_DATE('01-05-2023') AND TO_DATE('38-05-2023'));
WHERE PRODUCTID = (SELECT PRODUCT FROM ProductDetails WHERE ProductName = 'A15') AND
      *
ERROR at line 6:
ORA-00904: "PRODUCTID": invalid identifier 


SQL> SELECCT *
SP2-0042: unknown command "SELECCT *" - rest of line ignored.
SQL> FROM Orders where OrderID;
SP2-0734: unknown command beginning "FROM Order..." - rest of line ignored.
SQL> SELECT *
  2  FROM Orders O
  3  WHERE O.OrderID IN (
  4      SELECT OD.OrderID
  5      FROM OrderDetails OD
  6      WHERE OD.ProductID = (SELECT PD.ProductID FROM ProductDetails PD WHERE PD.ProductName = 'A15')
  7      AND OD.OrderDate BETWEEN TO_DATE('01-05-2023', 'DD-MM-YYYY') AND TO_DATE('28-05-2023', 'DD-MM-YYYY')
  8  );
    WHERE OD.ProductID = (SELECT PD.ProductID FROM ProductDetails PD WHERE PD.ProductName = 'A15')
          *
ERROR at line 6:
ORA-00904: "OD"."PRODUCTID": invalid identifier 


SQL> SELECT *
  2  FROM Orders o
  3  WHERE (o.OrderID, o.CustomerID) IN (
  4          SELECT od.OrderID, od.CustomerID
  5          FROM OrderDetails od
  6          JOIN ProductDetails pd ON od.ProductID = pd.ProductID
  7          WHERE pd.ProductName = 'A15'
  8            AND od.OrderDate BETWEEN TO_DATE('01-05-2023', 'DD-MM-YYYY') AND TO_DATE('28-05-2023', 'DD-MM-YYYY')
  9        );
        JOIN ProductDetails pd ON od.ProductID = pd.ProductID
                                  *
ERROR at line 6:
ORA-00904: "OD"."PRODUCTID": invalid identifier 


SQL> SELECT *
  2  FROM Orders o
  3  WHERE (o.OrderID, o.CustomerID) IN (
  4          SELECT od.OrderID, od.CustomerID
  5          FROM OrderDetails od
  6          JOIN ProductDetails pd ON od.ProductID = pd.ProductID
  7          WHERE pd.ProductName = 'A15'
  8            AND od.OrderDate BETWEEN TO_DATE('01-05-2023', 'DD-MM-YYYY') AND TO_DATE('28-05-2023', 'DD-MM-YYYY')
  9        );
        JOIN ProductDetails pd ON od.ProductID = pd.ProductID
                                  *
ERROR at line 6:
ORA-00904: "OD"."PRODUCTID": invalid identifier 


SQL> SELECT C.*, O.*, OD.*
  2  FROM Customer C
  3  LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
  4  LEFT JOIN OrderDetails OD ON O.OrderID = OD.OrderID;

CUSTOMERID CUSTOMERNAME    ADDRESS         CUSTOMERCATEGORYID    ORDERID CUSTOMERID    ORDERID ORDERDATE                
---------- --------------- --------------- ------------------ ---------- ---------- ---------- ---------                
TOTALORDERAMOUNT INVOICEID DELIVERYSTATUS                                                                               
---------------- --------- ------------------------------                                                               
         1 Atal            Kathmandu                        1          1          1          1 01-MAY-23                
            3000         1 Delivered                                                                                    
                                                                                                                        
         4 John            Pokhara                          2          2          4          2 12-MAY-23                
            2000         2 Delivered                                                                                    
                                                                                                                        
         5 Sita            Dhangadi                         1          3          5          3 24-MAY-23                
            5000         3 Delivered                                                                                    
                                                                                                                        
         3 Ram             Illam                            3          4          3          4 05-JUN-23                
            2000         4 Delivered                                                                                    
                                                                                                                        
         3 Ram             Illam                            3          5          3          5 15-JUN-23                
            3000         5 Delivered                                                                                    
                                                                                                                        
         6 Shyam           Jumla                            1          6          6          6 17-JUN-23                
            2500         6 Delivered                                                                                    
                                                                                                                        
         7 Priya           Nepalgunj                        2          7          7          7 02-AUG-23                
            1000         7 Delivered                                                                                    
                                                                                                                        
         9 Saksham         Surkhet                          3                                                           
                                                                                                                        
                                                                                                                        
        10 Laxman          Chitwan                          3                                                           
                                                                                                                        
                                                                                                                        
         2 Hari            Jhapa                            2                                                           
                                                                                                                        
                                                                                                                        
         8 Laxmi           Dhangadi                         1                                                           
                                                                                                                        
                                                                                                                        

11 rows selected.

SQL> COLUMN CUSTOMERID FORMAT 99999
SQL> COLUMN CUSTOMERNAME FORMAT A15
SQL> COLUMN ADDRESS FORMAT A15
SQL> COLUMN CUSTOMERCATEGORYID FORMAT 99999
SQL> COLUMN ORDERID FORMAT 99999
SQL> COLUMN CUSTOMERID_1 FORMAT 99999
SQL> COLUMN ORDERID_1 FORMAT 99999
SQL> COLUMN ORDERDATE FORMAT A10
SQL> COLUMN TOTALORDERAMOUNT FORMAT 99999
SQL> COLUMN INVOICEID FORMAT 99999
SQL> COLUMN DELIVERYSTATUS FORMAT A15
SQL> SELECT C.*, O.*, OD.*
  2  FROM Customer C
  3  LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
  4  LEFT JOIN OrderDetails OD ON O.OrderID = OD.OrderID;

CUSTOMERID CUSTOMERNAME    ADDRESS         CUSTOMERCATEGORYID ORDERID CUSTOMERID ORDERID ORDERDATE  TOTALORDERAMOUNT    
---------- --------------- --------------- ------------------ ------- ---------- ------- ---------- ----------------    
INVOICEID DELIVERYSTATUS                                                                                                
--------- ---------------                                                                                               
         1 Atal            Kathmandu                        1       1          1       1 01-MAY-23              3000    
        1 Delivered                                                                                                     
                                                                                                                        
         4 John            Pokhara                          2       2          4       2 12-MAY-23              2000    
        2 Delivered                                                                                                     
                                                                                                                        
         5 Sita            Dhangadi                         1       3          5       3 24-MAY-23              5000    
        3 Delivered                                                                                                     
                                                                                                                        
         3 Ram             Illam                            3       4          3       4 05-JUN-23              2000    
        4 Delivered                                                                                                     
                                                                                                                        
         3 Ram             Illam                            3       5          3       5 15-JUN-23              3000    
        5 Delivered                                                                                                     
                                                                                                                        
         6 Shyam           Jumla                            1       6          6       6 17-JUN-23              2500    
        6 Delivered                                                                                                     
                                                                                                                        
         7 Priya           Nepalgunj                        2       7          7       7 02-AUG-23              1000    
        7 Delivered                                                                                                     
                                                                                                                        
         9 Saksham         Surkhet                          3                                                           
                                                                                                                        
                                                                                                                        
        10 Laxman          Chitwan                          3                                                           
                                                                                                                        
                                                                                                                        
         2 Hari            Jhapa                            2                                                           
                                                                                                                        
                                                                                                                        
         8 Laxmi           Dhangadi                         1                                                           
                                                                                                                        
                                                                                                                        

11 rows selected.

SQL> COLUMN CUSTOMERID FORMAT 99999
SQL> COLUMN CUSTOMERNAME FORMAT A15
SQL> COLUMN ADDRESS FORMAT A15
SQL> COLUMN CUSTOMERCATEGORYID FORMAT 99999
SQL> COLUMN ORDERID FORMAT 99999
SQL> COLUMN CUSTOMERID_1 FORMAT 99999
SQL> COLUMN ORDERID_1 FORMAT 99999
SQL> COLUMN ORDERDATE FORMAT A10
SQL> COLUMN TOTALORDERAMOUNT FORMAT 99999
SQL> COLUMN INVOICEID FORMAT 99999
SQL> COLUMN DELIVERYSTATUS FORMAT A15
SQL> SELECT C.*, O.*, OD.*
  2  FROM Customer C
  3  LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
  4  LEFT JOIN OrderDetails OD ON O.OrderID = OD.OrderID;

CUSTOMERID CUSTOMERNAME    ADDRESS         CUSTOMERCATEGORYID ORDERID CUSTOMERID ORDERID ORDERDATE  TOTALORDERAMOUNT    
---------- --------------- --------------- ------------------ ------- ---------- ------- ---------- ----------------    
INVOICEID DELIVERYSTATUS                                                                                                
--------- ---------------                                                                                               
         1 Atal            Kathmandu                        1       1          1       1 01-MAY-23              3000    
        1 Delivered                                                                                                     
                                                                                                                        
         4 John            Pokhara                          2       2          4       2 12-MAY-23              2000    
        2 Delivered                                                                                                     
                                                                                                                        
         5 Sita            Dhangadi                         1       3          5       3 24-MAY-23              5000    
        3 Delivered                                                                                                     
                                                                                                                        
         3 Ram             Illam                            3       4          3       4 05-JUN-23              2000    
        4 Delivered                                                                                                     
                                                                                                                        
         3 Ram             Illam                            3       5          3       5 15-JUN-23              3000    
        5 Delivered                                                                                                     
                                                                                                                        
         6 Shyam           Jumla                            1       6          6       6 17-JUN-23              2500    
        6 Delivered                                                                                                     
                                                                                                                        
         7 Priya           Nepalgunj                        2       7          7       7 02-AUG-23              1000    
        7 Delivered                                                                                                     
                                                                                                                        
         9 Saksham         Surkhet                          3                                                           
                                                                                                                        
                                                                                                                        
        10 Laxman          Chitwan                          3                                                           
                                                                                                                        
                                                                                                                        
         2 Hari            Jhapa                            2                                                           
                                                                                                                        
                                                                                                                        
         8 Laxmi           Dhangadi                         1                                                           
                                                                                                                        
                                                                                                                        

11 rows selected.

SQL> SELECT
  2    C.CUSTOMERID, C.CUSTOMERNAME, C.ADDRESS, C.CUSTOMERCATEGORYID,
  3    O.ORDERID, O.CUSTOMERID AS CUSTOMERID_1, OD.ORDERID AS ORDERID_1, TO_CHAR(OD.ORDERDATE, 'DD-MON-YY') AS ORDERDATE,
  4    OD.TOTALORDERAMOUNT, OD.INVOICEID, OD.DELIVERYSTATUS
  5  FROM
  6    CUSTOMER C
  7    JOIN ORDERS O ON C.CUSTOMERID = O.CUSTOMERID
  8    JOIN ORDERDETAILS OD ON O.ORDERID = OD.ORDERID;

CUSTOMERID CUSTOMERNAME    ADDRESS         CUSTOMERCATEGORYID ORDERID CUSTOMERID_1 ORDERID_1 ORDERDATE  TOTALORDERAMOUNT
---------- --------------- --------------- ------------------ ------- ------------ --------- ---------- ----------------
INVOICEID DELIVERYSTATUS                                                                                                
--------- ---------------                                                                                               
         1 Atal            Kathmandu                        1       1            1         1 01-MAY-23              3000
        1 Delivered                                                                                                     
                                                                                                                        
         3 Ram             Illam                            3       5            3         5 15-JUN-23              3000
        5 Delivered                                                                                                     
                                                                                                                        
         3 Ram             Illam                            3       4            3         4 05-JUN-23              2000
        4 Delivered                                                                                                     
                                                                                                                        
         4 John            Pokhara                          2       2            4         2 12-MAY-23              2000
        2 Delivered                                                                                                     
                                                                                                                        
         5 Sita            Dhangadi                         1       3            5         3 24-MAY-23              5000
        3 Delivered                                                                                                     
                                                                                                                        
         6 Shyam           Jumla                            1       6            6         6 17-JUN-23              2500
        6 Delivered                                                                                                     
                                                                                                                        
         7 Priya           Nepalgunj                        2       7            7         7 02-AUG-23              1000
        7 Delivered                                                                                                     
                                                                                                                        

7 rows selected.

SQL> SET PAGESIZE 100
SQL> SELECT
  2    C.CUSTOMERID, C.CUSTOMERNAME, C.ADDRESS, C.CUSTOMERCATEGORYID,
  3    O.ORDERID, O.CUSTOMERID AS CUSTOMERID_1, OD.ORDERID AS ORDERID_1, TO_CHAR(OD.ORDERDATE, 'DD-MON-YY') AS ORDERDATE,
  4    OD.TOTALORDERAMOUNT, OD.INVOICEID, OD.DELIVERYSTATUS
  5  FROM
  6    CUSTOMER C
  7    JOIN ORDERS O ON C.CUSTOMERID = O.CUSTOMERID
  8    JOIN ORDERDETAILS OD ON O.ORDERID = OD.ORDERID;

CUSTOMERID CUSTOMERNAME    ADDRESS         CUSTOMERCATEGORYID ORDERID CUSTOMERID_1 ORDERID_1 ORDERDATE  TOTALORDERAMOUNT
---------- --------------- --------------- ------------------ ------- ------------ --------- ---------- ----------------
INVOICEID DELIVERYSTATUS                                                                                                
--------- ---------------                                                                                               
         1 Atal            Kathmandu                        1       1            1         1 01-MAY-23              3000
        1 Delivered                                                                                                     
                                                                                                                        
         3 Ram             Illam                            3       5            3         5 15-JUN-23              3000
        5 Delivered                                                                                                     
                                                                                                                        
         3 Ram             Illam                            3       4            3         4 05-JUN-23              2000
        4 Delivered                                                                                                     
                                                                                                                        
         4 John            Pokhara                          2       2            4         2 12-MAY-23              2000
        2 Delivered                                                                                                     
                                                                                                                        
         5 Sita            Dhangadi                         1       3            5         3 24-MAY-23              5000
        3 Delivered                                                                                                     
                                                                                                                        
         6 Shyam           Jumla                            1       6            6         6 17-JUN-23              2500
        6 Delivered                                                                                                     
                                                                                                                        
         7 Priya           Nepalgunj                        2       7            7         7 02-AUG-23              1000
        7 Delivered                                                                                                     
                                                                                                                        

7 rows selected.

SQL> SET PAGESIZE 100
SQL> 
SQL> COLUMN CUSTOMERID FORMAT 99999
SQL> COLUMN CUSTOMERNAME FORMAT A15
SQL> COLUMN ADDRESS FORMAT A15
SQL> COLUMN CUSTOMERCATEGORYID FORMAT 99999
SQL> COLUMN ORDERID FORMAT 99999
SQL> COLUMN CUSTOMERID_1 FORMAT 99999
SQL> COLUMN ORDERID_1 FORMAT 99999
SQL> COLUMN ORDERDATE FORMAT A10
SQL> COLUMN TOTALORDERAMOUNT FORMAT 99999
SQL> COLUMN INVOICEID FORMAT 99999
SQL> COLUMN DELIVERYSTATUS FORMAT A15
SQL> 
SQL> SELECT
  2    C.CUSTOMERID, C.CUSTOMERNAME, C.ADDRESS, C.CUSTOMERCATEGORYID,
  3    O.ORDERID, O.CUSTOMERID AS CUSTOMERID_1, OD.ORDERID AS ORDERID_1, TO_CHAR(OD.ORDERDATE, 'DD-MON-YY') AS ORDERDATE,
  4    OD.TOTALORDERAMOUNT, OD.INVOICEID, OD.DELIVERYSTATUS
  5  FROM
  6    CUSTOMER C
  7    JOIN ORDERS O ON C.CUSTOMERID = O.CUSTOMERID
  8    JOIN ORDERDETAILS OD ON O.ORDERID = OD.ORDERID;

CUSTOMERID CUSTOMERNAME    ADDRESS         CUSTOMERCATEGORYID ORDERID CUSTOMERID_1 ORDERID_1 ORDERDATE  TOTALORDERAMOUNT
---------- --------------- --------------- ------------------ ------- ------------ --------- ---------- ----------------
INVOICEID DELIVERYSTATUS                                                                                                
--------- ---------------                                                                                               
         1 Atal            Kathmandu                        1       1            1         1 01-MAY-23              3000
        1 Delivered                                                                                                     
                                                                                                                        
         3 Ram             Illam                            3       5            3         5 15-JUN-23              3000
        5 Delivered                                                                                                     
                                                                                                                        
         3 Ram             Illam                            3       4            3         4 05-JUN-23              2000
        4 Delivered                                                                                                     
                                                                                                                        
         4 John            Pokhara                          2       2            4         2 12-MAY-23              2000
        2 Delivered                                                                                                     
                                                                                                                        
         5 Sita            Dhangadi                         1       3            5         3 24-MAY-23              5000
        3 Delivered                                                                                                     
                                                                                                                        
         6 Shyam           Jumla                            1       6            6         6 17-JUN-23              2500
        6 Delivered                                                                                                     
                                                                                                                        
         7 Priya           Nepalgunj                        2       7            7         7 02-AUG-23              1000
        7 Delivered                                                                                                     
                                                                                                                        

7 rows selected.

SQL> SET PAGESIZE 0
SQL> SET LINESIZE 200
SQL> SET TERMOUT OFF
SQL> SET TRIMOUT ON
SQL> SET TRIMSPOOL ON
SQL> SELECT
  2    C.CUSTOMERID, C.CUSTOMERNAME, C.ADDRESS, C.CUSTOMERCATEGORYID,
  3    O.ORDERID, O.CUSTOMERID AS CUSTOMERID_1, OD.ORDERID AS ORDERID_1, TO_CHAR(OD.ORDERDATE, 'DD-MON-YY') AS ORDERDATE,
  4    OD.TOTALORDERAMOUNT, OD.INVOICEID, OD.DELIVERYSTATUS
  5  FROM
  6    CUSTOMER C
  7    JOIN ORDERS O ON C.CUSTOMERID = O.CUSTOMERID
  8    JOIN ORDERDETAILS OD ON O.ORDERID = OD.ORDERID;
         1 Atal            Kathmandu                        1       1            1         1 01-MAY-23              3000         1 Delivered
         3 Ram             Illam                            3       5            3         5 15-JUN-23              3000         5 Delivered
         3 Ram             Illam                            3       4            3         4 05-JUN-23              2000         4 Delivered
         4 John            Pokhara                          2       2            4         2 12-MAY-23              2000         2 Delivered
         5 Sita            Dhangadi                         1       3            5         3 24-MAY-23              5000         3 Delivered
         6 Shyam           Jumla                            1       6            6         6 17-JUN-23              2500         6 Delivered
         7 Priya           Nepalgunj                        2       7            7         7 02-AUG-23              1000         7 Delivered

7 rows selected.

SQL> SET PAGESIZE 0
SQL> SET LINESIZE 200
SQL> SET TERMOUT OFF
SQL> SET TRIMOUT ON
SQL> SET TRIMSPOOL ON
SQL> SET HEADING ON
SQL> SELECT
  2    C.CUSTOMERID, C.CUSTOMERNAME, C.ADDRESS, C.CUSTOMERCATEGORYID,
  3    O.ORDERID, O.CUSTOMERID AS CUSTOMERID_1, OD.ORDERID AS ORDERID_1, TO_CHAR(OD.ORDERDATE, 'DD-MON-YY') AS ORDERDATE,
  4    OD.TOTALORDERAMOUNT, OD.INVOICEID, OD.DELIVERYSTATUS
  5  FROM
  6    CUSTOMER C
  7    JOIN ORDERS O ON C.CUSTOMERID = O.CUSTOMERID
  8    JOIN ORDERDETAILS OD ON O.ORDERID = OD.ORDERID;
         1 Atal            Kathmandu                        1       1            1         1 01-MAY-23              3000         1 Delivered
         3 Ram             Illam                            3       5            3         5 15-JUN-23              3000         5 Delivered
         3 Ram             Illam                            3       4            3         4 05-JUN-23              2000         4 Delivered
         4 John            Pokhara                          2       2            4         2 12-MAY-23              2000         2 Delivered
         5 Sita            Dhangadi                         1       3            5         3 24-MAY-23              5000         3 Delivered
         6 Shyam           Jumla                            1       6            6         6 17-JUN-23              2500         6 Delivered
         7 Priya           Nepalgunj                        2       7            7         7 02-AUG-23              1000         7 Delivered

7 rows selected.

SQL> SET PAGESIZE 0
SQL> SET LINESIZE 200
SQL> SET TERMOUT OFF
SQL> SET TRIMOUT ON
SQL> SET TRIMSPOOL ON
SQL> SET TRIMSPOOL Oerg 34rtg3q45t ;
SP2-0265: trimspool must be set ON or OFF
SQL> SET PAGESIZE 0
SQL> SET LINESIZE 200
SQL> SET TERMOUT OFF
SQL> SET TRIMOUT ON
SQL> SET TRIMSPOOL ON
SQL> SET HEADING ON
SQL> Select * from orders;
      1          1
      2          4
      3          5
      4          3
      5          3
      6          6
      7          7

7 rows selected.

SQL> SET HEAD ON
SQL> Select * from orders;
      1          1
      2          4
      3          5
      4          3
      5          3
      6          6
      7          7

7 rows selected.

SQL> SPOOL OFF;
SQL> SELECT *
  2  FROM Customer
  3  WHERE CustomerCategoryID = (SELECT CustomerCategoryID FROM CustomerCategory WHERE CustomerCategory = 'Staff');

CUSTOMERID CUSTOMERNAME                                                         
---------- ------------------------------                                       
ADDRESS                                            CUSTOMERCATEGORYID           
-------------------------------------------------- ------------------           
         2 Hari                                                                 
Jhapa                                                               2           
                                                                                
         4 John                                                                 
Pokhara                                                             2           
                                                                                
         7 Priya                                                                
Nepalgunj                                                           2           
                                                                                

SQL> SET LINESIZE 1500
SQL> SELECT *
  2  FROM Customer
  3  WHERE CustomerCategoryID = (SELECT CustomerCategoryID FROM CustomerCategory WHERE CustomerCategory = 'Staff');

CUSTOMERID CUSTOMERNAME                   ADDRESS                                            CUSTOMERCATEGORYID                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
---------- ------------------------------ -------------------------------------------------- ------------------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
         2 Hari                           Jhapa                                                               2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
         4 John                           Pokhara                                                             2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
         7 Priya                          Nepalgunj                                                           2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             

SQL> SELECT OrderDetails.*
  2  FROM OrderDetails
  3  JOIN PurchasedProduct ON OrderDetails.OrderID = PurchasedProduct.OrderID
  4  JOIN ProductDetails ON PurchasedProduct.ProductID = ProductDetails.ProductID
  5  WHERE OrderDetails.OrderDate BETWEEN TO_DATE('2023-05-01', 'YYYY-MM-DD') AND TO_DATE('2023-05-28', 'YYYY-MM-DD')
  6  AND ProductDetails.ProductName = 'A15';

   ORDERID ORDERDATE TOTALORDERAMOUNT  INVOICEID DELIVERYSTATUS                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
---------- --------- ---------------- ---------- ------------------------------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
         2 12-MAY-23             2000          2 Delivered                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  

SQL> SELECT Customer.*, Orders.*, OrderDetails.*
  2  FROM Customer
  3  LEFT JOIN Orders ON Customer.CustomerID = Orders.CustomerID
  4  LEFT JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
  5  ORDER BY Customer.CustomerID;

CUSTOMERID CUSTOMERNAME                   ADDRESS                                            CUSTOMERCATEGORYID    ORDERID CUSTOMERID    ORDERID ORDERDATE TOTALORDERAMOUNT  INVOICEID DELIVERYSTATUS                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
---------- ------------------------------ -------------------------------------------------- ------------------ ---------- ---------- ---------- --------- ---------------- ---------- ------------------------------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
         1 Atal                           Kathmandu                                                           1          1          1          1 01-MAY-23             3000          1 Delivered                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
         2 Hari                           Jhapa                                                               2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
         3 Ram                            Illam                                                               3          4          3          4 05-JUN-23             2000          4 Delivered                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
         3 Ram                            Illam                                                               3          5          3          5 15-JUN-23             3000          5 Delivered                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
         4 John                           Pokhara                                                             2          2          4          2 12-MAY-23             2000          2 Delivered                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
         5 Sita                           Dhangadi                                                            1          3          5          3 24-MAY-23             5000          3 Delivered                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
         6 Shyam                          Jumla                                                               1          6          6          6 17-JUN-23             2500          6 Delivered                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
         7 Priya                          Nepalgunj                                                           2          7          7          7 02-AUG-23             1000          7 Delivered                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
         8 Laxmi                          Dhangadi                                                            1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
         9 Saksham                        Surkhet                                                             3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
        10 Laxman                         Chitwan                                                             3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             

11 rows selected.

SQL> SELECT *
  2  FROM ProductDetails
  3  WHERE SUBSTR(ProductName, 2, 1) = 'a' AND StockLevel > 50;

 PRODUCTID PRODUCTNAME                    PRODUCTCATEGORY                DESCRIPTION                                                                                               PRICE STOCKLEVEL AVAILABILITYSTATUS               VENDORID                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
---------- ------------------------------ ------------------------------ ---------------------------------------------------------------------------------------------------- ---------- ---------- ------------------------------ ----------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
         2 TabS4                          Tablet                         Samsung Galaxy tab s4                                                                                      1000         60 Available                               1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               

SQL> SELECT *
  2  FROM Customer
  3  JOIN Orders ON Customer.CustomerID = Orders.CustomerID
  4   JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
  5   WHERE OrderDetails.OrderDate >= (SELECT MAX(OrderDate) FROM OrderDetails);

CUSTOMERID CUSTOMERNAME                   ADDRESS                                            CUSTOMERCATEGORYID    ORDERID CUSTOMERID    ORDERID ORDERDATE TOTALORDERAMOUNT  INVOICEID DELIVERYSTATUS                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
---------- ------------------------------ -------------------------------------------------- ------------------ ---------- ---------- ---------- --------- ---------------- ---------- ------------------------------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
         7 Priya                          Nepalgunj                                                           2          7          7          7 02-AUG-23             1000          7 Delivered                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            

SQL> SET LINESIZE 3000
SQL> SELECT *
  2  FROM Customer
  3  JOIN Orders ON Customer.CustomerID = Orders.CustomerID
  4   JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
  5   WHERE OrderDetails.OrderDate >= (SELECT MAX(OrderDate) FROM OrderDetails);

CUSTOMERID CUSTOMERNAME                   ADDRESS                                            CUSTOMERCATEGORYID    ORDERID CUSTOMERID    ORDERID ORDERDATE TOTALORDERAMOUNT  INVOICEID DELIVERYSTATUS                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
---------- ------------------------------ -------------------------------------------------- ------------------ ---------- ---------- ---------- --------- ---------------- ---------- ------------------------------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
         7 Priya                          Nepalgunj                                                           2          7          7          7 02-AUG-23             1000          7 Delivered                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        

SQL> SELECT TO_CHAR(OrderDate, 'MM-YYYY') AS Month, SUM(TotalOrderAmount) AS TotalRevenue
  2  FROM OrderDetails
  3  GROUP BY TO_CHAR(OrderDate, 'MM-YYYY')
  4  ORDER BY TO_CHAR(OrderDate, 'MM-YYYY');

MONTH   TOTALREVENUE                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
------- ------------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
05-2023        10000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
06-2023         7500                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
08-2023         1000                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    

SQL> SELECT *
  2  FROM OrderDetails
  3  WHERE TotalOrderAmount >= (SELECT AVG(TotalOrderAmount) FROM OrderDetails);

   ORDERID ORDERDATE TOTALORDERAMOUNT  INVOICEID DELIVERYSTATUS                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
---------- --------- ---------------- ---------- ------------------------------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
         1 01-MAY-23             3000          1 Delivered                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
         3 24-MAY-23             5000          3 Delivered                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
         5 15-JUN-23             3000          5 Delivered                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              

SQL> SELECT Vendor.*, COUNT(ProductDetails.ProductID) AS TotalProductsSupplied
  2  FROM Vendor
  3  JOIN ProductDetails ON Vendor.VendorID = ProductDetails.VendorID
  4  GROUP BY Vendor.VendorID, Vendor.Vendor, Vendor.VendorContact
  5  HAVING COUNT(ProductDetails.ProductID) > 3;

  VENDORID VENDOR                         VENDORCONTACT                  TOTALPRODUCTSSUPPLIED                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
---------- ------------------------------ ------------------------------ ---------------------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
         2 Apple                          Apple @gmail.com                                   4                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          

SQL> SELECT *
  2  FROM (
  3      SELECT
  4          ProductDetails.ProductID,
  5          ProductDetails.ProductName,
  6          ProductDetails.ProductCategory,
  7          ProductDetails.Description,
  8          ProductDetails.Price,
  9          ProductDetails.StockLevel,
 10          ProductDetails.AvailabilityStatus,
 11          ProductDetails.VendorID,
 12          COUNT(PurchasedProduct.OrderID) AS OrderCount
 13      FROM
 14          PurchasedProduct
 15      JOIN
 16          ProductDetails ON PurchasedProduct.ProductID = ProductDetails.ProductID
 17      GROUP BY
 18          ProductDetails.ProductID, ProductDetails.ProductName, ProductDetails.ProductCategory, ProductDetails.Description, ProductDetails.Price, ProductDetails.StockLevel, ProductDetails.AvailabilityStatus, ProductDetails.VendorID
 19      ORDER BY
 20          OrderCount DESC
 21  )
 22  WHERE ROWNUM <= 3;

 PRODUCTID PRODUCTNAME                    PRODUCTCATEGORY                DESCRIPTION                                                                                               PRICE STOCKLEVEL AVAILABILITYSTATUS               VENDORID ORDERCOUNT                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
---------- ------------------------------ ------------------------------ ---------------------------------------------------------------------------------------------------- ---------- ---------- ------------------------------ ---------- ----------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
         2 TabS4                          Tablet                         Samsung Galaxy tab s4                                                                                      1000         60 Available                               1          2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
         7 PS5                            Gaming Console                 Playstation                                                                                                 500         22 Available                               5          2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
         4 A15                            Smartphone                     Oppo A15                                                                                                    750         54 Available                               3          2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                

SQL> dwedwdawd;
SP2-0042: unknown command "dwedwdawd" - rest of line ignored.
SQL> awdawd;
SP2-0042: unknown command "awdawd" - rest of line ignored.
SQL> 
SQL> 
SQL> SELECT *
  2  FROM (
  3      SELECT
  4          ProductDetails.ProductID,
  5          ProductDetails.ProductName,
  6          ProductDetails.ProductCategory,
  7          ProductDetails.Description,
  8          ProductDetails.Price,
  9          ProductDetails.StockLevel,
 10          ProductDetails.AvailabilityStatus,
 11          ProductDetails.VendorID,
 12          COUNT(PurchasedProduct.OrderID) AS OrderCount
 13      FROM
 14          PurchasedProduct
 15      JOIN
 16          ProductDetails ON PurchasedProduct.ProductID = ProductDetails.ProductID
 17      GROUP BY
 18          ProductDetails.ProductID, ProductDetails.ProductName, ProductDetails.ProductCategory, ProductDetails.Description, ProductDetails.Price, ProductDetails.StockLevel, ProductDetails.AvailabilityStatus, ProductDetails.VendorID
 19      ORDER BY
 20          OrderCount DESC
 21  )
 22  WHERE ROWNUM <= 3;

 PRODUCTID PRODUCTNAME                    PRODUCTCATEGORY                DESCRIPTION                                                                                               PRICE STOCKLEVEL AVAILABILITYSTATUS               VENDORID ORDERCOUNT                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
---------- ------------------------------ ------------------------------ ---------------------------------------------------------------------------------------------------- ---------- ---------- ------------------------------ ---------- ----------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
         2 TabS4                          Tablet                         Samsung Galaxy tab s4                                                                                      1000         60 Available                               1          2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
         7 PS5                            Gaming Console                 Playstation                                                                                                 500         22 Available                               5          2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
         4 A15                            Smartphone                     Oppo A15                                                                                                    750         54 Available                               3          2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                

SQL> ;
  1  SELECT *
  2  FROM (
  3      SELECT
  4          ProductDetails.ProductID,
  5          ProductDetails.ProductName,
  6          ProductDetails.ProductCategory,
  7          ProductDetails.Description,
  8          ProductDetails.Price,
  9          ProductDetails.StockLevel,
 10          ProductDetails.AvailabilityStatus,
 11          ProductDetails.VendorID,
 12          COUNT(PurchasedProduct.OrderID) AS OrderCount
 13      FROM
 14          PurchasedProduct
 15      JOIN
 16          ProductDetails ON PurchasedProduct.ProductID = ProductDetails.ProductID
 17      GROUP BY
 18          ProductDetails.ProductID, ProductDetails.ProductName, ProductDetails.ProductCategory, ProductDetails.Description, ProductDetails.Price, ProductDetails.StockLevel, ProductDetails.AvailabilityStatus, ProductDetails.VendorID
 19      ORDER BY
 20          OrderCount DESC
 21  )
 22* WHERE ROWNUM <= 3
SQL> SELECT *
  2  FROM (
  3      SELECT
  4          Customer.CustomerID,
  5          Customer.CustomerName,
  6          SUM(Invoice.TotalPaidAmount) AS TotalSpending
  7      FROM
  8          Customer
  9      JOIN
 10          PurchasedProduct ON Customer.CustomerID = PurchasedProduct.CustomerID
 11      JOIN
 12          OrderDetails ON PurchasedProduct.OrderID = OrderDetails.OrderID
 13      JOIN
 14          Invoice ON OrderDetails.InvoiceID = Invoice.InvoiceID
 15      WHERE
 16          TO_CHAR(OrderDetails.OrderDate, 'MM') = '08'
 17      GROUP BY
 18          Customer.CustomerID, Customer.CustomerName
 19      ORDER BY
 20          TotalSpending DESC
 21  )
 22  WHERE ROWNUM <= 1;

CUSTOMERID CUSTOMERNAME                   TOTALSPENDING                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
---------- ------------------------------ -------------                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
         7 Priya                                    950                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 

SQL> COMMIT;

Commit complete.

SQL> SPOOL OFF;
