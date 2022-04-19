USE time;


-- Average sleep time
SELECT teage, AVG(t010101) as sleep_avg
FROM atussum
WHERE teage > 0 AND t010101 > 0
GROUP BY teage;


-- Average sleep time with weight
SELECT teage, SUM(t010101*tufnwgtp)/SUM(tufnwgtp) as sleep_avg
FROM atussum
WHERE teage > 0 AND t010101 > 0 #Remove missing data
GROUP BY teage;

-- Categorize by Age Group -- sleep
WITH CTE AS (
	   SELECT *, 
	   CASE WHEN teage < 20 THEN 'youth'
	        WHEN teage < 30 THEN 'twenty'
            WHEN teage < 40 THEN 'thiry'
            WHEN teage < 50 THEN 'fourty'
            ELSE 'fiftyandover' END AS agegroup
	   FROM atussum
            )
SELECT agegroup, SUM(t010101*tufnwgtp)/SUM(tufnwgtp) as avg_sleep
FROM CTE
GROUP BY agegroup;

-- Average sleep time by labour force state

WITH CTE AS (
	   SELECT *, 
	   CASE WHEN telfs = 1  THEN 'employed'
	        WHEN telfs = 2 THEN 'employed-absent'
            WHEN telfs = 3 THEN 'outside of labour force'
            WHEN telfs = 4 THEN 'unemployed-layoff'
            ELSE 'unemployed-looking' END AS lfsgrp
	   FROM atussum
            )
SELECT lfsgrp, SUM(t010101*tufnwgtp)/SUM(tufnwgtp) as avg_sleep
FROM CTE
GROUP BY lfsgrp;


-- Socializing vs Watching TV by day of week 
SELECT tudiaryday, SUM(t120303*tufnwgtp)/SUM(tufnwgtp) as soc_avg, SUM(t120101*tufnwgtp)/SUM(tufnwgtp) as tv_avg
FROM atussum
GROUP BY tudiaryday
ORDER BY 1; 

-- Other activities (e.g., sleep, reading by day of week, purchasing grcoeries and shopping (not necessities) )
SELECT tudiaryday, SUM(t010101*tufnwgtp)/SUM(tufnwgtp) as sleep_avg, 
				   SUM(t120312*tufnwgtp)/SUM(tufnwgtp) as read_avg,
                   SUM(t070101*tufnwgtp)/SUM(tufnwgtp) as grocshopping,
                   SUM(t070104*tufnwgtp)/SUM(tufnwgtp) as shopping
FROM atussum
GROUP BY tudiaryday
ORDER BY 1; 


-- Average time learning (taking class of interest) vs. Socializing
SELECT SUM(t060102*tufnwgtp)/SUM(tufnwgtp) as learning, 
	   SUM(t120101*tufnwgtp)/SUM(tufnwgtp) as socializing
FROM atussum
GROUP BY teage
ORDER BY teage;


-- Categorize by Age Group - learning 
WITH CTE AS (
	   SELECT *, 
	   CASE WHEN teage < 20 THEN 'youth'
	        WHEN teage < 30 THEN 'twenty'
            WHEN teage < 40 THEN 'thiry'
            WHEN teage < 50 THEN 'fourty'
            ELSE 'fiftyandover' END AS agegroup
	   FROM atussum
            )
SELECT agegroup, SUM(t060101*tufnwgtp)/SUM(tufnwgtp) as avg_learn
FROM CTE
GROUP BY agegroup;
       

-- Average time learning adminstrative activities (for degree vs personal interest) 
SELECT SUM(t060402*tufnwgtp)/SUM(tufnwgtp) as degreelearn, 
	   SUM(t060101*tufnwgtp)/SUM(tufnwgtp) AS perslearn
GROUP BY teage
ORDER BY teage;
