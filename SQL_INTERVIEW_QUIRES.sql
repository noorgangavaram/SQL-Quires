CREATE TABLE EmployeeInfo (EmpID int, EmpFname varchar(20),EmpLname varchar(20), Department varchar(20),Salary int);

INSERT INTO EmployeeInfo values(1,'karna','mehata','Hr',30000);
INSERT INTO EmployeeInfo values(2,'Rohit', 'sharma','Admin',75000);
INSERT INTO EmployeeInfo values(3,'Anushka', 'Rajput','Account',6000);
INSERT INTO EmployeeInfo values(4,'Priyanshi', 'shrma','Hr',50000);
INSERT INTO EmployeeInfo values(5,'sanket', 'gupta','Developer',100000);
INSERT INTO EmployeeInfo values(6,'Anushka', 'Rajput','Account',6000);


select * from EmployeeInfo;

--1 Write a query to find the THIRD-HIGHEST salary from the EmployeeInfo table
Select top 1 * from (Select top 3 Salary From EmployeeInfo order by Salary Desc) as InnerQuery order by Salary Asc


--2 write a query to find duplicate rows in a table
Select EmpFname,Department,count(*) from EmployeeInfo Group by EmpFname,Department having count(*)>1;


--3 Write a query to calulate the even and odd Rows from the table
Select * from EmployeeInfo where EmpID % 2 != 0;


--4 Write a query to display first and last row from the table

Select * from EmployeeInfo where EmpId = (Select Min(EmpID) from EmployeeInfo)

select * from EmployeeInfo where EmpId = (Select Max(EmpID) from EmployeeInfo)


--5 HOW DO YOU COPY ALL ROWS OF A TABLE 
Select * Into NewTbale from EmployeeInfo  -- This will copy everything along with the data alse
drop table NewTbale
Select * Into newTable1 from EmployeeInfo where 100=100    -- this will copy only schema but not data
drop table newTable1
Select * from newTable1


--6 WRITE A QUERY TO RETRIVE THE LIST OF EMPLOYEES WORKING IN THE SAME DEPARTMENT
Select E.* from EmployeeInfo E,EmployeeInfo E1
where E.Department = E1.Department
And E.EmpID != E1.EmpID


--7 WRITE A QUERY TO RETRIVE THE LIST OF EMPLOYEES WORKING WITH THE SAME SALARY
Select E.* from EmployeeInfo E,EmployeeInfo E2
where E.Salary = E2.Salary
And E.EmpID != E2.EmpID


--8 WRITE A QUERY TO RETRIVE THE LAST 3 RECORDS FROM THE TABLE
Select * from (Select Top 3 * from EmployeeInfo Order By EmpID Desc)as Innerquery order By EmpID Asc


-- 9 WRITE A QUERY TO FETCH THE DETAILS OF EMPLOYEE WHOSE NAME ENDS WITH 'T'
Select * from EmployeeInfo where EmpFname Like '_____t'


--10 WRITE A QUERY TO DELETE THE DUPLICATE ROWS FROM THE TABLE
Delete E1 from EmployeeInfo E1, EmployeeInfo E2  
where E1.EmpFname = E2.EmpFname
And E1.EmpID > E2.EmpID


--11 WRITE A QUERY TO RETRIVE THE FIRST 4 CHARACTER OF EMP NAME FROM THE EMP TABLE
Select SUBSTRING(EmpFname,1,3) as Substirng from EmployeeInfo



CREATE TABLE employee_info (Id int, Name varchar(20), Email varchar(20), Department varchar(20), Salary int, DOB date, gender varchar(20));
INSERT INTO employee_info VALUES
(1, 'Karan Mehta', 'Karan@gmail.com','HR', 300000, '1998-05-10','M'),
(2, 'Rohit Sharma', 'Rohit@gmail.com','Admin', 75000, '1997-01-25','M'),
(3, 'Ankush Rajput', 'Ankush@gmail.com','Accounts', 60000, '1998-02-09','M'),
(4, 'Priyanshi Sharma', 'Priyanshi@gmail.com','HR', 500000, '1998-06-15','F'),
(5, 'Sanket Gupta', 'Sanket@gmail.com','Developer', 100000, '1997-05-07','M'),
(6, 'Shruti Kapoor', 'Shruti@gmailcom','Admin', 80000, '1995-11-26','F'),
(7, 'Rohit Sharma', 'Rohit@gmail.com','Admin', 75000, '1997-01-25','M');

Select * from employee_info

--12 WRITE A QUERY TO FIND NO.OF EMPLOYEES WHOSE DOB IS BTWEEN '1997-05-07' AND 1998-05-10 AND ARE GROUPED ACCORDING TO GENDER
Select count(*) as count_,gender from employee_info
where DOB Between '1997-05-07' and '1998-05-10'
Group By gender


--13 WRITE A QUERY TO FETCH ALL THE RECORDDS FROM THE EMP TABLE ORDER BY DEPARTMENT 
Select * from employee_info order by Department Asc, Salary desc


--14 WRITE A QUERY TO FETCH DETAILS OF ALL EMPLOYEES EXCLUDING THE EMPLOYEE WHOSE DEPARTMENT IS HR,ADMIN
Select * from employee_info where Department Not in('Hr','Admin')


--15 WRITE A QUERY TO FETCH 50% RECORDS FROM THE EMPLOYEE TABLE
Select * from employee_info where Id <= (Select count(Id)/2 from employee_info) 


--16 WRITE A QUERY TO DISPLAY THE TOTAL SALARY OF EACH EMPLOYEE AFTER ADDING 10% INCREMENT IN THE SALARY
select *, salary+ (salary/10) as totalSalary from employee_info 


--17 WRITE A QUERY TO REPLACE SAPCE WITH '_'
Select REPLACE(Name,' ','_') from employee_info


--18 WRITE A QUERY TO GET CURRENT DATE
Select GETDATE()


--19 WRITE A QUERY TO RETRIVE THE EMPFNAME AND EMPLNAME IN SINGLE COLUMN AS FULL NAME
Select * from EmployeeInfo
Select CONCAT(EmpFname, ' ',EmpLname) as FullName from EmployeeInfo



--20 WRITE A QUERY TO FIND THE Nth HIGHEST SALARY FROM THE TABLE WITHOUT USING TOP KEYWORD
select max(Salary) from EmployeeInfo 

Select * from EmployeeInfo e1
where 3-1 = (Select Count(*) from EmployeeInfo e2 where e2.Salary>e1.Salary)


------------------------------------------------------------------------------------------------------


-- QUIRES ON JOINS

create table t1(id1 int)

insert into t1 values(1)
insert into t1 values(1)
insert into t1 values(20)
insert into t1 values(null)




create table t2(id2 int)

insert into t2 values(1)
insert into t2 values(1)
insert into t2 values(1)
insert into t2 values(30)
insert into t2 values(null)
insert into t2 values(null)

Select * from t1
select * from t2

---Inner Join
Select * from t1
inner join t2
on t1.id1 = t2.id2

--Left Join
select * from t1
left join t2
on t1.id1 = t2.id2

--Right Join
select * from t1
right join t2
on t1.id1 = t2.id2

--Full outter Join
select * from t1
full join t2
on t1.id1 = t2.id2

--self join
