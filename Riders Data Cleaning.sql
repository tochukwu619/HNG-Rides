SELECT * FROM public."Riders"
ORDER BY rider_id ASC 



-- DATA CLEANING


-- CHECK FOR DUPLICATE ID

SELECT rider_id, COUNT(rider_id) AS Duplicates
FROM "Riders"
GROUP BY rider_id
HAVING COUNT(rider_id) > 1;  -- NO DUPLICATES


--  CHECK THE FORMAT OF CITY
SELECT DISTINCT city
FROM "Riders";
-- UPDATE N.Y AS NEW YORK, S.F AS SAN FRANCISCO, AND L.A AS LOS ANGELES
UPDATE "Riders"
SET city = 'San Francisco'
WHERE city = 'S.F';

UPDATE "Riders"
SET city = 'Los Angeles'
WHERE city = 'L.A';

UPDATE "Riders"
SET city = 'New York'
WHERE city = 'N.Y';



-- CHECK FOR NULL VALUES

SELECT *
FROM "Riders"
WHERE rider_id IS NULL;  -- NO NULL VALUES


-- DELETE RECORDS OUTSIDE '2021-06-01' TO '2024-12-31'

DELETE FROM "Riders"
WHERE signup_date < '2021-06-01' OR signup_date > '2024-12-31';