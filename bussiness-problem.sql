
--PROBLEM STATEMENT 1
--FIND A DIFFERENT PAYMENT METHOD AND QUANTITY SOLD AND NUMBER OF TRANSCATIONS

SELECT payment_method,COUNT(*) AS 'count',SUM(quantity) AS total_quantity
 FROM walmart
  GROUP BY payment_method
   ORDER BY count DESC;

--PROBLEM STATEMENT 2
--IDENTIFY THE HIGHEST RATED CATEGORY IN EACH BRANCH,DISPLAYING THE BRANCH,CATEGIORY,AVG RATING

SELECT *
  FROM
    (
      SELECT
       branch,
       category,
       AVG(rating) AS avg_rating,
       RANK() OVER(PARTITION BY branch ORDER BY AVG(rating) DESC) AS ranked
        FROM walmart
        GROUP BY branch,category
    )
    AS Total_Data WHERE ranked=1;

--PROBLEM STATEMENT 3
--IDENTIFY THE BUSIEST DAY FOR EACH BRANCH BASED ON THERE NUMBER OF TRANSCATIONS

  SELECT *
  FROM
  (
    SELECT
    branch,
    DAYNAME(STR_TO_DATE(date, '%d/%m/%y')) AS day_name,
    COUNT(*) AS num_trans_total,
    RANK() OVER(PARTITION BY branch ORDER BY COUNT(*) DESC) AS ranked
    FROM walmart
    GROUP BY branch,day_name
  ) AS subquery
  WHERE ranked=1;

--PROBLEM STATEMENT 4
-- DETERMINE THE AVG,MIN,MAX RATING OF CATEGORY FOR EACH CITY,LIST THE CITY AVG,MIN,MAX RATING
SELECT
  city,
  category,
  MAX(rating) as max_rating,
  MIN(rating) as min_rating,
  AVG(rating) as avg_rating
FROM walmart
GROUP BY city,category;

--PROBLEM STATEMENT 5
--CALCULATE THE TOTAL PROFIT FOR EACH CATEGORY BY CONSIDERING TOTAL_PROFIT AS(unit_price * quantity * profit_margin),LIST CATEGORY AND TOTAL_PROFIT,ORDERED FROM HIGHEST TO LOWEST PROFIT

SELECT 
  category,
  SUM(total) as total_revenue,
  SUM(total * profit_margin) as profit
FROM walmart
GROUP BY category ORDER BY profit DESC;

--PROBLEM STATEMENT 6
--DETERMINE THE MOST COMMON PAYMENT FOR EACH BRANCH DISPLAY BRANCH AND THE PREFERRED_PAYMENT_METHOD.

SELECT * 
FROM(
  SELECT 
  branch,
  payment_method,
  COUNT(*) as total_transcations,
  RANK() OVER(PARTITION BY branch ORDER BY COUNT(*) DESC) as ranked
FROM walmart
GROUP BY branch,payment_method
) as subquery
WHERE ranked=1

--PROBLEM STATEMENT 7
--CATEGORIZE SALES INTO 3 GROUP MORNING,AFTERNOON,EVENING FIND OUT WHICH OF THE SHIFT AND NUMBER OF INVOICES. 

SELECT
  branch,
  CASE 
    WHEN HOUR(STR_TO_DATE(time,'%H:%i:%s')) < 12 THEN 'Morning'
    WHEN HOUR(STR_TO_DATE(time,'%H:%i:%s')) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE  'Evening'
  END as day_time,
  COUNT(*)
FROM walmart
GROUP BY branch,day_time
ORDER BY branch;

--PROBLEM STATEMENT 8
--IDENTIFY 5 BRANCH WITH HIGHEST DECREASE RATIO IN REVEVENUE COMPARE TO LAST YEAR(CURRENT YEAR 2023 AND LAST YEAR 2022)

WITH
revenue_2022
AS
(
SELECT
  branch,
  SUM(total) as revenue
FROM walmart
WHERE YEAR(STR_TO_DATE(date, '%d/%m/%y')) = 2022
GROUP BY branch
),
revenue_2023
AS
(
SELECT
  branch,
  SUM(total) as revenue
FROM walmart
WHERE YEAR(STR_TO_DATE(date, '%d/%m/%y')) = 2023
GROUP BY branch
) 
SELECT 
  ls.branch,
  ls.revenue as last_year_revenue,
  cs.revenue as current_year_revenue,
  ROUND((ls.revenue-cs.revenue)/ls.revenue*100,2) as rdr_ratio
FROM
revenue_2022 as ls
JOIN
revenue_2023 as cs
ON ls.branch=cs.branch
WHERE ls.revenue > cs.revenue
ORDER BY rdr_ratio DESC
LIMIT 5;

--End--