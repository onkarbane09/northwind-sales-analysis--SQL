-- 1. Total Sales by Product Category
SELECT 
    c.CategoryName,
    SUM(od.UnitPrice * od.Quantity) AS TotalSales
FROM 
    [Order Details] od
JOIN Products p ON od.ProductID = p.ProductID
JOIN Categories c ON p.CategoryID = c.CategoryID
GROUP BY 
    c.CategoryName
ORDER BY 
    TotalSales DESC;

-- 2. Top 5 Revenue-Generating Customers
SELECT TOP 5 
    cu.CompanyName,
    SUM(od.UnitPrice * od.Quantity) AS Revenue
FROM 
    Customers cu
JOIN Orders o ON cu.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY 
    cu.CompanyName
ORDER BY 
    Revenue DESC;

-- 3. Monthly Sales Trend
SELECT 
    FORMAT(o.OrderDate, 'yyyy-MM') AS SalesMonth,
    SUM(od.UnitPrice * od.Quantity) AS MonthlySales
FROM 
    Orders o
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY 
    FORMAT(o.OrderDate, 'yyyy-MM')
ORDER BY 
    SalesMonth;

-- 4. Average Order Value per Customer
SELECT 
    cu.CompanyName,
    COUNT(DISTINCT o.OrderID) AS OrderCount,
    SUM(od.UnitPrice * od.Quantity) / COUNT(DISTINCT o.OrderID) AS AvgOrderValue
FROM 
    Customers cu
JOIN Orders o ON cu.CustomerID = o.CustomerID
JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY 
    cu.CompanyName
ORDER BY 
    AvgOrderValue DESC;
