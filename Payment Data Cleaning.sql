SELECT * FROM public."Payments"
ORDER BY payment_id ASC 



-- DATA CLEANING

--CHECK FOR DUPLICATE ID
SELECT payment_id, COUNT(payment_id) AS Duplicates
FROM "Payments"
GROUP BY payment_id
HAVING COUNT(payment_id) > 1; -- NO DUPLICATES


-- CHECK THE VALUES IN METHOD

SELECT DISTINCT method
FROM "Payments";
-- UPDATE pay pal AS paypal
UPDATE "Payments"
SET method = 'paypal'
WHERE method = 'pay pal';


-- CHECK FOR NULL VALUES

SELECT *
FROM "Payments"
WHERE ride_id IS NULL;  -- NO NULL VALUES


-- DELETE RECORDS OUTSIDE 2021-06-01 TO 2024-12-31

DELETE FROM "Payments"
WHERE paid_date < '2021-06-01' OR paid_date > '2024-12-31';