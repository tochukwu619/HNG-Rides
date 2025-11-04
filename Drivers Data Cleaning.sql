SELECT * FROM public."Drivers"
ORDER BY driver_id ASC 

-- DATA CLEANING AND PREPARATION

--CHECK FOR DUPLICATES ID
SELECT driver_id, COUNT(driver_id) AS duplicates
FROM "Drivers"
GROUP BY driver_id
HAVING COUNT(driver_id) > 1;  -- THERE IS NO DUPLICATES


-- CHECK THE CITY COLUMN
SELECT DISTINCT city
FROM "Drivers";
-- REPLACE N.Y WITH NEW YORK, S.F WITH SAN FRANCISCO, AND L.A WITH LOS ANGELES
UPDATE "Drivers"
SET city = 'New York'
WHERE city = 'N.Y';

UPDATE "Drivers"
SET city = 'Los Angeles'
WHERE city = 'L.A';

UPDATE "Drivers"
SET city = 'San Francisco'
WHERE city = 'S.F';



-- CHECK FOR NULL VALUES
SELECT *
FROM "Drivers"
WHERE city IS NULL;


-- DELETE RECORDS OUTSIDE 2021-06-01 TO 2024-12-31

DELETE FROM "Drivers"
WHERE signup_date < '2021-06-01' OR signup_date > '2024-12-31';