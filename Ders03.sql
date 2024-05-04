SELECT * FROM Categories;
SELECT * FROM Products;
SELECT * FROM Suppliers;

SELECT Products.ProductID, Products.ProductName, Categories.CategoryName, Suppliers.CompanyName
FROM     Categories INNER JOIN
                  Products ON Categories.CategoryID = Products.CategoryID INNER JOIN
                  Suppliers ON Products.SupplierID = Suppliers.SupplierID


SELECT p.ProductID, p.ProductName, c.CategoryName, s.CompanyName
FROM     Products p INNER JOIN
                  Categories c ON p.CategoryID = c.CategoryID INNER JOIN
                  Suppliers s ON p.SupplierID = s.SupplierID


SELECT Products.ProductID ,Products.ProductName ,Products.CategoryID,Categories.CategoryName 
	FROM Products  
		INNER JOIN Categories  ON Products.CategoryID=Categories.CategoryID

SELECT p.ProductID ,p.ProductName ,p.CategoryID,c.CategoryName ,s.CompanyName 
	FROM  Products p 
		INNER JOIN Categories c ON p.CategoryID=c.CategoryID
		INNER JOIN Suppliers s ON p.SupplierID=s.SupplierID


SELECT Products.ProductID, Products.ProductName, Categories.CategoryName, Suppliers.CompanyName
FROM     Products 
	INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID 
	INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID



SELECT p.[ProductID],p.[ProductName] FROM [dbo].[Products] p


SELECT Customers.CompanyName, Orders.OrderID, Orders.OrderDate, [Order Details].UnitPrice, [Order Details].Quantity, Products.ProductName, [Order Details].Discount
FROM     Customers INNER JOIN
                  Orders ON Customers.CustomerID = Orders.CustomerID INNER JOIN
                  [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN
                  Products ON [Order Details].ProductID = Products.ProductID

SELECT * FROM Products

SELECT * FROM Suppliers


/*c CROSSS JOIN */ 
SELECT p.ProductName as 'Ürün Adı' , s.CompanyName As 'Tedarikçi Şirket'  FROM Products p CROSS JOIN Suppliers s;
/*Bu sorgu, tüm ürünler ile tüm tedarikçiler arasındaki tüm olası kombinasyonları listeler. 
CROSS JOIN, her bir tedarikçi için her bir ürünü eşleştirir, bu yüzden ürün sayısı ile tedarikçi sayısının çarpımı kadar sonuç döndürür.*/


/*LEFT OUTER JOIN*/

SELECT c.CustomerID,c.CompanyName,o.OrderID FROM Customers c LEFT OUTER JOIN Orders o ON c.CustomerID=o.CustomerID
/*
Bu sorgu, tüm müşterileri ve eğer varsa onlara ait siparişleri listeler. Siparişi olmayan müşteriler de listeye dahil edilir,
ancak sipariş bilgileri NULL olarak gösterilir.
*/


/*RIGHT OUTER JOIN */

SELECT c.CustomerID,c.CompanyName,o.OrderID FROM Customers c RIGHT OUTER JOIN Orders o ON c.CustomerID=o.CustomerID;

/*Bu sorgu, tüm siparişleri ve eğer varsa onlara ait müşteri bilgilerini listeler.
Müşteri bilgisi olmayan siparişler de listeye dahil edilir, ancak müşteri bilgileri NULL olarak gösterilir.*/

/*FULL OUTER JOIN*/ 

SELECT c.CustomerID,c.CompanyName,o.OrderID FROM Customers c FULL OUTER JOIN Orders o ON c.CustomerID=o.CustomerID;

/*Bu sorgu, tüm müşterileri ve tüm siparişleri listeler. Eşleşmeyen müşteri veya siparişler de dahil edilir, eşleşmeyen alanlar NULL olarak gösterilir*/

/*SELF JOIN */

SELECT * FROM Employees

SELECT a.EmployeeID as 'Çalışan ID' , (a.FirstName+ ' ' + a.LastName) as 'Çalışan İsmi',
	b.EmployeeID AS 'Yönetici ID',(b.FirstName+ ' ' + b.LastName) as 'Yönetici İsmi'
 FROM Employees a LEFT JOIN Employees b ON a.ReportsTo= b.EmployeeID;

 /*
 Bu sorgu, çalışanlar tablosunu kendisiyle birleştirerek (SELF JOIN), her çalışanın yanında onun yöneticisinin bilgilerini de gösterir.
 */