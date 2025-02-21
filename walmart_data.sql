-- Active: 1740123357441@@127.0.0.1@3306@walmart_db

SELECT * FROM walmart LIMIT 10;
-- EDA

--To know how many payment methoda are there or distinct them:

SELECT DISTINCT 
  payment_method 
  FROM walmart;

SELECT payment_method,COUNT(*) AS 'count'
FROM walmart
GROUP BY payment_method ORDER BY count DESC;