USE ISDHospital

SELECT
(SELECT COUNT(beginning)
  FROM appointment
  WHERE DATEPART(HOUR, beginning) BETWEEN 7 AND 10) AS [7 - 10],

(SELECT COUNT(beginning)
  FROM appointment
  WHERE DATEPART(HOUR, beginning) BETWEEN 11 AND 13) AS [10 - 13],

(SELECT COUNT(beginning)
  FROM appointment
  WHERE DATEPART(HOUR, beginning) BETWEEN 14 AND 16) AS [13 - 16],

(SELECT COUNT(beginning)
  FROM appointment
  WHERE DATEPART(HOUR, beginning) BETWEEN 17 AND 19)  AS [16 - 19] 


/*SELECT
CASE 
  WHEN DATEPART(HOUR, beginning) BETWEEN 7 AND 10 THEN '7 - 10'
  WHEN DATEPART(HOUR, beginning) BETWEEN 11 AND 13 THEN '10 - 13'
  WHEN DATEPART(HOUR, beginning) BETWEEN 14 AND 16 THEN '13 - 16'
  WHEN DATEPART(HOUR, beginning) BETWEEN 17 AND 19  THEN '16 - 19'
END
FROM
  appointment*/