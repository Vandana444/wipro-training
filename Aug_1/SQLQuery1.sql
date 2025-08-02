use sqlpractice
Go

--Display List of tables which are available in current database
select * from INFORMATION_SCHEMA.TABLES
Go

--Display information about Emp table
sp_help Emp
Go

--Display all records from Emp Table
select*from Emp
Go

--Dispaly Empno,name,basic from Emp table
select Empno 'Employ No', nam 'Employ Name', basic 'Salary'
	from Emp
GO

--Display all records whose basic>50000
select * from Emp
WHERE basic>50000
GO

--Display all records where dept is dotnet
select * from Emp
WHERE dept = 'dotnet'
GO

--Display all records whose name is swetha
select * from Emp
WHERE nam='ashima'
GO

--Betwwen ...and:Dispaly records from specific range(worksfor numbers and data only
select * from Emp
WHERE basic Between 50000 and 70000
GO

select * from Emp
WHERE basic Not Between 50000 and 70000
GO

--In Clause:used to check multiple values of particular column

--Display all records whose dept is java or dotnet or sql
select * from Emp
WHERE dept in('java','dotnet','sql')
GO

select * from Emp
WHERE dept Not in('java','dotnet','sql')
GO

--LIKE operator: used to display data w.r.t wild cards

--Dispaly all record whose name starts with 's'

select * from Emp WHERE nam LIKE 's%'
GO

-- Display all records whose name ends with 'A'
select * from Emp Where nam LIKE '%A'
GO

-- Distinct : Eliminate duplicate entries at the time of display 
select dept from emp
GO

select distinct dept from emp
GO

--Order by : used to display values w.r.t. paraticular field(s) in ascending or descending order
select * from emp order by nam
GO

select * from emp order by nam desc
GO

select * from emp order by basic DESC
GO

select * from emp order by Dept,Nam
GO

select * from emp order by Dept,Nam desc
GO


