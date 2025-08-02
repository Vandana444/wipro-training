--  1. Write a query to Get a List of Employees who have a one part name

SELECT Name
FROM tblEmployees
WHERE Name NOT LIKE '% %'
GO

-- 2. Write a query to Get a List of Employees who have a three part name
select Name from tblEmployees
where Name like '[a-z]%[ ][a-z]%[ ][a-z]%' and Name not like '[a-z]%[ ][a-z]%[ ][a-z]%[ ][a-z]%';

-- 3.write a query to get a list of Employees who have a First Middle Or last name as Ram, and not any thing else
select emp.Name
from dbo.tblEmployees emp
where emp.Name like 'ram[ ]%' or emp.Name like '%[ ]ram' or emp.Name like '%[. ]ram[ ]%';

--4.1

select emp.EmployeeNumber, emp.Name, emp.CentreCode
from dbo.tblEmployees emp
where emp.CentreCode = 65 or emp.CentreCode = 11;

--4.2

select COUNT(*)
from dbo.tblEmployees emp
where (emp.CategoryCode = 65 and emp.CentreCode <> 11) or ((emp.CategoryCode <> 65 and emp.CentreCode = 11));
  
  --OR

select COUNT(*)
from tblEmployees emp
where (emp.CategoryCode = 65 or emp.CentreCode = 11) and ((emp.CategoryCode <> 65 and emp.CentreCode <> 11));  

--4.3

select emp.EmployeeNumber, emp.Name, emp.CentreCode, emp.CategoryCode
from tblEmployees emp
where emp.CategoryCode = 12 and emp.CentreCode = 4;

--4.4

select emp.EmployeeNumber, emp.Name, emp.CentreCode, emp.CategoryCode
from dbo.tblEmployees emp
where (emp.CategoryCode=12 and emp.CentreCode=4)or (emp.CategoryCode=13 and emp.CentreCode=1);

--4.5

select emp.EmployeeNumber, emp.Name
from dbo.tblEmployees emp
where emp.EmployeeNumber = 127 or emp.EmployeeNumber = 64;

--4.6

select emp.EmployeeNumber,emp.Name
from dbo.tblEmployees emp
where (emp.CategoryCode = 127 and emp.CentreCode <> 64) or ((emp.CategoryCode <> 127 and emp.CentreCode = 64));

--4.7

select emp.EmployeeNumber,emp.Name
from dbo.tblEmployees emp
where (emp.CategoryCode = 127 and emp.CentreCode <> 128) or ((emp.CategoryCode <> 127 and emp.CentreCode = 128));

--4.8

select emp.EmployeeNumber, emp.Name
from dbo.tblEmployees emp
where emp.EmployeeNumber = 127 and emp.AreaCode = 64;

--4.9

select emp.EmployeeNumber, emp.Name
from dbo.tblEmployees emp
where emp.EmployeeNumber = 127 and emp.AreaCode = 128;

--5.Write a query which returns data in all columns from the table dbo.tblCentreMaster
select *from dbo.tblCentreMaster;

--6.Write a query which gives employee types in the organization.
select distinct employeeType from tblEmployeetypes
GO

/*7.Write a query which returns Name, FatherName, DOB of employees whose PresentBasic is
a.      Greater than 3000.
b.      Less than 3000.
c.      Between 3000 and 5000.*/

select name,fatherName,DOB,presentbasic
from tblEmployees
where presentbasic > 3000;

select name,fatherName,DOB,presentbasic
from tblEmployees
where presentbasic < 3000;

select name,fatherName,DOB,presentbasic
from tblEmployees
where presentbasic between 3000 and 5000;

/*8.Write a query which returns All the details of employees whose Name
a.Ends with 'KHAN'
b.Starts with 'CHANDRA'
c.Is 'RAMESH' and their initial will be in the rage of alphabets a-t.
EX:If an employee name is T.Ramesh then your query should return his record.*/

select *from tblEmployees
where name LIKE '%khan'
GO

select *from tblEmployees
where name LIKE 'CHANDRA%'
GO

select *from tblEmployees
where Name LIKE '[A-T].RAMESH';












