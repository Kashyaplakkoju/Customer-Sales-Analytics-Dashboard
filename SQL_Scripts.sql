-- ==========================================
-- 📊 Sales Analytics SQL Queries
-- ==========================================

-- 1. Total Revenue
SELECT SUM(Revenue) AS TotalRevenue
FROM sales_data;

-- 2. Total Orders
SELECT COUNT(OrderID) AS TotalOrders
FROM sales_data;

-- 3. Average Order Value (AOV)
SELECT SUM(Revenue) / COUNT(OrderID) AS AvgOrderValue
FROM sales_data;

-- 4. Total Defective Orders (%)
SELECT 
    (SUM(CASE WHEN DefectStatus = 'Defective' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) 
    AS DefectivePercentage
FROM sales_data;

-- 5. Top 5 Products by Revenue
SELECT Product, SUM(Revenue) AS TotalRevenue
FROM sales_data
GROUP BY Product
ORDER BY TotalRevenue DESC
LIMIT 5;

-- 6. Revenue by Category
SELECT Category, SUM(Revenue) AS TotalRevenue
FROM sales_data
GROUP BY Category
ORDER BY TotalRevenue DESC;

-- 7. Monthly Revenue Trend
SELECT 
    DATE_FORMAT(OrderDate, '%Y-%m') AS Month,
    SUM(Revenue) AS MonthlyRevenue
FROM sales_data
GROUP BY DATE_FORMAT(OrderDate, '%Y-%m')
ORDER BY Month;

-- 8. Orders by Defect Status
SELECT DefectStatus, COUNT(*) AS TotalOrders
FROM sales_data
GROUP BY DefectStatus;

-- 9. Top Customers by Revenue (optional)
SELECT CustomerID, SUM(Revenue) AS TotalRevenue
FROM sales_data
GROUP BY CustomerID
ORDER BY TotalRevenue DESC
LIMIT 10;
