SELECT * FROM public."Rides"
ORDER BY ride_id ASC 



-- DATA CLEANING


-- CHECK FOR DUPLICATE PRIMARY KEY

SELECT ride_id, COUNT(ride_id) AS Duplicates
FROM "Rides"
GROUP BY ride_id
HAVING COUNT(ride_id) > 1;  --  NO DUPLICATES



-- CHECK THE FORMAT OF THE TEXT COLUMNS

-- PICKUP CITY
SELECT DISTINCT pickup_city
FROM "Rides";
-- UPDATE THE ABBREVIATIONS

UPDATE "Rides"
SET pickup_city = 'New York'
WHERE pickup_city = 'N.Y';

UPDATE "Rides"
SET pickup_city = 'Los Angeles'
WHERE pickup_city = 'L.A';

--DROPOFF CITY

SELECT DISTINCT dropoff_city
FROM "Rides";
-- UPDATE THE ABBREVIATION

UPDATE "Rides"
SET dropoff_city = 'San Francisco'
WHERE dropoff_city = 'S.F';

-- STATUS
SELECT DISTINCT status
FROM "Rides"
-- CORRECT COMPLTED TO COMPLETED

UPDATE "Rides"
SET status = 'completed'
WHERE status = 'complted';

--  CHECK FOR NULL VALUES

SELECT *
FROM "Rides"
WHERE ride_id IS NULL;

-- DELETE RECORDS OUTSIDE 2021-06-01 TO 2024-12-31

DELETE FROM "Rides"
WHERE request_time < '2021-06-01' OR dropoff_time > '2024-12-31';