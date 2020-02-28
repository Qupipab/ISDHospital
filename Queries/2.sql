-- (PART ONE)

USE ISDHospital

SELECT 
	dp.departNum, wh.doctorID,
	SUM(ROUND(((DATEDIFF(MINUTE, begWH, endWH) - DATEDIFF(MINUTE, begBreak, endBreak)) / 60.0), 1)) AS [total hours]
FROM workingHours AS wh 
INNER JOIN doctor AS d
	ON d.doctorID = wh.doctorID
INNER JOIN department AS dp
	ON d.departmentID = dp.departNum 
WHERE 
	DATEDIFF(MONTH, wh.begWH, GETDATE()) <= 3
GROUP BY
	 dp.departNum, wh.doctorID
ORDER BY
	dp.departNum

-- (PART TWO)

USE ISDHospital

SELECT TOP 1
	diagnosis, beginning
FROM 
	appointment 
WHERE 
	DATEDIFF(MONTH, beginning, GETDATE()) <= 3
ORDER BY 
	COUNT(diagnosis) OVER (PARTITION BY diagnosis) DESC, diagnosis DESC