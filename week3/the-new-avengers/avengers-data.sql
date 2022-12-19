USE avengers;

-- 1. Show all of the information on the Avengers.
SELECT * FROM avengers;
-- Columns: 21
-- Expected row count: 171



-- 2. Create a new super hero table (table was imported)
SELECT * FROM characters LIMIT 2000;
-- Columns: 4
-- Expected row count: 1169



-- 3. Add a column (superheros) to your table
ALTER TABLE characters 
ADD new_superheroes VARCHAR(5);

UPDATE characters
SET new_superheroes = (
	CASE 
		WHEN rand() < 0.5
        THEN "Yes"
        ELSE "No"
	END
);
-- Columns: 4
-- Expected row count: 1169



-- 4. Add a column to your new table (the new superheros) for their favorite Avenger (have it randomly choose between  Anthony Edward "Tony" Stark,  Robert Bruce Banner, & Victor Shade).
ALTER TABLE characters 
ADD favorite_avenger VARCHAR(100);

UPDATE characters
SET favorite_avenger = (
	CASE 
		WHEN rand() < 0.3 THEN 'Anthony Edward "Tony" Stark'
        WHEN rand() < 0.7 THEN "Robert Bruce Banner"
        ELSE "Victor Shade (alias)"
	END
);
-- Columns: 4
-- Expected row count: 1169



-- 5. Use a JOIN statement between the two tables for who is interested in joining the Avengers.
SELECT name, `Captain America`, new_superheroes FROM avengers
INNER JOIN characters
	ON avengers.name = characters.favorite_avenger
    WHERE new_superheroes = "Yes";
-- Columns: 3
-- Expected row count: 582



-- 6. List all Avengers who have more than 1000 appearances in alphabetic order.    
SELECT * FROM avengers 	
WHERE appearances > 1000
ORDER BY name;
-- Columns: 21
-- Expected row count: 20




-- 7. What Avengers do not have more than 1000 appearances?
SELECT * FROM avengers 	
WHERE appearances < 1000
ORDER BY name;
-- Columns: 21
-- Expected row count: 151



-- 8. Not more than 500?
SELECT * FROM avengers 	
WHERE appearances < 500
ORDER BY name;
-- Columns: 21
-- Expected row count: 128



-- 9. Not more than 50 and female?
SELECT * FROM avengers 	
WHERE appearances < 50 AND gender = "FEMALE"
ORDER BY name;
-- Columns: 21
-- Expected row count: 18



-- 10. More than 150, male, and are full members?
SELECT * FROM avengers 	
WHERE appearances > 150 AND NOT gender = "FEMALE" AND honorary = "Full"
ORDER BY name;
-- Columns: 21
-- Expected row count: 51
