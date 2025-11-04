-- How many riders who signed up in 2021 still took rides in 2024?


SELECT COUNT(DISTINCT rider_id) AS No_of_riders
FROM "Riders"
WHERE signup_date BETWEEN '2021-01-01' AND '2021-12-31'
		AND rider_id IN (SELECT rider_id FROM "Rides" WHERE status= 'completed' 
							AND request_time BETWEEN '2024-01-01' AND '2024-12-31')