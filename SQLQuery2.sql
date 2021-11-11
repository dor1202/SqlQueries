-- where 
select *
from Employees
where EmployeeID >= 5

-- all products where price > 10 
select ProductID,ProductName,UnitPrice,UnitsInStock,ReorderLevel,
QuantityPerUnit
from Products
where  Unitprice > 10

-- prod details where stock bigger then 50

select ProductID,ProductName,UnitPrice,UnitsInStock,ReorderLevel,
QuantityPerUnit
from Products
where  UnitsInStock > 50  

-- products where stock >= 15 and price > 10 
select ProductID,ProductName,UnitPrice,UnitsInStock,ReorderLevel,QuantityPerUnit
from Products
where  UnitsInStock >= 15 and UnitPrice > 10

select ProductID,ProductName,UnitPrice,UnitsInStock,[ReorderLevel],[QuantityPerUnit]
from Products
where  UnitsInStock >= 15 OR UnitPrice > 10                                                                                                                                                                                                                                                                                                                                              45

select ProductID,UnitPrice,UnitsInStock,[ReorderLevel],[QuantityPerUnit]
from Products
where  UnitsInStock >= 5 OR UnitPrice < 100

select ProductID,UnitPrice,UnitsInStock,[ReorderLevel],[Discontinued]
from Products
where  UnitsInStock >= 0 or UnitPrice < 100

select ProductID,UnitPrice,UnitsInStock,ReorderLevel
from Products
where  UnitsInStock < 10 and UnitPrice > 10


 -- Products To order priority 1
select * from Products

select ProductID,ProductName,UnitsInStock,ReorderLevel,
UnitsInStock - ReorderLevel 'Instock_Diff',Discontinued
from Products
where UnitsInStock - ReorderLevel <= 0 -- and Discontinued = 0

-- units on order
select ProductID,ProductName,UnitsInStock,UnitsInStock + UnitsOnOrder 'plus orders',ReorderLevel,
UnitsInStock + UnitsOnOrder - ReorderLevel 'Instock_Diff',Discontinued
from Products
where UnitsInStock + UnitsOnOrder - ReorderLevel <= 0 -- and Discontinued = 0 

-- to order suggestion, 50% 
select ProductID,ProductName,UnitsInStock,reorderlevel,
ReorderLevel - UnitsInStock + 5 'ToOrder',
(ReorderLevel - UnitsInStock) * 150/100 'ToOrder50%'
from Products
where (ReorderLevel - UnitsInStock >= 0) and Discontinued = 0

select 150.0/100.0
 
-- orders from year 1996 

select orderid,year(orderdate)'Year',OrderDate
from Orders
where year (orderdate) = 1996

-- between
select orderid,year(orderdate)
from Orders
where year (orderdate) between 1996 and 1998

-- products  price between 10 to 20
select ProductID,ProductName,UnitsInStock,ReorderLevel,UnitPrice
from Products
where UnitPrice between 10 and 20 
 
-- or unitprice < 15

select ProductID,UnitPrice,UnitsInStock,[ReorderLevel]
from Products
where (UnitPrice < 100 and  ReorderLevel > 10) 
and UnitsInStock != 50

select orderid,OrderDate
from Orders
where year(orderdate) > 1996

-- Between
select ProductID,UnitPrice,UnitsInStock,[ReorderLevel]
from Products
where (UnitPrice between 100 and 200)

-- IN  ,  10 or 20 or 30 or 40 
select ProductID,UnitPrice,UnitsInStock,[ReorderLevel]
from Products
where UnitPrice in (10,20,30,40)


order by unitprice

-- where on chars text
select CustomerID,CompanyName,ContactName,city,Country
from Customers
where city = 'london'

select CustomerID,CompanyName,ContactName,Country
from   Customers
where  (country = 'Usa') or (country ='brazil')

-- wrong and 
select *
from Employees
where   City = 'London'
		and  City='Redmond'
		and  City='Seattle'

select EmployeeID,City,FirstName,BirthDate
from Employees
where City  in ('London', 'Redmond','Seattle')

-- NULL
-- find nulls is , is not 
select *
from Employees
where region is null

select *
from Employees
where region is not null
-- =============================================
select CompanyName,Country,city,Address
from customers
where country = 'germany'

-- LIKE  
-- starts with v
select CompanyName,Country
from customers
where country like 'V%'

-- any place G is, even 1st or end of string place 
select Country
from Customers
where Country like '%G%' 

-- any place GE is, even 1st or end of string place 
select Country
from Customers
where Country like '%ge%'

-- after 
select Country
from Customers
where Country > 'germany'
order by Country 

-- G starts with 
select Country
from Customers
where Country like 'G%' 

-- starts wuth g ends  with y
select city,Country
from Customers
where Country like 'g%y' 

select City
from Employees
where city like '%nd%'

select *
from Employees
where city like 'lo%'

select CompanyName,city,Country
from Customers
where city like 'b%' and country like '%sw%'

select CompanyName,city,Country
from Customers
where city like '%bu%'or country like '%bu%'


select CompanyName,city,Country
from Customers
where city like '%b%'and country like '%y'

-- bern as a city b???
select CompanyName,city,Country
from Customers
where city like 'b___'

-- bern as a city b??n
select CompanyName,city,Country
from Customers
where city like '_e_n'

select city,country 
from Suppliers
where city like '%new%' and country like '%sa%'

select CompanyName,city,Country
from Customers
where country like 'i___y'

select CompanyName,city,Country
from Customers
where country like 'i___y' or country like 's%w%n'

select CompanyName,city,Country
from Customers
where country like 'g_r%'

select CompanyName,city,Country
from Customers
where country like '_ta__'

select EmployeeID,Title
from Employees
where title like 's% rep%'


-- ORDER BY
-- asc/desc
select CompanyName,city,Country
from Customers
where country like 'i%'
order by city asc               

-- order by  --asc/desc
select CompanyName,city,Country
from Customers
where country like 'i%'
order by city  desc

-- order inside order , country and city
select customerid,companyname,country,city
from customers
order by Country,city                  --desc

-- display supp info order by country asc
select SupplierID,CompanyName,Country, city
from suppliers
order by country 

-- display suppliers info order by country asc city desc
select SupplierID,CompanyName,city,Country 
from suppliers
order by country asc,City desc

select EmployeeID,City,FirstName
from Employees
where City in ('London', 'Redmond','Seattle')
order by EmployeeID  --desc 

-- order by country 1st city 2nd
select companyname,contactname,phone,Country,city
from Customers
order by country asc,City asc

-- TODO
-- 1 Display all customers from USA and OR state,
-- display their names and addresses


select CustomerID,CompanyName,address,city,region,country
from customers
where country = 'usa' and region = 'or'


-- 2 Display a list of dairy products (cat 4),
-- and their prices in US $ and in NIS (or another currency)


select ProductID,ProductName,UnitPrice,unitprice * 3.22 'NIS_Price',CategoryID
from Products
where CategoryID = 4

-- step 1
select * from Categories



-- emps info order by seniority desc in terms of years

select firstname, City, year(getdate()) - year(hiredate) 'Seniority'
from Employees
order by Seniority desc

-- same as "concat"
select firstname + ' F ' + City 'Name_City',
 year(getdate()) - year(hiredate) 'VETEK'
from Employees
where year(getdate()) - year(hiredate) >= 20
order by VETEK

select *
from Suppliers
order by CompanyName desc

-- employees info list CEO only

select EmployeeID, FirstName, ReportsTo
from Employees
where ReportsTo is null


-- 5-34 order years  
select distinct year(orderdate) 'OrderYears' --,month(orderdate)'MM'
from Orders
order by year(orderdate)
 
-- is it relevant ? 
select distinct YEAR(birthdate)'birthdate',FirstName
from Employees

select year(birthdate),FirstName
from Employees
order by year(birthdate)

select LastName,FirstName,HireDate, DATEDIFF(DAY,HireDate , GETDATE())/365.0 as 'vetec'
from Employees
order by vetec desc




-- join 
select *
from Products
where ProductID = 4
 
select *
from Categories

select * 
from Products

-- Cartesian product cross join
select ProductID,unitprice,unitsinstock,CategoryName,categories.CategoryID
from Categories,Products
where ProductID = 4

--order by ProductID

-- INNER join in where, product 4
select ProductID,ProductName,CategoryName,Description,categories.CategoryID
from  Categories,Products
where Categories.CategoryID = Products.CategoryID

 
 and ProductID = 4
order by ProductID

-- INNER join in where all products
select ProductID,ProductName,CategoryName,Description,categories.CategoryID
from  Categories,Products
where Categories.CategoryID = Products.CategoryID 
order by categories.CategoryID

select * from Products

-- join in From 
select ProductName,CategoryName
from Products inner join Categories on
Products.CategoryID = Categories.CategoryID

-- with alias for table	
select ProductID,C.CategoryID,CategoryName
from Categories C,Products P
where C.CategoryID = P.CategoryID

-- join in From 
select ProductName,CategoryName
from Products P inner join Categories C on
P.CategoryID = C.CategoryID


and C.CategoryID = 4 
order by ProductID

-- items from meat category with price greater then 5
 
select ProductID,productname,C.CategoryID,CategoryName,
UnitPrice,UnitsInStock
from Categories C,Products P
where C.CategoryID = P.CategoryID
and CategoryName like '%meat%' and UnitPrice >  5



-- join orders and employees, orderid, orderdate, employeeid, firstname, city
-- in from 
SELECT OrderID, ltrim(OrderDate)'order date', Employees.EmployeeID, FirstName,City
FROM Orders INNER JOIN Employees
ON Orders.EmployeeID = Employees.EmployeeID


select orderid,year(orderdate)'OrderYear',FirstName,employees.EmployeeID,City
from  orders,Employees
where Orders.EmployeeID = Employees.EmployeeID 
order by EmployeeID,OrderID

select *
from Orders




-- Join products and  suppliers

select ProductID,ProductName,suppliers.SupplierID,CompanyName,ContactName,Country
from products, Suppliers
where products.SupplierID = Suppliers.SupplierID 
and UnitsInStock > 10

--and country like 'den%'


select *
from [Order Details]


-- product price and name in sales and orders containing it

select orderid,ProductName, [Order Details].UnitPrice,UnitsInStock
from Products,[Order Details]
where products.ProductID = [Order Details].ProductID 
order by products.ProductID

-- step1 orders and shippers,
-- step 2 orders which not suppllied
select orderid,orderdate,CompanyName 'ShippedBy',
ShippedDate,Freight 'ShipCost'
from orders,shippers
where orders.shipvia = shippers.shipperid and ShippedDate is null
order by ShipperID

-- same join in the from 
select orderid,orderdate,CompanyName 'ShippedBy',
ShippedDate,Freight 'ShipCost'
from orders inner join shippers
ON orders.shipvia = shippers.shipperid 
where ShippedDate is null
order by ShipperID


-- Join more then 2 tables
-- 1 orders shippers employees
select orderid,orderdate,CompanyName 'ShippedCompany',ShippedDate
,FirstName
from employees,orders,shippers
where employees.EmployeeID = orders.employeeid AND
orders.shipvia = shippers.shipperid

-- 2 order customer employee  
select orderid,orderdate,firstname 'emp name',CompanyName 'customer'
from customers,orders,employees
where customers.CustomerID = orders.CustomerID AND
orders.EmployeeID = Employees.EmployeeID



-- 3 items from meat category  with supplier details,item price greater then 5
 
select ProductID,productname,C.CategoryID,CategoryName,
UnitPrice,UnitsInStock,CompanyName,S.SupplierID,ContactName
from Categories C,Products P,Suppliers S
where C.CategoryID = P.CategoryID 
      and P.SupplierID = S.SupplierID
      and CategoryName like '%meat%' and UnitPrice >  5

-- same, inner join in from
SELECT ProductID, ProductName, Categories.CategoryID, Categories.CategoryName, Products.UnitPrice, Products.SupplierID, Suppliers.ContactName
FROM Products INNER JOIN Categories 
     ON Products.CategoryID = Categories.CategoryID 
     INNER JOIN Suppliers
     ON Suppliers.SupplierID = Products.SupplierID

WHERE Categories.CategoryName like '%meat%'AND Products.UnitPrice > 5


-- orders and shippers , ship days
select orderid,orderdate,ShippedDate,CompanyName 'ShippedBy',
datediff(day,orderdate,shippeddate)'DiffToShipdate',RequiredDate,
datediff (day,shippeddate,requireddate) 'ReqVsShip',Freight,ShipName
from orders,shippers
where orders.shipvia = shippers.shipperid
--and datediff (day,shippeddate,requireddate) <= 0 
order by ShipperID




-- join orders and customers
select orderid,year(orderdate)'orderyear',companyname
from  orders,customers
where Orders.customerID = Customers.customerid 
order by customers.CustomerID,OrderID


-- join in From 
select ProductName, CategoryName
from Products inner join Categories on
Products.CategoryID=Categories.CategoryID
where CategoryName like 'be%'

-- display order number orderdate customer name and employee info (id,name)
-- for orders (order date) in 1998 only


-- ** orders with employee and customer
select orderid,orderdate,companyname 'Customer',firstname 'Employee'
from  orders,customers,employees
where Orders.customerID = Customers.customerid and 
Orders.EmployeeID = Employees.EmployeeID
and year(orderdate) = 1998
order by customers.CustomerID,OrderID

-- orders with employee and customer, connect in the from (inner join)
select orderid,orderdate,companyname,firstname
from  orders Join customers on Orders.customerid = customers.CustomerID
             Join employees on Orders.EmployeeID = Employees.EmployeeID
order by customers.CustomerID,OrderID

-- product price and name in sales and orders containing it
select orderid,ProductName,"Order Details".UnitPrice 'Sale_Price',
products.UnitPrice 'Prod_Price',products.ProductID
from Products,[Order Details]
where products.ProductID = [Order Details].ProductID 
order by orderid,products.ProductID

-- cross join
select *
from [Order Details],Orders

-- prod_name cat_name order_id and price in sale
select ProductName,categoryname,orderid,"order details".UnitPrice
from Categories,Products,[Order Details]
where Categories.categoryid=Products.CategoryID and 
products.productid=[Order Details].ProductID

-- prod cat supp
select ProductName,categoryname,companyname 'SuppName',UnitPrice
from Categories,Products,Suppliers
where Categories.categoryid=Products.CategoryID AND
products.supplierid=suppliers.SupplierID



-- join 4 tables page 5-40,orders from 1996 display cystomer name and productname

select O.orderid,C.CustomerID,companyname, ContactName, ProductName,OD.UnitPrice,
city,year (orderdate) 'orderdate'
from Customers C, Orders O, "Order Details" OD, Products P
where C.CustomerID = O.CustomerID
      and O.OrderID = OD.OrderID
      and OD.ProductID = P.ProductID
      and year(OrderDate) = 1996
order by C.CustomerID,O.OrderID

select * from [Order Details]

-- JOIN 4 tables in from
select O.orderid,C.CustomerID,companyname, ContactName, ProductName,OD.UnitPrice,
city,year (orderdate) 'orderdate'
from Customers c join Orders o on c.CustomerID=o.CustomerID
				 join [Order Details] od on o.OrderID=od.OrderID
				 join Products p on p.ProductID=od.ProductID
where year(OrderDate) = 1996
order by c.CustomerID

-- join orders and custoemrs
select companyname,Customers.customerid,contactname,orderid
from  orders,Customers
where Orders.customerid = customers.CustomerID and
year(orderdate) = 1996 and city = 'london'
-- to verify
select companyname,city 
from customers
where city = 'london'

select E.employeeid,firstname,O.orderid,ProductName,OD.UnitPrice
from employees E, Orders O, "Order Details" OD, Products P
where E.EmployeeID = O.EmployeeID
      and O.OrderID = OD.OrderID
      and OD.ProductID = P.ProductID
	  order by firstname,OrderID
