-- Management wants to know the top 10 drivers that are qualified to receive bonuses using the criteria below;
--   	at least 30 rides completed,
--   	an average rating ≥ 4.5, and
--   	a cancellation rate under 5%.


WITH rides_made AS (
	SELECT d.driver_id,
			d.name AS driver,
			COUNT(r.ride_id) FILTER (WHERE r.status = 'completed') AS completed_rides,
			COUNT(r.ride_id) FILTER (WHERE r.status = 'cancelled') AS cancelled_rides,
			AVG(d.rating) AS avg_rating
	FROM "Rides" AS r
	JOIN "Payments" AS p
	ON r.ride_id = p.ride_id
	JOIN "Drivers" AS d
	ON r.driver_id = d.driver_id
	GROUP BY d.driver_id, d.name
	),
cancellation AS (
	SELECT driver,
			completed_rides,
			cancelled_rides,
			avg_rating,
			ROUND((cancelled_rides::numeric/ (completed_rides + cancelled_rides)) * 100, 2) AS cancellation_rate
	FROM rides_made
)

SELECT driver, completed_rides, avg_rating, cancellation_rate
FROM cancellation
WHERE completed_rides >= 30 AND cancellation_rate < 5 AND avg_rating >= 4.5
ORDER BY completed_rides DESC, avg_rating DESC, cancellation_rate DESC
LIMIT 10;