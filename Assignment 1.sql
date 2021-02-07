-- 1. How many airplanes have listed speeds?  What is the min and max listed speed?

SELECT COUNT(speed)
FROM planes
WHERE speed IS NOT NULL;

SELECT MIN(speed)
FROM planes
WHERE speed IS NOT NULL;

SELECT MAX(speed)
FROM planes
WHERE speed IS NOT NULL;

-- 2. What is the total distance flown by all of the planes in
-- January 2013? What is the total distance flown by all of
-- the planes in January 2013 where the tailnum is
-- missing?

SELECT SUM(distance)
FROM flights
WHERE year=2013 AND month=1;

SELECT SUM(distance)
FROM flights
WHERE year=2013 AND month=1 and tailnum="";

-- 3. What is the total distance flown for all planes on July 5,
-- 2013 grouped by aircraft manufacturer? Write this
-- statement first using an INNER JOIN, then using a LEFT
-- OUTER JOIN. How do your results compare?

SELECT planes.manufacturer, SUM(flights.distance)
FROM planes
INNER JOIN flights 
	USING (tailnum)
    WHERE flights.year=2013 AND flights.month=7 AND flights.day=5
GROUP BY planes.manufacturer;

SELECT planes.manufacturer, SUM(flights.distance)
FROM planes
LEFT OUTER JOIN flights
	USING (tailnum)
    WHERE flights.year=2013 AND flights.month=7 AND flights.day=5
GROUP BY planes.manufacturer;

-- 4. Write and answer at least one question of your own choosing 
-- that joins information from at least three of the tables 
-- in the flights database.

-- What is the longest flight taken from each manufacturer?

SELECT planes.manufacturer, MAX(flights.distance)
FROM planes
INNER JOIN flights 
	USING (tailnum)
GROUP BY planes.manufacturer;
















