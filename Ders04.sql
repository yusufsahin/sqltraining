
/*JOIN Örnekleri*/
Select p.ProductName,c.CategoryName From Products p INNER JOIN Categories c ON p.CategoryID=c.CategoryID;

/*LEFT JOIN Sipariş vermemiş müşteriler dahil olmak üzere
Order yoksa OrderID null döner
*/

SELECT c.CustomerID,c.CompanyName,o.OrderID,o.OrderDate FROM Customers c LEFT JOIN Orders o ON c.CustomerID=o.CustomerID;

/*RIGHT JOIN Sipariş vermiş  müşteriler */

SELECT c.CustomerID,c.CompanyName,o.OrderID,o.OrderDate FROM Customers c RIGHT JOIN Orders o ON c.CustomerID=o.CustomerID ORDER BY c.CustomerID;
Select * From Customers

/*Farklı Tedarikçileriden gelen ürünleri listeme ve ülkeye filtreleme */


SELECT p.ProductName , s.CompanyName FROM Products p JOIN Suppliers s ON p.SupplierID=s.SupplierID WHERE s.Country='Germany'


/* 2. Agregat Fonksiyonlar ve Gruplama */

/* Ürünlerin Ortalama Fiyatı */
SELECT AVG(p.UnitPrice) AVGPrice FROM Products p; 

/*Category e göre Ortama Fiyatlr*/ 
SELECT C.CategoryName,AVG(p.UnitPrice) AVGPriceByCategoryName FROM Products p JOIN Categories c on p.CategoryID=c.CategoryID GROUP BY c.CategoryName;

/*Pencere Fonksiyonları */

/*Çalışanların Toplam Satış Sıralaması Pnecere Fonk. */

SELECT DISTINCT
    e.EmployeeID,
 e.FirstName, 
    e.LastName ,
    SUM(od.Quantity * od.UnitPrice) OVER (PARTITION BY e.EmployeeID) AS TotalSales
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN [Order Details] od ON o.OrderID = od.OrderID
ORDER BY TotalSales DESC;

 /* Çalışan toplam satışı Group By ile  */
SELECT
	e.EmployeeID,
    e.FirstName, 
    e.LastName, 
    SUM(od.Quantity * od.UnitPrice) AS TotalSales
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY TotalSales DESC;

/*belirli bir kategoriye ait ürünleri satın alan müşterileri listeleme*/ 
/*IN ile subquery*/
SELECT DISTINCT c.CustomerID, c.CompanyName FROM Customers c
	JOIN Orders o on c.CustomerID=o.CustomerID
	JOIN [Order Details] od ON o.OrderID=od.OrderID
	JOIN Products p ON od.ProductID=p.ProductID
	WHERE p.CategoryID IN (SELECT CategoryID FROM Categories WHERE Categories.CategoryName='Beverages');

/*en az bir sipariş vermiş müşterileri listeleme*/
/*EXIST ile Subquery*/

SELECT CustomerID,CompanyName FROM Customers c WHERE EXISTS (SELECT 1 FROM Orders o WHERE c.CustomerID=o.CustomerID);

/* Correlated Subqueries*/
/*Her ReportTo ya göre en yüksek maaşı alan çalışanı bulma.
Salary Colonu eklenmesi lazım (money)*/


SELECT * FROM Employees e 
SELECT e.EmployeeID, e.FirstName, e.LastName, e.Salary
FROM Employees e
WHERE e.Salary = (
    SELECT MAX(Salary)
    FROM Employees
    WHERE ReportsTo = e.ReportsTo
);

/*Metin işlemleri */

/*Employee tam adını (ilk adı ve soyadı) birleştirerek listele.*/

SELECT CONCAT(e.Firstname ,' ', e.LastName) AS FullName FROM Employees e;

/* Her müşterinin şirket adının karakter sayısını hesapla.*/

SELECT CompanyName,LEN(CompanyName) as NameLenght FROM Customers;

/*Her ürünün adından ilk 5 karakteri al.*/

SELECT ProductName,SUBSTRING(ProductName,1,5) FROM Products

/*Büyük Harfle gösterme*/
SELECT UPPER(CompanyName)  FROM Customers
 
 /*Boşluklar _ çizgi ile değiştirilsin*/

 SELECT REPLACE(CompanyName,' ','_') As ModifiedCompanyName FROM Customers;

 SELECT LTRIM(RTRIM(Address)) FROM Customers

 /*DateTime Fonksiyonları*/

 SELECT GETDATE() AS CurrentDateTime

 /* Belirli bir tarihe belirli bir zaman eklemek*/

 SELECT * FROM Orders

 SELECT OrderID, OrderDate ,DATEADD(YEAR,20,OrderDate) TwentyYearsLater FROM Orders

 SELECT OrderID, OrderDate ,DATEADD(YEAR,-1,OrderDate) OneYearAgo FROM Orders


 /* İki tarih arasındaki farkı belirli bir zaman birimi cinsinden hesaplamak.*/

SELECT OrderID, OrderDate, RequiredDate, DATEDIFF(day, OrderDate, RequiredDate) AS DaysBetween FROM Orders;


/*Tarih ve saati belirli bir format düzenine göre göstermek*/ 
SELECT OrderID, FORMAT(OrderDate, 'dd/MM/yyyy') AS FormattedOrderDate FROM Orders;


SELECT OrderID, OrderDate, 
       YEAR(OrderDate) AS Year, 
       MONTH(OrderDate) AS Month, 
       DAY(OrderDate) AS Day
FROM Orders;


/*Her ülkede kaç müşteri olduğunu hesaplar ve sadece 5'ten fazla müşteriye sahip ülkeleri listeler*/

SELECT Country,COUNT(*) AS CustomerCount FROM Customers GROUP BY Country HAVING COUNT(*)>5 ORDER BY CustomerCount DESC;

/* her ürün kategorisindeki ortalama ürün fiyatını hesaplar ve ortalama fiyatı 50'den fazla olan kategorileri gösterir. */

SELECT c.CategoryName,AVG(p.UnitPrice) as AveragePrice 
FROM Products p 
	JOIN Categories c ON p.CategoryID=c.CategoryID
	GROUP BY c.CategoryName
	HAVING AVG(p.UnitPrice)>30 ORDER BY AveragePrice

/* her çalışanın yönettiği toplam sipariş sayısını hesaplar ve 10'dan fazla sipariş yönetmiş çalışanları listeler*/

SELECT e.FirstName , e.LastName , COUNT(o.OrderID) AS TotalOrders FROM Employees e
JOIN Orders o ON e.EmployeeID=o.EmployeeID GROUP BY e.EmployeeID,e.FirstName,e.LastName
HAVING COUNT(o.OrderID)>10 ORDER BY TotalOrders


/*Toplam Satış Miktarına Göre Ürünleri Sıralama ve Belirli Bir Satış Miktarını Aşan Ürünleri Listeleme*/

/*her ürün için toplam satış miktarını (birim fiyat çarpı miktar) hesaplar ve toplam satış miktarı 10000'den fazla olan ürünleri listeler*/

SELECT p.ProductName, SUM(od.Quantity * od.UnitPrice) AS TotalRevenue
FROM Products p
JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName
HAVING SUM(od.Quantity * od.UnitPrice) > 10000
ORDER BY TotalRevenue DESC;

/*Belirli Tarih Aralığında Sipariş Veren Müşterileri Listeleme*/


SELECT DISTINCT c.CustomerID,c.CompanyName FROM Customers c
JOIN Orders o ON c.CustomerID=o.CustomerID
WHERE o.OrderDate BETWEEN '1997-01-01' AND '1997-02-28'
ORDER BY c.CompanyName;


/* Belirli Bir Miktarda Satış Yapan Çalışanları Listeleme*/
/*toplam satış miktarı 10.000 ile 50.000 arasında olan çalışanları gösteriyoruz.*/

SELECT e.FirstName, e.LastName, SUM(od.UnitPrice * od.Quantity) AS TotalSales
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
HAVING SUM(od.UnitPrice * od.Quantity) BETWEEN 5000 AND 100000
ORDER BY TotalSales DESC;


/*Her Müşteriye Göre Toplam Sipariş Sayısı*/
SELECT c.CustomerID, c.CompanyName, COUNT(o.OrderID) AS TotalOrders
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CompanyName
ORDER BY TotalOrders DESC;

/*müşterilere göre yapılan toplam sipariş miktarını listeler ve en çok sipariş veren müşterileri sıralar.*/

SELECT c.CustomerID, c.CompanyName, SUM(od.Quantity) AS TotalProductsOrdered
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID, c.CompanyName
ORDER BY TotalProductsOrdered DESC;