-- Find the top 3 drivers in each city by total revenue earned between June 2021 and Dec 2024.
-- If a driver has multiple cities, count revenue where they picked up passengers in that city.

WITH revenues AS (
	SELECT r.pickup_city AS city, 
			d.name AS driver,
			SUM(p.amount) AS revenue
	FROM "Rides" AS r
	JOIN "Drivers" AS d
	ON r.driver_id = d.driver_id
	JOIN "Payments" AS p
	ON r.ride_id = p.ride_id
	WHERE p.amount > 0 AND r.status = 'completed'
	GROUP BY r.pickup_city, d.name
),
ranking AS (
	SELECT city,
			driver,
			revenue,
			RANK() OVER (PARTITION BY city ORDER BY revenue DESC) AS ranks
	FROM revenues
)

SELECT city, driver, revenue
FROM ranking
WHERE ranks <= 3
ORDER BY city, revenue DESC;
