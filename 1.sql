-- Find the top 10 longest rides (by distance), including driver name, rider name, 
-- pickup/dropoff cities, and payment method.


SELECT d.name AS driver_name, rr.name AS rider_name, p.method, rs.pickup_city, rs.dropoff_city, rs.distance_km
FROM "Rides" AS rs
JOIN "Riders" AS rr
ON rs.rider_id = rr.rider_id
JOIN "Drivers" AS d
ON rs.driver_id = d.driver_id
JOIN "Payments" AS p
ON rs.ride_id = p.ride_id
WHERE p.amount > 0 AND rs.status = 'completed'
ORDER BY rs.distance_km DESC
LIMIT 10;