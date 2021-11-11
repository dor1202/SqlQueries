-- default DB 
 use northwind

-- all customers
select *
from Customers

-- reports to
select EmployeeID,FirstName,city,Country,ReportsTo
from Employees

-- employee role
select FirstName,Title,TitleOfCourtesy
from Employees

-- customer details
select customerid,CompanyName,contactname,city,country 
from  Customers

-- Supplier details
select [SupplierID],CompanyName,contactname,address,city,Country 
from [dbo].[Suppliers]

-- company business
select *
from Categories

-- cust details
select customerid,companyname,contactname,city,Country
from Customers

-- supplier details
select SupplierID,CompanyName,ContactName,Country
from [dbo].[Suppliers]

-- calculated with as
select ProductID,productname,UnitsInStock * UnitPrice as 'Total$_PerItem' 
from Products

select ProductID,productname,unitsinstock,unitprice, 
UnitsInStock * UnitPrice as 'Item_Total$'
from Products

-- as 2nd option
select ProductID,unitprice,unitsinstock,'Item_Total$'= UnitsInStock * UnitPrice  
from Products

-- distinct
select distinct city
from employees

select city 
from Employees


-- country from customers
select country
from Customers
order by Country

select distinct Country
from Customers


-- Distinct should not be run for unique columns
select distinct CustomerID          --,companyname     --,[CompanyName]
from Customers

select distinct Country
from Suppliers

select Country,City
from Customers

select distinct Country,City 
from Customers

select distinct city,Country
from Customers

-- from another DB 
select *
from northwind.dbo.Categories

-- functions
-- replace string 
select FirstName,replace (FirstName, 'ST','999ZZ')
from Employees

select city, replace (city, 'london','GB_London')
from Employees

-- from place , num of chars
select firstname,SUBSTRING (FirstName,1,4) 'SubString'
from Employees

select HomePhone ,substring(HomePhone,6,99) as 'Tel_No_extension'
from Employees

select HomePhone,SUBSTRING(homephone,1,5) 'extension'
from Employees

-- left or right chars
SELECT companyname,LEFT(CompanyName, 5) AS '5left',right(companyname,5) '5right'
FROM Customers;

--  len 
select HomePhone,len(homephone) 'NumOfChars'
from Employees

-- Combine len and substring
select HomePhone,len(homephone)'len',substring(HomePhone,len(homephone)-8,99) 'TelWithnoExtention'
from Employees

--  len
select HomePhone,len(homephone)
from Employees

Select UPPER(firstname) 'CAPS', LOWER('ABCDname') 'Regular'
from Employees
-- ==================================================
-- current date
select getdate() 'Getdate',getutcdate () 'UTC'

select firstname,hiredate
from Employees

-- employee with hiredate
select employeeid,firstname,hiredate,
year (HireDate) 'YYYY',month (HireDate) 'MM',day(HireDate) 'DD'
from Employees

-- current date
select year (getdate()) 'YY',month(getdate())'MM',
day(getdate())'DD'

-- emp name with hiredate
select employeeid,firstname,city,
year (HireDate) 'YYYY',month (HireDate) 'MM',day(HireDate) 'DD'
from Employees

-- emp with birthdate
select firstname,year (BirthDate) 'YYYY',month (birthdate) 'MM',
day (birthdate) 'DD'	
from Employees

-- order date 
select orderid,orderdate,
year(orderdate) 'YYYY',month (orderdate) 'MM',day (OrderDate) 'DD'
from Orders

-- emp name and age in years

-- date functions wrong ....
select FirstName,city,2021 - year (BirthDate) 'Age'
from Employees

-- correct, date as parameter
select FirstName,city,year (getdate()) - year (birthdate) 'Age'
from Employees

-- datediff, employees age in month and years
select firstname,DATEDIFF(YEAR,birthdate,getdate()) 'Date_in_years' 
from Employees

-- datediff, employees age in month and years
select firstname,DATEDIFF(MONTH,birthdate,getdate()) 'Date_in_month' 
from Employees

-- datediff, employees age in month and years accurate
select firstname,DATEDIFF(month,birthdate,getdate())/12.0 'Date_in_month' 
from Employees

select firstname,DATEDIFF(day,BirthDate,getdate()) 'Date_in_days'
from Employees

-- hire date in years accurate by date
select firstname,DATEDIFF(DAY,BirthDate,getdate())/365.0 'Date_in_Years'
from Employees

-- each char is 2 bytes in DB
select firstname,DATALENGTH (firstname) 'LengthInBytes'
from Employees

-- merge columns with concat or +
select concat(firstname,' ', city)
from employees

select firstname + ' '  + city + ' '+ country 'Name city'
from Employees

select concat(firstname,' From ', city,Country) 'Name_city'
from employees


select concat(firstname,' Hired ', month(hiredate),'/',year(hiredate))
from employees

-- round the number after , is the digit that rounded
select round (125.8645,0)   '0'
select round (123.8645,1)   '1'
select round (123.8645,2)   '2'
select round (123.8645,3)   '3'
select round (123.8645,4)   '4'
select round (125.0000,-1) '-1'
select round (123.0000,-1) '-1'

-- unitprice rounded
select unitprice,round (unitprice,0) '0',round (unitprice,1) '1' 
from products

-- floor
select 123.9999,floor (123.9999) 'floor'
select floor (0.58888)
select floor (-125.99999)
select floor (-9999.9999)
-- ===================================================
-- hire date in years accurate with and without round
select firstname,(DATEDIFF(DAY,hiredate,getdate())/365.0) 'date_in_Years'
from Employees

select firstname,round(DATEDIFF(DAY,hiredate,getdate())/365.0,1)'date_in_Years'
from Employees

select [FirstName],[HireDate]
from [dbo].[Employees]

-- more functions
select sqrt(4.4)'sqrt',log(10.0)'log',sign(-10)'s',sign(10*10-10+10)'s',
power(4,4)'power',CURRENT_TIMESTAMP,getdate(),
44 / 5 '44/5',44/5.0, 44 % 5 'Remainder modulu';

-- place of t in firstname 
SELECT firstname,CHARINDEX('t', firstname) AS Position,CHARINDEX('t', 'atat')
from Employees;

--soundex similarity, 0 weak, 4 strong
SELECT DIFFERENCE('123456', '122456'),DIFFERENCE('yirieio', '1234');

-- format
SELECT FORMAT(123456789, '##-##-#####');

SELECT companyname,LEFT(CompanyName, 5) AS 'left',right(companyname,5) 'right'
FROM Customers;

-- reverse string
SELECT REVERSE('1040');

-- spaces
select space (10)+ ' ' +firstname
from Employees

-- ltrim remove leading spaces from a character variable, here dispaly date clearly
select hiredate,ltrim(hiredate) 'ltrim'
from Employees





-- where in next file
select employeeid,FirstName,City,Country
from Employees
where EmployeeID >= 8 



