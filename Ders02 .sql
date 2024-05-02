SELECT * FROM Categories;

SELECT CategoryID, CategoryName FROM Categories;

SELECT CategoryID as ID , CategoryName as Name FROM Categories;

SELECT * FROM Employees

SELECT EmployeeID as ID , (FirstName +' '+LastName) as FullName FROM Employees;

SELECT EmployeeID as ID , (TitleOfCourtesy+FirstName +' '+LastName) as FullNameWithTitleOC FROM Employees;

SELECT * FROM Employees;

SELECT * FROM Employees WHERE Title LIKE 'Sales%';

SELECT * FROM Employees Where City like 'London'; 

SELECT * FROM Employees WHERE Country like 'USA';

SELECT * FROM Employees WHERE EmployeeID = 1;


SELECT * FROM Employees WHERE EmployeeID <5;
SELECT * FROM Employees WHERE EmployeeID <=5;
SELECT * FROM Employees WHERE EmployeeID >8;
SELECT * FROM Employees WHERE EmployeeID >=8;