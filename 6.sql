-- Identify riders who have taken more than 10 rides but never paid with cash.


SELECT rr.name, COUNT(rs.ride_id) AS no_of_rides
FROM "Rides" AS rs
JOIN "Riders" AS rr
ON rs.rider_id = rr.rider_id
JOIN "Payments" AS p
ON rs.ride_id = p.ride_id
WHERE rs.status = 'completed' AND p.amount > 0 
								AND rr.rider_id NOT IN(SELECT r2.rider_id FROM "Rides" AS r2
														JOIN "Payments" AS p2 ON r2.ride_id = p2.ride_id
														WHERE p2.method = 'cash')
GROUP BY rr.name
HAVING COUNT(rs.ride_id) > 10
ORDER BY no_of_rides DESC;