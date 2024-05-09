/*View Oluşturma*/
/***/
CREATE VIEW [Products Continued] AS
SELECT * FROM Products WHERE Discontinued=0;

/* View Sorgu*/
SELECT * FROM [Products Continued];


/* Stored Procedure Oluşturma*/
/***/
CREATE PROCEDURE AddProduct
@ProductName nvarchar(40),
@UnitPrice money
AS 
INSERT INTO Products (ProductName,UnitPrice)  VALUES (@ProductName,@UnitPrice);

/*STORED PROCEDURE Çalıştırma'*/
EXEC AddProduct @ProductName='Product XYZ', @UnitPrice=70;

SELECT * FROM Products WHERE ProductName='Product CBA';

/*Fonksiyon Oluşturma */

CREATE FUNCTION CalculatePrice(@Price money, @TaxRate float)
RETURNS money 
AS
BEGIN
	RETURN @Price + ( @Price * @TaxRate)
END;

/* Scalar Fonk. Çağırma */ 
SELECT [dbo].[CalculatePrice](100,0.20) As PriceWithTax

/* TRIGGER Oluşturma */
/**/
CREATE TRIGGER Loglama ON Products
AFTER UPDATE
AS
BEGIN
    -- Güncellenen her satır için log kaydı ekleyin
    INSERT INTO ProductLogs(ProductID, LogDate)
    SELECT i.ProductID, GETDATE()
    FROM inserted i;
END;

EXEC AddProduct @ProductName='Product XYZ', @UnitPrice=70;
UPDATE Products SET ProductName='Product XYZ Update', UnitPrice=80  WHERE ProductID=80;

SELECT * FROM ProductLogs;
 /* Ödev Order Details ürünlerin (kalemlerin) toplam fiyatını(dip toplam) Order tablosuna yazılması*/ 

 /*Cursor (imleç) oluşturma) */

 DECLARE @ProductID int;
 DECLARE product_cursor CURSOR FOR
 SELECT ProductID FROM Products;
 OPEN product_cursor;
 FETCH NEXT FROM product_cursor INTO @ProductID;
 WHILE @@FETCH_STATUS=0
 BEGIN
	PRINT @ProductID;
	FETCH NEXT FROM product_cursor INTO @ProductID;
END;
CLOSE product_cursor;
DEALLOCATE product_cursor;

/*

1. View (Görünüm)
Ödev: Northwind veritabanında, müşterilerin son sipariş tarihlerini ve toplam sipariş sayılarını gösteren bir view oluşturun. Bu view, müşteri adı, son sipariş tarihi ve sipariş sayısı sütunlarını içermelidir.

2. Stored Procedure (Saklı Yordam)
Ödev: Müşteri ID'si verildiğinde, bu müşterinin tüm siparişlerini döndüren bir stored procedure yazın. Procedure, sipariş ID'si, sipariş tarihi ve sipariş toplam tutarı gibi bilgileri içermelidir. Ayrıca, belirli bir tarih aralığı için siparişleri filtreleyebilme özelliği ekleyin.

3. Function (Fonksiyon)
Ödev: Bir ürünün ID'si ve satılan miktarı verildiğinde, bu ürünün satışından elde edilen toplam geliri hesaplayan bir scalar function oluşturun. Fonksiyon, ürünün birim fiyatını kullanarak toplam geliri hesaplamalıdır.

4. Trigger (Tetikleyici)
Ödev: Ürünler tablosuna yapılan her ekleme veya güncelleme işlemi sonrasında, bu değişiklikleri kaydeden bir trigger oluşturun. Trigger, değişiklik yapılan ürünün ID'si, eski fiyatı, yeni fiyatı ve değişiklik tarihi gibi bilgileri içeren bir log tablosuna kayıt eklemelidir.

5. Cursor (İmleç)
Ödev: Tüm müşterileri dolaşarak, her müşteri için toplam satın alma miktarını hesaplayan ve bu bilgileri yeni bir tabloya kaydeden bir cursor yazın. Cursor kullanımını minimize etmek ve performansı artırmak için işlemleri mümkün olduğunca optimize edin.
*/







