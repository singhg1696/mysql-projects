-- Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.

SELECT * FROM city WHERE population > 100000 AND countrycode = 'USA'; 

-- Query all columns for a city in CITY with the ID 1661.

SELECT * FROM city WHERE id = 1661;

-- Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.

SELECT * FROM city WHERE countrycode = 'JPN';

-- Query a list of CITY and STATE from the STATION table.

SELECT city, state FROM station;

-- Query a list of CITY names from STATION for cities that have an even ID number.
-- Print the results in any order, but exclude duplicates from the answer

SELECT DISTINCT city FROM station where id%2 = 0; 
SELECT DISTINCT city FROM station where MOD(ID,2) = 0; 

-- Find the difference between the total number of CITY entries in the table and 
-- the number of distinct CITY entries in the table.

SELECT COUNT(city) - (SELECT COUNT(DISTINCT city) from station) as 
Difference FROM station ;

-- Query the list of CITY names from STATION that do not start with vowels. 
-- Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT LIKE 'A%'
  AND CITY NOT LIKE 'E%'
  AND CITY NOT LIKE 'I%'
  AND CITY NOT LIKE 'O%'
  AND CITY NOT LIKE 'U%';
 
 
 SELECT DISTINCT CITY
FROM STATION
WHERE RIGHT(CITY, 1) NOT IN ('A', 'E', 'I', 'O', 'U');


SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT REGEXP '^[aeiouAEIOU]';

-- Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters.
--  Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE CITY  REGEXP '^[aeiouAEIOU]'
AND CITY  REGEXP '[aeiouAEIOU]$';

 SELECT DISTINCT CITY
FROM STATION
WHERE RIGHT(CITY, 1) IN ('A', 'E', 'I', 'O', 'U')
AND LEFT(CITY, 1) IN ('A', 'E', 'I', 'O', 'U');


