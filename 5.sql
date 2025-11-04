-- Calculate the cancellation rate per city and identify which city had the highest cancellation rate?


WITH cancellation AS (
	SELECT r.pickup_city,
			COUNT(r.ride_id) AS total_rides,
			COUNT(r.ride_id) FILTER (WHERE r.status = 'cancelled') AS cancelled_rides
	FROM "Rides" AS r
	GROUP BY pickup_city
)

SELECT pickup_city,
		total_rides,
		cancelled_rides,
		ROUND((cancelled_rides:: numeric/total_rides) * 100, 2) AS cancellation_rate_percent
FROM cancellation
ORDER BY cancellation_rate_percent DESC;
