-- For each driver, calculate their average monthly rides since signup. 
-- Who are the top 5 drivers with the highest consistency (most rides per active month)?


WITH total_ride AS (
	SELECT d.name,
			d.driver_id,
			DATE_PART('year', r.request_time) AS Year,
			DATE_PART('month', r.request_time) AS Month,
			COUNT(r.ride_id) AS total_rides
	FROM "Rides" AS r
	JOIN "Drivers" AS d
	ON r.driver_id = d.driver_id
	WHERE r.status = 'completed'
	GROUP BY d.driver_id, d.name, Year, Month
	)


SELECT name, ROUND((SUM(total_rides)/COUNT(DISTINCT (Year || '-' || Month))), 2) AS Avg_Monthly_Ride
FROM total_ride
GROUP BY name
ORDER BY Avg_Monthly_Ride DESC
LIMIT 5;