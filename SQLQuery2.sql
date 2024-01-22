--- 1 Fiyatı ortalama fiyatın üstünde olan ürünler
SELECT *
FROM Products
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products);
 

 --- 2 Ürünler tablosudaki satılan ürünlerin listesi
SELECT *
FROM Products
WHERE ProductID IN (SELECT DISTINCT ProductID FROM [Order Details]);

--- 3 Ürünler tablosudaki satılmayan ürünlerin listesi
SELECT *
FROM Products
WHERE ProductID NOT IN (SELECT DISTINCT ProductID FROM [Order Details]);


--- 4 Kargo şirketlerinin taşıdıkları sipariş sayıları
SELECT ShipAddress, COUNT(ShipVia) AS TotalOrders
FROM Orders
GROUP BY ShipAddress;


--- 5 Sipariş Alan Çalışanları Listeleyiniz
SELECT EmployeeID,FirstName,LastName FROM Employees
WHERE EmployeeID IN (SELECT DISTINCT EmployeeID FROM Orders)