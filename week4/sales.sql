USE salesorders;

SELECT * FROM customers;
-- columns: 9
-- rows: 28

SELECT VendName, VendStreetAddress, VendState FROM vendors 
ORDER BY VendState DESC;
-- columns: 3
-- rows: 11

UPDATE products
SET RetailPrice = RetailPrice + (RetailPrice * 0.07);
SELECT * FROM products;
-- columns: 6
-- rows: 40

SELECT * FROM orders
INNER JOIN customers
ON orders.CustomerId = customers.CustomerID
ORDER BY OrderDate ASC;
-- columns: 16
-- rows: 944

SELECT * FROM vendors
WHERE VendCity = 'Albany' OR VendCity = 'Anchorage' OR VendCity = 'Dallas';
-- columns: 10
-- rows: 3

SELECT * FROM products
WHERE QuantityOnHand >= 30;
-- columns: 6
-- rows: 9

SELECT * FROM vendors                
WHERE VendEMailAddress IS NULL;
-- columns: 10
-- rows: 5

SELECT EmpFirstName, orders.OrderDate FROM employees
INNER JOIN orders
ON employees.EmployeeID = orders.EmployeeID
ORDER BY orders.OrderDate;
-- columns: 2
-- rows: 944

SELECT VendName, VendState, product_vendors.ProductNumber FROM vendors
INNER JOIN product_vendors
ON vendors.VendorID = product_vendors.VendorID
WHERE VendState = 'TX';
-- columns: 3
-- rows: 36

SELECT * FROM employees
INNER JOIN vendors                                
ON employees.EmpCity = vendors.VendCity;
-- columns: 19
-- rows: 2

SELECT DISTINCT CustState, EmpState FROM customers
INNER JOIN employees      
WHERE customers.CustState NOT IN (SELECT EmpState FROM employees);
-- columns: 2
-- rows: 4

SELECT avg(RetailPrice) AS 'Average Price' FROM products
WHERE ProductName LIKE '%helmet%';
-- columns: 1
-- rows: 1

SELECT MIN(ShipDate) FROM orders;
-- columns: 1
-- rows: 1

SELECT SUM(OrderTotal), customers.CustState FROM orders
INNER JOIN customers
WHERE customers.CustState = 'OR';
-- columns: 2
-- rows: 1

SELECT employees.EmployeeID, SUM(OrderTotal), AVG(order_details.ProductNumber), AVG(QuotedPrice), SUM(QuantityOrdered) FROM employees
INNER JOIN orders
ON orders.EmployeeID = employees.EmployeeID
INNER JOIN order_details
ON order_details.OrderNumber = orders.OrderNumber
GROUP BY employees.EmployeeID
ORDER BY AVG(QuotedPrice) DESC;
-- columns: 5
-- rows: 8