SELECT *
FROM reatil_sales 
WHERE category = 'Clothing'
  AND quantiy > 3
  AND TO_CHAR(sale_date, 'YYYY-MM') = '2022-11';

  
----total sales for each category 
SELECT 
		category,
		SUM(total_sale) as net_table,
		COUNT(quantiy) as order_count
FROM reatil_sales
GROUP BY category;

SELECT 
	ROUND(AVG(age)) AS avg_age
	FROM reatil_sales
WHERE category = 'Beauty';


SELECT 
	transactions_id, total_sale
	FROM reatil_sales
WHERE total_sale >= 1000;

SELECT
	gender,category,
	COUNT (* )as total_transacs
	FROM reatil_sales
GROUP BY gender,category 
ORDER BY category, gender;

SELECT

	AVG(total_sale) as avg_sale
	FROM reatil_sales;

SELECT 	year,month, avg_sale FROM 	

	( SELECT
		EXTRACT(YEAR FROM sale_date) as year,
		EXTRACT(MONTH FROM sale_date) as month,
		AVG(total_sale) as avg_sale,
		RANK() OVER ( PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC)
	FROM reatil_sales
	GROUP BY 1, 2
) as t1

WHERE rank =1;

