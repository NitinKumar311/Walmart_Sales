-- Walmart Project Queries

SELECT * FROM walmart;

-- DROP TABLE walmart;

-- 
SELECT COUNT(*) FROM walmart;



SELECT 
	 payment_method,
	 COUNT(*)
FROM walmart
GROUP BY payment_method




SELECT 
    COUNT(DISTINCT "Branch") AS total_branches
FROM walmart;




SELECT MIN(quantity) FROM walmart;



-- Business Problems
--Q.1 Find different payment method and number of transactions, number of qty sold


SELECT 
	 payment_method,
	 COUNT(*) as no_payments,
	 SUM(quantity) as no_qty_sold
FROM walmart
GROUP BY payment_method




-- Project Question #2
-- Identify the highest-rated category in each branch, displaying the branch, category
-- AVG RATING

select
	"Branch",
	category,
	AVG(rating) as avg_rating
from walmart
group by 1,2
order by 1,3 DESC



-- Q.3 Identify the busiest day for each branch based on the number of transactions

SELECT *
FROM (
    SELECT 
        "Branch",
        TO_CHAR(TO_DATE(date, 'DD/MM/YY'), 'Day') AS day_name,
        COUNT(*) AS no_transactions,
        RANK() OVER (
            PARTITION BY "Branch"
            ORDER BY COUNT(*) DESC
        ) AS rank
    FROM walmart
    GROUP BY 1, 2
) t
WHERE rank = 1;


-- Q. 4 
-- Calculate the total quantity of items sold per payment method. List payment_method and total_quantity.

SELECT 
	 payment_method,
	 -- COUNT(*) as no_payments,
	 SUM(quantity) as no_qty_sold
FROM walmart
GROUP BY payment_method


-- Q.5
-- Determine the average, minimum, and maximum rating of category for each city. 
-- List the city, average_rating, min_rating, and max_rating.

SELECT 
	"City",
	category,
	MIN(rating) as min_rating,
	MAX(rating) as max_rating,
	AVG(rating) as avg_rating
FROM walmart
GROUP BY 1, 2



-- Q.6
-- Calculate the total profit for each category by considering total_profit as
-- (unit_price * quantity * profit_margin). 
-- List category and total_profit, ordered from highest to lowest profit.

SELECT 
    category,
    SUM(total_price) AS total_revenue,
    SUM(total_price * profit_margin) AS profit
FROM walmart
GROUP BY category;


-- Q.7
-- Determine the most common payment method for each Branch. 
-- Display Branch and the preferred_payment_method.


WITH cte AS (
    SELECT 
        "Branch",
        payment_method,
        COUNT(*) AS total_trans,
        RANK() OVER (
            PARTITION BY "Branch"
            ORDER BY COUNT(*) DESC
        ) AS rnk
    FROM walmart
    GROUP BY "Branch", payment_method
)

SELECT *
FROM cte
WHERE rnk = 1;

-- Q.8
-- Categorize sales into 3 group MORNING, AFTERNOON, EVENING 
-- Find out each of the shift and number of invoices


SELECT
    "Branch",
    CASE 
        WHEN EXTRACT(HOUR FROM time::time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM time::time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(*) AS num_invoices
FROM walmart
GROUP BY "Branch", shift
ORDER BY "Branch", num_invoices DESC;




-- 
-- #9 Identify 5 branch with highest decrese ratio in 
-- revevenue compare to last year(current year 2023 and last year 2022)

-- rdr == last_rev-cr_rev/ls_rev*100

-- 2022 vs 2023 revenue comparison

-- Check formatted year


SELECT *,
       EXTRACT(YEAR FROM TO_DATE(date, 'DD/MM/YY')) AS formatted_year
FROM walmart;

-- 2022 vs 2023 revenue comparison
WITH revenue_2022 AS (
    SELECT 
        "Branch",
        SUM(total_price) AS revenue
    FROM walmart
    WHERE EXTRACT(YEAR FROM TO_DATE(date, 'DD/MM/YY')) = 2022
    GROUP BY "Branch"
),

revenue_2023 AS (
    SELECT 
        "Branch",
        SUM(total_price) AS revenue
    FROM walmart
    WHERE EXTRACT(YEAR FROM TO_DATE(date, 'DD/MM/YY')) = 2023
    GROUP BY "Branch"
)

SELECT 
    ls."Branch",
    ls.revenue AS last_year_revenue,
    cs.revenue AS current_year_revenue,
    ROUND(
        (ls.revenue - cs.revenue)::numeric /
        ls.revenue::numeric * 100,
        2
    ) AS revenue_decrease_percent
FROM revenue_2022 ls
JOIN revenue_2023 cs
ON ls."Branch" = cs."Branch"
WHERE ls.revenue > cs.revenue
ORDER BY revenue_decrease_percent DESC
LIMIT 5;