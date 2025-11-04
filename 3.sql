-- Compare quarterly revenue between 2021, 2022, 2023, and 2024. Which quarter had the biggest YoY growth?

WITH quaterly_revenue AS(
	SELECT DATE_PART('year', paid_date) AS Year,
			DATE_PART ('quarter', paid_date) AS Quarter,
			SUM(amount) AS Revenue
	FROM "Payments"
	WHERE amount > 0
	GROUP BY Year, Quarter
	ORDER BY Year, Quarter
	),
yoy_growth AS(
	SELECT Year,
			Quarter,
			Revenue,
			Revenue - LAG(Revenue) OVER (PARTITION BY Quarter ORDER BY Year) AS Revenue_Diff,
				(100 * (Revenue - LAG(Revenue) OVER (PARTITION BY Quarter ORDER BY Year))
				/(LAG(Revenue) OVER (PARTITION BY Quarter ORDER BY Year))) AS YoY_Percent_Growth
	FROM quaterly_revenue
	)


SELECT *
FROM yoy_growth
WHERE YoY_Percent_Growth IS NOT NULL
ORDER BY YoY_Percent_Growth DESC;