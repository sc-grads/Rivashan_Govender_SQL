/*
1. Write a query in SQL to retrieve all rows and columns from the employee table in the Adventureworks database. Sort the result set in ascending order on jobtitle.
Sample Output:

*/

SELECT * FROM HumanResources.Employee

/*

businessentityid|nationalidnumber|loginid                     |jobtitle                                |birthdate |maritalstatus|gender|hiredate  |salariedflag|vacationhours|sickleavehours|currentflag|rowguid                             |modifieddate           |organizationnod


2. Write a query in SQL to retrieve all rows and columns from the employee table using table aliasing in the Adventureworks database. Sort the output in ascending order on lastname.
Sample Output:


 */

 SELECT * FROM Person.Person ORDER BY LastName

 /*

businessentityid|persontype|namestyle|title|firstname               |middlename      |lastname              |suffix|emailpromotion|additionalcontactinfo|demographics|rowguid                             |modifieddate           |
 



3. Write a query in SQL to return all rows and a subset of the columns (FirstName, LastName, businessentityid) from the person table in the AdventureWorks database. The third column heading is renamed to Employee_id. Arranged the output in ascending order by lastname.
Sample Output:

*/
SELECT FirstName, LastName, (BusinessEntityID ) AS Employee_id FROM Person.Person ORDER BY LastName

/*


firstname               |lastname              |employee_id|
 



4. Write a query in SQL to return only the rows for product that have a sellstartdate that is not NULL and a productline of 'T'. Return productid, productnumber, and name. Arranged the output in ascending order on name.
Sample Output:

*/

 

 SELECT ProductID, ProductNumber, Production.Product.Name AS ProductName FROM production.product WHERE SellStartDate IS NOT NULL AND Production.Product.ProductLine = 'T' ORDER BY Production.Product.Name

 

/*


productid|productnumber|producname                   |
 
5. Write a query in SQL to return all rows from the salesorderheader table in Adventureworks database and calculate the percentage of tax on the subtotal have decided. Return salesorderid, customerid, orderdate, subtotal, percentage of tax column. Arranged the result set in ascending order on subtotal.
Sample Output:

*/
SELECT SalesOrderID, CustomerID, OrderDate, SubTotal,(TaxAmt*100)/SubTotal AS Tax_Percent FROM Sales.SalesOrderHeader ORDER BY SubTotal DESC

/*


salesorderid|customerid|orderdate              |subtotal   |tax_percent        |
 
6. Write a query in SQL to create a list of unique jobtitles in the employee table in Adventureworks database. Return jobtitle column and arranged the resultset in ascending order.
Sample Output:

*/

SElECT DISTINCT JobTitle FROM HumanResources.Employee ORDER BY JobTitle

/*


jobtitle                                |
 
7. Write a query in SQL to calculate the total freight paid by each customer. Return customerid and total freight. Sort the output in ascending order on customerid.
Sample Output:


*/
SELECT CustomerID, sum(Freight) as Total_Freight FROM Sales.SalesOrderHeader GROUP BY CustomerID ORDER BY CustomerID ASC

/*

customerid|total_freight|
 
8. Write a query in SQL to find the average and the sum of the subtotal for every customer. Return customerid, average and sum of the subtotal. Grouped the result on customerid and salespersonid. Sort the result on customerid column in descending order.
Sample Output:


*/
SELECT CustomerID, SalesPersonID, AVG(SubTotal) AS AvgTotal, SUM(SubTotal) AS Sum_Total FROM Sales.SalesOrderHeader GROUP BY CustomerID, SalesPersonID ORDER BY CustomerID DESC

/*

customerid|salespersonid|avg_subtotal          |sum_subtotal|
 
9. Write a query in SQL to retrieve total quantity of each productid which are in shelf of 'A' or 'C' or 'H'. Filter the results for sum quantity is more than 500. Return productid and sum of the quantity. Sort the results according to the productid in ascending order.
Sample Output:


*/
SELECT ProductID, sum(Quantity) AS Total_Quantity FROM Production.ProductInventory WHERE Shelf IN ('A','C','H') GROUP BY ProductID HAVING SUM(Quantity) > 500 ORDER BY productid

/*



productid|total_quantity|
 
10. Write a query in SQL to find the total quantity for a group of locationid multiplied by 10.
Sample Output:

*/
SELECT SUM(Quantity) AS Total_Quantity FROM Production.ProductInventory GROUP BY (LocationID *10) 


/*


total_quantity|
 
11. Write a query in SQL to find the persons whose last name starts with letter 'L'. Return BusinessEntityID, FirstName, LastName, and PhoneNumber. Sort the result on lastname and firstname.
Sample Output:


*/

SELECT P.BusinessEntityID, FirstName, LastName, PhoneNumber AS Person_Phone FROM Person.Person AS P JOIN Person.PersonPhone AS PH ON P.BusinessEntityID  = PH.BusinessEntityID  WHERE LastName %STARTSWITH 'L' ORDER BY LastName, FirstName;



/*

businessentityid|firstname  |lastname       |person_phone       |
 
12. Write a query in SQL to find the sum of subtotal column. Group the sum on distinct salespersonid and customerid. Rolls up the results into subtotal and running total. Return salespersonid, customerid and sum of subtotal column i.e. sum_subtotal.
Sample Output:


*/
SELECT SalesPersonID, CustomerID, SUM(SubTotal) AS SUM_Total FROM Sales.SalesOrderHeader s GROUP BY ROLLUP (SalesPersonID, CustomerID)


/*


salespersonid|customerid|sum_subtotal  |
 
13. Write a query in SQL to find the sum of the quantity of all combination of group of distinct locationid and shelf column. Return locationid, shelf and sum of quantity as TotalQuantity.
Sample Output:


*/

SELECT LocationID, Shelf, SUM(Quantity) AS TotalQuantity FROM Production.ProductInventory GROUP BY CUBE (LocationID, Shelf)

/*





locationid|shelf|totalquantity|
 
14. Write a query in SQL to find the sum of the quantity with subtotal for each locationid. Group the results for all combination of distinct locationid and shelf column. Rolls up the results into subtotal and running total. Return locationid, shelf and sum of quantity as TotalQuantity.
Sample Output:

*/
SELECT LocationID, Shelf, SUM(Quantity) AS TotalQuantity, ModifiedDate FROM Production.ProductInventory GROUP BY GROUPING SETS ( ROLLUP (LocationID, Shelf), CUBE (LocationID, Shelf), (ModifiedDate) )

/*


locationid|shelf|totalquantity|
 
15. Write a query in SQL to find the total quantity for each locationid and calculate the grand-total for all locations. Return locationid and total quantity. Group the results on locationid.
Sample Output:

*/
SELECT LocationID, SUM(Quantity) AS TotalQuantity FROM Production.ProductInventory GROUP BY LocationID

/*


locationid|totalquantity|
 
16. Write a query in SQL to retrieve the number of employees for each City. Return city and number of employees. Sort the result in ascending order on city.
Sample Output:

*/
SELECT Pa.City, COUNT(Bi.AddressID) NoOfEmployees FROM Person.BusinessEntityAddress AS Bi INNER JOIN Person.Address AS Pa ON Bi.AddressID = Pa.AddressID GROUP BY Pa.City ORDER BY Pa.City

/*


city                 |noofemployees|
 
17. Write a query in SQL to retrieve the total sales for each year. Return the year part of order date and total due amount. Sort the result in ascending order on year part of order date.
Sample Output:
*/

SELECT DATEPART(YEAR,OrderDate) AS "Year",SUM(TotalDue) AS "Order Amount" FROM Sales.SalesOrderHeader GROUP BY DATEPART(YEAR,OrderDate) ORDER BY DATEPART(YEAR,OrderDate)

/*



Year  |Order Amount |
 
18. Write a query in SQL to retrieve the total sales for each year. Filter the result set for those orders where order year is on or before 2016. Return the year part of orderdate and total due amount. Sort the result in ascending order on year part of order date.
Sample Output:


*/

SELECT DATEPART(YEAR,OrderDate) AS YearOfOrderDate, SUM(TotalDue) AS TotalDueOrder FROM Sales.SalesOrderHeader GROUP BY DATEPART(YEAR,OrderDate) HAVING DATEPART(YEAR,OrderDate) <= '2016' ORDER BY DATEPART(YEAR,OrderDate);
/*

yearoforderdate|totaldueorder|
 
19. Write a query in SQL to find the contacts who are designated as a manager in various departments. Returns ContactTypeID, name. Sort the result set in descending order.
Sample Output:

*/
SELECT ContactTypeID, Name FROM Person.ContactType WHERE Name LIKE '%Manager%' ORDER BY ContactTypeID DESC
/*


contacttypeid|name                           |
 
20. From the following tables write a query in SQL to make a list of contacts who are designated as 'Purchasing Manager'. Return BusinessEntityID, LastName, and FirstName columns. Sort the result set in ascending order of LastName, and FirstName.
Sample Output:


*/

SELECT Pp.BusinessEntityID, LastName, FirstName FROM Person.BusinessEntityContact AS Pb INNER JOIN Person.ContactType AS Pc ON Pc.ContactTypeID = Pb.ContactTypeID INNER JOIN Person.Person AS PP ON pp.BusinessEntityID = Pb.PersonID WHERE Pc.Name = 'Purchasing Manager' ORDER BY LastName, FirstName;
/*

businessentityid|lastname      |firstname  |
 
21. Write a query in SQL to retrieve the salesperson for each PostalCode who belongs to a territory and SalesYTD is not zero. Return row numbers of each group of PostalCode, last name, salesytd, postalcode column. Sort the salesytd of each postalcode group in descending order. Shorts the postalcode in ascending order.
Sample Output:
*/

SELECT ROW_NUMBER() OVER win AS "Row Number", Pp.LastName, Sp.SalesYTD, Pa.PostalCode FROM Sales.SalesPerson AS Sp INNER JOIN Person.Person AS Pp ON Sp.BusinessEntityID = Pp.BusinessEntityID INNER JOIN Person.Address AS Pa ON pa.AddressID = pp.BusinessEntityID WHERE TerritoryID IS NOT NULL AND SalesYTD <> 0 WINDOW win AS (PARTITION BY PostalCode ORDER BY SalesYTD DESC) ORDER BY PostalCode;
/*



Row Number|lastname         |salesytd    |postalcode|
 
22. Write a query in SQL to count the number of contacts for combination of each type and name. Filter the output for those who have 100 or more contacts. Return ContactTypeID and ContactTypeName and BusinessEntityContact. Sort the result set in descending order on number of contacts.
Sample Output:

*/
SELECT Pc.ContactTypeID, Pc.Name AS ContactTypeName, COUNT(*) AS NoContacts FROM Person.BusinessEntityContact AS Pbc INNER JOIN Person.ContactType AS Pc ON Pc.ContactTypeID = Pbc.ContactTypeID GROUP BY Pc.ContactTypeID, Pc.Name HAVING COUNT(*) >= 100 ORDER BY COUNT(*) DESC;
/*


contacttypeid|ctypename         |nocontacts|
 
23. Write a query in SQL to retrieve the RateChangeDate, full name (first name, middle name and last name) and weekly salary (40 hours in a week) of employees. In the output the RateChangeDate should appears in date format. Sort the output in ascending order on NameInFull.
Sample Output:

*/

SELECT CAST(Hep.RateChangeDate AS DATE) AS FromDate,CONCAT(LastName, ', ', FirstName, ' ', MiddleName) AS NameInFull, (40 * Hep.Rate) AS SalaryInAWeek FROM Person.Person AS Pp INNER JOIN HumanResources.EmployeePayHistory AS Hep ON Hep.BusinessEntityID = Pp.BusinessEntityID ORDER BY NameInFull;


/*


fromdate  |nameinfull                     |salaryinaweek|
 
24. Write a query in SQL to calculate and display the latest weekly salary of each employee. Return RateChangeDate, full name (first name, middle name and last name) and weekly salary (40 hours in a week) of employees Sort the output in ascending order on NameInFull.
Sample Output:

*/

SELECT CAST(Hep.RateChangeDate AS DATE) AS FromDate,CONCAT(FirstName, ', ', MiddleName, ' ', LastName) AS FullName,(40 * Hep.Rate) AS SalaryInAWeek FROM Person.Person AS Pp INNER JOIN HumanResources.EmployeePayHistory AS Hep ON Hep.BusinessEntityID = Pp.BusinessEntityID WHERE Hep.RateChangeDate = (SELECT MAX(RateChangeDate) FROM HumanResources.EmployeePayHistory WHERE BusinessEntityID = Hep.BusinessEntityID) ORDER BY FullName;
/*


fromdate  |nameinfull                     |salaryinaweek|
 
25. Write a query in SQL to find the sum, average, count, minimum, and maximum order quentity for those orders whose id are 43659 and 43664. Return SalesOrderID, ProductID, OrderQty, sum, average, count, max, and min order quantity.
Sample Output:


*/

SELECT SalesOrderID, ProductID, OrderQty, 
SUM(OrderQty) OVER (PARTITION BY SalesOrderID) AS "TotalQuantity",
AVG(Floor(OrderQty)) OVER (PARTITION BY SalesOrderID) AS "AvgQuantity",
COUNT(OrderQty) OVER (PARTITION BY SalesOrderID) AS "NoOfOrders",
MIN(OrderQty) OVER (PARTITION BY SalesOrderID) AS "MinQuantity",
MAX(OrderQty) OVER (PARTITION BY SalesOrderID) AS "MaxQuantity"
FROM Sales.SalesOrderDetail WHERE SalesOrderID IN (43659,43664)

/*

salesorderid|productid|orderqty|Total Quantity|Avg Quantity      |No of Orders|Min Quantity|Max Quantity|
 




*/