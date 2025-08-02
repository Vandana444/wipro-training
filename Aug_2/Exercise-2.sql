--1. Write a query to get Total Present basic  for all departments where total Present basic is greater than 30000, data should be sorted by department


select DepartmentCode,SUM(PresentBasic) as BasicTotal
from tblEmployees
group by DepartmentCode
having SUM(PresentBasic)>30000
order by DepartmentCode;

--2.Write a query to Get Max , Min and Average age of employees by service Type , Service Status for each Centre (display in years and Months)

select CentreCode,ServiceType,ServiceStatus,
CONVERT(varchar(10),MAX(DATEDIFF(MM,DOB,GETDATE())/12))+'years '+
CONVERT(varchar(10),MAX(DATEDIFF(MM,DOB,GETDATE())%12))+'months' as MAX_AGE,
CONVERT(varchar(10),MIN(DATEDIFF(MM,DOB,GETDATE())/12))+'years '+
CONVERT(varchar(10),MIN(DATEDIFF(MM,DOB,GETDATE())%12))+'months' as MIN_AGE,            
CONVERT(varchar(10),AVG(DATEDIFF(MM,DOB,GETDATE())/12))+'years '+
CONVERT(varchar(10),AVG(DATEDIFF(MM,DOB,GETDATE())%12))+'months' as AVG_AGE
from tblEmployees
group by CentreCode,ServiceType,ServiceStatus
order by CentreCode,ServiceType,ServiceStatus;

--3.write a query to Get Max , Min and Average service of employees by service Type , Service Status for each Centre (display in years and Months)

select CentreCode,ServiceType,ServiceStatus,
CONVERT(varchar(10),MAX(DATEDIFF(MM,DOJ,GETDATE())/12))+' years '+
CONVERT(varchar(10),MAX(DATEDIFF(MM,DOJ,GETDATE())%12))+' months' as MAX_SERVICE,            
CONVERT(varchar(10),MIN(DATEDIFF(MM,DOJ,GETDATE())/12))+' years '+
CONVERT(varchar(10),MIN(DATEDIFF(MM,DOJ,GETDATE())%12))+' months' as MIN_SERVICE,            
CONVERT(varchar(10),AVG(DATEDIFF(MM,DOJ,GETDATE())/12))+' years '+
CONVERT(varchar(10),AVG(DATEDIFF(MM,DOJ,GETDATE())%12))+' months' as AVG_SERVICE
from tblEmployees
group by CentreCode,ServiceType,ServiceStatus
order by CentreCode,ServiceType,ServiceStatus;

--4.Select all departments where Total Salary of a Department is Greater than thrice the Average Salary for the department

select DepartmentCode,SUM(PresentBasic)
from tblEmployees 
group by DepartmentCode
having SUM(PresentBasic)> 3*AVG(PresentBasic);

--5.Select all departments where Total Salary of a Department is Greater than twice the Average Salary for the department. And max basic for the department is at least thrice the Min basic for the department

select DepartmentCode,SUM(PresentBasic)
from tblEmployees 
group by DepartmentCode
having SUM(PresentBasic)> 2*AVG(PresentBasic)
       and MAX(PresentBasic)>=3*MIN(PresentBasic);
       
--6.Select all the centers where max Length of the employee  name is twice the min length of the employee name

select CentreCode
from tblEmployees 
group by CentreCode
having MAX(LEN(Name))=2*MIN(LEN(Name));   

--7.write a query to Get Max , Min and Average service of employees by service Type , Service Status for each Centre (display in mille seconds)

select emp.CentreCode,emp.ServiceType,emp.ServiceStatus,            
MAX(DATEDIFF(HH,emp.DOJ,GETDATE())) as MAX_SERVICE ,                        
MIN(DATEDIFF(HH,emp.DOJ,GETDATE())) as MIN_SERVICE,            
AVG(DATEDIFF(HH,emp.DOJ,GETDATE())) as AVG_SERVICE            
from dbo.tblEmployees emp
group by emp.CentreCode,emp.ServiceType,emp.ServiceStatus
order by emp.CentreCode,emp.ServiceType,emp.ServiceStatus;    

--8.write a query to find out employees whose names have Leading or Trailing spaces

select emp.Name
from dbo.tblEmployees emp
where emp.Name like '[ ]%' or emp.Name like '%[ ]';

--9.write a query to find out employees who have more than one space between two parts of the Name. (previous query (14) Out is Key clue in getting this query right)

select emp.Name  
from dbo.tblEmployees emp
where emp.Name like '%[a-z]%[ ][ ]%[a-z]%';

--10.Write a Query to display employee names  by removing all trailing and Leading Spaces , if the names have ‘.’  Or multiple spaces between the names than the data should be processed to display only one space

select LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(emp.Name,'.',' '),' ',' %'),'% ',''),'%','') )) as Name                           
from dbo.tblEmployees emp
order by emp.Name;

--11.write a query to find out Max Number of words in all the employee Names . (Clue Previous queries expressions as input to the Current Query )

select DummyTable.FormatedName,LEN(DummyTable.FormatedName)-LEN(REPLACE(DummyTable.FormatedName,' ',''))+1
from 
    (
        select LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(emp.Name,'.',' '),' ',' %'),'% ',''),'%','') )) FormatedName                            
        from dbo.tblEmployees emp
    )DummyTable
    
--12.Write a Query to List all employees whose name Starts and Ends with the same Character 

SELECT DummyTable.FormatedName as Name
FROM (
               select LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(emp.Name,'.',' '),' ',' %'),'% ',''),'%','') )) FormatedName                            
               from dbo.tblEmployees emp
            )DummyTable
WHERE LEFT(DummyTable.FormatedName,1)=RIGHT(DummyTable.FormatedName,1);   

--13.Write a Query to List all employees whose First and Second name Starts with the same Character

SELECT *
FROM (
        select LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(emp.Name,'.',' '),' ',' %'),'% ',''),'%','') )) FormatedName                            
        from dbo.tblEmployees emp
      )DummyTable  
where LEFT(DummyTable.FormatedName,1)=SUBSTRING(DummyTable.FormatedName,PATINDEX('%[ ]%',DummyTable.FormatedName)+1,1)        
       AND DummyTable.FormatedName LIKE '%[A-Z]%[ ][A-Z]%'; 
       
--14.Write a Query to List all employees whose First Character of all the words in the name starts with the same Character

SELECT *
FROM (
        select LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(emp.Name,'.',' '),' ',' %'),'% ',''),'%','') )) FormatedName                            
        from dbo.tblEmployees emp
    )DummyTable 
    
WHERE lEFT(DummyTable.FormatedName,1)= SUBSTRING(DummyTable.FormatedName,PATINDEX('%[ ][A-Z]%',DummyTable.FormatedName)+1,1) AND     
   lEFT(DummyTable.FormatedName,1)= SUBSTRING(DummyTable.FormatedName,CHARINDEX(' ',DummyTable.FormatedName,CHARINDEX(' ',DummyTable.FormatedName)+1)+1,1)AND
   lEFT(DummyTable.FormatedName,1)= SUBSTRING(DummyTable.FormatedName,CHARINDEX(' ',DummyTable.FormatedName,CHARINDEX(' ',DummyTable.FormatedName,CHARINDEX(' ',DummyTable.FormatedName)+1)+1)+1,1)
   AND
   DummyTable.FormatedName LIKE '%[A-Z]%[ ][A-Z]%'       
   
--15.Write a query to list out all the employees where any of the words (Excluding Initials ) in the Name starts and ends with the same character.

SELECT DummyTable.S      
      FROM (
               select LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(emp.Name,'.',' '),' ',' %'),'% ',''),'%','') )) S
               from dbo.tblEmployees emp
           )DummyTable             
      WHERE ( LEN(SUBSTRING(DummyTable.S,1,PATINDEX('%[ ]%',DummyTable.S)))>4 AND
              LEFT(DummyTable.S,1)= LEFT(REVERSE(SUBSTRING(DummyTable.S,1,PATINDEX('%[ ]%',DummyTable.S)-1)),1) )                 
               OR              
             (LEN(DummyTable.S)-LEN(REPLACE(DummyTable.S,' ',''))+1 = 2 AND LEFT(SUBSTRING(DummyTable.S, (CHARINDEX(' ',DummyTable.S)+1) ,LEN(DummyTable.S)-CHARINDEX(' ',DummyTable.S)),1) =   LEFT(REVERSE(SUBSTRING(DummyTable.S, (CHARINDEX(' ',DummyTable.S)+1) ,LEN(DummyTable.S)-CHARINDEX(' ',DummyTable.S))),1)   )             
             OR             
              ( LEN(DummyTable.S)-LEN(REPLACE(DummyTable.S,' ',''))+1 = 3 AND LEFT(SUBSTRING(DummyTable.S, (CHARINDEX(' ',DummyTable.S,CHARINDEX(' ',DummyTable.S)+1)+1) ,LEN(DummyTable.S)-CHARINDEX(' ',DummyTable.S,CHARINDEX(' ',DummyTable.S)+1)),1)=LEFT(REVERSE(SUBSTRING(DummyTable.S, (CHARINDEX(' ',DummyTable.S,CHARINDEX(' ',DummyTable.S)+1)+1) ,LEN(DummyTable.S)-CHARINDEX(' ',DummyTable.S,CHARINDEX(' ',DummyTable.S)+1))),1)   )   
              
/*16.Write a Query to List out all employees where the present basic is perfectly rounded of to 100.
Ex. If  Basic A is 2011 , Basic of B is  2100 , Basic of C is  2101 and Basic of D is  2200 . Then Only B and D should be displayed
16.1 Write Using ROUND*/

SELECT emp.PresentBasic
FROM dbo.tblEmployees emp
WHERE ROUND(emp.PresentBasic,-2)=emp.PresentBasic AND emp.PresentBasic<>0;              

--16.2 write Using floor

select emp.Name,emp.PresentBasic 
from dbo.tblEmployees emp
where FLOOR(emp.PresentBasic/100)=(emp.PresentBasic/100) AND emp.PresentBasic<>0;

--16.3 write using Mod (%)

select emp.Name,emp.PresentBasic 
from dbo.tblEmployees emp
where (emp.PresentBasic%100)=0 AND emp.PresentBasic<>0;

--16.4 write using Ceiling

select emp.Name,emp.PresentBasic 
from dbo.tblEmployees emp
where CEILING(emp.PresentBasic/100)=(emp.PresentBasic/100) AND emp.PresentBasic<>0;

--17.Write a query to find out all the departments where All employees have their Present Basic rounded of to 100

SELECT emp.DepartmentCode,COUNT(emp.PresentBasic),
     COUNT(CASE
        WHEN ROUND(emp.PresentBasic,-2)=emp.PresentBasic AND emp.PresentBasic<>0 THEN emp.PresentBasic
     END)
FROM dbo.tblEmployees emp
GROUP BY emp.DepartmentCode
HAVING COUNT(emp.PresentBasic)=COUNT(CASE
        WHEN ROUND(emp.PresentBasic,-2)=emp.PresentBasic AND emp.PresentBasic<>0 THEN emp.PresentBasic
     END)
     
--18. Write a query to find out all the departments where no employee has the Present Basic rounded of to 100    

SELECT emp.DepartmentCode,COUNT(emp.PresentBasic),
 COUNT(CASE
    WHEN ROUND(emp.PresentBasic,-2)!=emp.PresentBasic AND emp.PresentBasic<>0 THEN emp.PresentBasic
 END)
FROM dbo.tblEmployees emp
GROUP BY emp.DepartmentCode
HAVING COUNT(emp.PresentBasic)=COUNT(CASE
    WHEN ROUND(emp.PresentBasic,-2)!=emp.PresentBasic AND emp.PresentBasic<>0 THEN emp.PresentBasic
 END)
 
--19. As per the companies rule if an employee has put up service of  1 Year 3 Months and 15 days in office, Then He/She would be eligible for  Bonus. the Bonus would be Paid on first of the Next month after which  a person has attained eligibility.  Find out the eligibility date for all the employees. And also find out the age of the  Employee On the date of Payment of First bonus. Display the  Age in Years, Months and Days.  Also Display the week day Name , week of the year , Day of the year and  week of the month of the date on which the person has attained the eligibility. 

select emp.Name,emp.DOB, emp.DOJ DateOfJoining, 
DATEADD(DAY,15,DATEADD(MONTH,3,DATEADD(YEAR,1,emp.DOJ))) as EligibleDate,
DATEADD(MONTH,1,DATEADD(DAY,-(DATEPART(dd,DATEADD(DAY,15,DATEADD(MONTH,3,DATEADD(YEAR,1,emp.DOJ))))-1),DATEADD(DAY,15,DATEADD(MONTH,3,DATEADD(YEAR,1,emp.DOJ)))))As BonusDate,
CONVERT(varchar(max),(DATEDIFF(MONTH,emp.DOB,DATEADD(MONTH,1,DATEADD(DAY,-(DATEPART(dd,DATEADD(DAY,15,DATEADD(MONTH,3,DATEADD(YEAR,1,emp.DOJ))))-1),DATEADD(DAY,15,DATEADD(MONTH,3,DATEADD(YEAR,1,emp.DOJ))))))/12))+' years '+
CONVERT(varchar(max),(DATEDIFF(MONTH,emp.DOB,DATEADD(MONTH,1,DATEADD(DAY,-(DATEPART(dd,DATEADD(DAY,15,DATEADD(MONTH,3,DATEADD(YEAR,1,emp.DOJ))))-1),DATEADD(DAY,15,DATEADD(MONTH,3,DATEADD(YEAR,1,emp.DOJ))))))%12))+' Months',
DATENAME(dw,DATEADD(DAY,15,DATEADD(MONTH,3,DATEADD(YEAR,1,emp.DOJ))))As WeekDayName,
DATENAME(Wk,DATEADD(DAY,15,DATEADD(MONTH,3,DATEADD(YEAR,1,emp.DOJ))))As WeekOfYear,
DATENAME(dy,DATEADD(DAY,15,DATEADD(MONTH,3,DATEADD(YEAR,1,emp.DOJ))))As DayOfYears,
(DATENAME(DD,DATEADD(DAY,15,DATEADD(MONTH,3,DATEADD(YEAR,1,emp.DOJ))))/7)+1 As WeekOfMonth         
from dbo.tblEmployees emp
 
/*20. Company Has decided to Pay a bonus to all its employees. The criteria is as follows  
--20.1. Service Type  1.  Employee Type  1. Minimum service is 10 .  Minimum service left should be 15 Years  . Retirement age will be 60 Years*/

 
 select emp.CentreCode,emp.ServiceType,emp.EmployeeType,
CONVERT(varchar(10),(DATEDIFF(MM,EMP.DOJ,GETDATE())/12))+' years '+
CONVERT(varchar(10),(DATEDIFF(MM,EMP.DOJ,GETDATE())%12))+' months' as MIN_SERVICE,            
CONVERT(varchar(10),(DATEDIFF(MM,EMP.DOB,GETDATE())/12))+' years '+
CONVERT(varchar(10),(DATEDIFF(MM,EMP.DOB,GETDATE())%12))+' months' as MIN_AGE                       
from dbo.tblEmployees emp   
where emp.ServiceType=1 AND emp.EmployeeType=1 AND (DATEDIFF(MM,EMP.DOJ,GETDATE())/12)>=10 AND CONVERT(int,(DATEDIFF(MM,GETDATE(),emp.RetirementDate)/12))>=15 AND DATEDIFF(YEAR,emp.DOB,emp.RetirementDate)>=60 

--20.2. Service Type  1.  Employee Type  2. Minimum service is 12 .  Minimum service left should be 14 Years  . Retirement age will be 55 Years

select emp.CentreCode,emp.ServiceType,emp.EmployeeType,
CONVERT(varchar(10),(DATEDIFF(MM,EMP.DOJ,GETDATE())/12))+' years '+
CONVERT(varchar(10),(DATEDIFF(MM,EMP.DOJ,GETDATE())%12))+' months' as MIN_SERVICE,            
CONVERT(varchar(10),(DATEDIFF(MM,EMP.DOB,GETDATE())/12))+' years '+
CONVERT(varchar(10),(DATEDIFF(MM,EMP.DOB,GETDATE())%12))+' months' as MIN_AGE                       
from dbo.tblEmployees emp   
where emp.ServiceType=1 AND emp.EmployeeType=2 AND (DATEDIFF(MM,EMP.DOJ,GETDATE())/12)>=12 AND CONVERT(int,(DATEDIFF(MM,GETDATE(),emp.RetirementDate)/12))>=14 AND DATEDIFF(YEAR,emp.DOB,emp.RetirementDate)>=55

--20.3. service Type  1.  Employee Type  3. Minimum service is 12 .  Minimum service left should be 12 Years  . Retirement age will be 55 Years

select emp.CentreCode,emp.ServiceType,emp.EmployeeType,
CONVERT(varchar(10),(DATEDIFF(MM,EMP.DOJ,GETDATE())/12))+' years '+
CONVERT(varchar(10),(DATEDIFF(MM,EMP.DOJ,GETDATE())%12))+' months' as MIN_SERVICE,            
CONVERT(varchar(10),(DATEDIFF(MM,EMP.DOB,GETDATE())/12))+' years '+
CONVERT(varchar(10),(DATEDIFF(MM,EMP.DOB,GETDATE())%12))+' months' as MIN_AGE                       
from dbo.tblEmployees emp   
where emp.ServiceType=1 AND emp.EmployeeType=3 AND (DATEDIFF(MM,EMP.DOJ,GETDATE())/12)>=12 AND CONVERT(int,(DATEDIFF(MM,GETDATE(),emp.RetirementDate)/12))>=12 AND DATEDIFF(YEAR,emp.DOB,emp.RetirementDate)>=55

--20.4.for  Service Type 2,3,4 Minimum Service should Be 15 and Minimum service left should be 20 Years   . Retirement age will be 65 Years

select emp.CentreCode,emp.ServiceType,emp.EmployeeType,
CONVERT(varchar(10),(DATEDIFF(MM,EMP.DOJ,GETDATE())/12))+' years '+
CONVERT(varchar(10),(DATEDIFF(MM,EMP.DOJ,GETDATE())%12))+' months' as MIN_SERVICE,            
CONVERT(varchar(10),(DATEDIFF(MM,EMP.DOB,GETDATE())/12))+' years '+
CONVERT(varchar(10),(DATEDIFF(MM,EMP.DOB,GETDATE())%12))+' months' as MIN_AGE                       
from dbo.tblEmployees emp   
where (emp.ServiceType=2 OR emp.ServiceType=3 OR emp.ServiceType=4) AND (DATEDIFF(MM,EMP.DOJ,GETDATE())/12)>=15 AND CONVERT(int,(DATEDIFF(MM,GETDATE(),emp.RetirementDate)/12))>=20 AND DATEDIFF(YEAR,emp.DOB,emp.RetirementDate)>=65

--21. Write a query to display the currentdate in all possible formats using convert function

SELECT CONVERT(VARCHAR(12),GETDATE(), 103)  -- 2/08/2025
SELECT CONVERT(VARCHAR(12),GETDATE(), 105)  -- 02-08-2025
SELECT CONVERT(VARCHAR(12),GETDATE(), 104)  -- 02.08.2025
SELECT CONVERT(VARCHAR(12),GETDATE(), 106)  -- 02 Aug 2025
 SELECT CONVERT(VARCHAR(12),GETDATE(), 101)  -- 08/02/2025
SELECT CONVERT(VARCHAR(12),GETDATE(), 110)  -- 08-02-2025
SELECT CONVERT(VARCHAR(12),GETDATE(), 100)  -- Aug 2 2025
SELECT CONVERT(VARCHAR(12),GETDATE(), 107)  -- Aug 02, 2025
SELECT CONVERT(VARCHAR(12),GETDATE(), 102)  -- 2025.08.02
SELECT CONVERT(VARCHAR(12),GETDATE(), 111)  -- 2025/08/02
SELECT CONVERT(VARCHAR(12),GETDATE(), 112)  -- 20250802

/*22.Use TablpayemployeeParamDetails to write the this query: please understand the significance of each
column in the table also Check out the different values for paramcode in the table.  write a query to find 
out all the employees who has the net payment less than the actual basic that he should have earned,  in any of the payments*/

SELECT emp.EmployeeNumber,
SUM(CASE WHEN emp.TransValue=1 THEN emp.ActualAmount else -emp.ActualAmount END) As ActualSalary,
SUM(CASE WHEN emp.TransValue=1 THEN emp.Amount else -emp.Amount END)As NetSalary
FROM dbo.tblPayEmployeeparamDetails emp
GROUP BY emp.EmployeeNumber,emp.NoteNumber
having SUM(CASE WHEN emp.TransValue=1 THEN emp.ActualAmount else -emp.ActualAmount END) > SUM(CASE WHEN emp.TransValue=1 THEN emp.Amount else -emp.Amount END)
order by emp.EmployeeNumber