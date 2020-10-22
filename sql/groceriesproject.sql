-- Create table of the data
CREATE TABLE groceries_list (
  number INT PRIMARY KEY,
  member_number INT,
  date DATE,
  item_description VARCHAR(50)
  );

-- check the data if there's NULL or not
SELECT *
FROM groceries_list
WHERE member_number = NULL OR date = NULL OR item_description = NULL;

-- top 10 selling products
SELECT item_description AS Item, COUNT(item_description) AS "Item Count"
FROM groceries_list
GROUP BY item_description
ORDER BY COUNT(item_description) DESC
LIMIT 10;

-- top 10 unsold products
SELECT item_description AS Item, COUNT(item_description) AS "Item Count"
FROM groceries_list
GROUP BY item_description
ORDER BY COUNT(item_description)
LIMIT 10;

-- top 5 customers who buy frequently
SELECT member_number AS member, COUNT(item_description) AS "Quantity"
FROM groceries_list
GROUP BY member
ORDER BY COUNT(item_description) DESC
LIMIT 5;

-- first, we must know what year the data is consisting
SELECT DISTINCT(YEAR(date)) AS tahun
FROM groceries_list;

SELECT COUNT(item_description) AS "Item Count", YEAR(date) AS tahun
FROM groceries_list
GROUP BY tahun;

-- groceries top bought by month in 2015 & 2014

SELECT COUNT(item_description) AS "Item Count", MONTH(date) as bulan
FROM groceries_list
GROUP by bulan
ORDER BY bulan;

SELECT COUNT(item_description) AS "Item Count", date
FROM groceries_list
WHERE YEAR(date) = '2015'
GROUP by month(date)
ORDER BY month(date);

SELECT COUNT(item_description) AS "Item Count", MONTHname(date) as bulan
FROM groceries_list
WHERE YEAR(date) = '2015'
GROUP by bulan
ORDER BY bulan;

-- count member
SELECT member_number AS 'number of number', COUNT(member_number) as total
FROM groceries_list
GROUP BY member_number
ORDER BY total DESC;

-- count item by day of week
SELECT weekday(date) AS tanggal, count(item_description) AS total
FROM groceries_list
GROUP BY tanggal
ORDER BY tanggal;

SELECT dayname(date) AS tanggal, count(item_description) AS total
FROM groceries_list
WHERE YEAR(date) = '2015'
GROUP BY tanggal
ORDER BY total DESC;

SELECT dayname(date) AS tanggal, count(item_description) AS total
FROM groceries_list
WHERE YEAR(date) = '2014'
GROUP BY tanggal;

-- count item by monday - sunday in month

SELECT COUNT(item_description) AS "Item Count", weekday(date) AS hari
FROM groceries_list
GROUP BY hari
ORDER BY hari;

