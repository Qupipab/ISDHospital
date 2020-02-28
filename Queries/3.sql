USE ISDHospital

SELECT
    d.firstName + ' ' + d.lastName + ' ' + d.patron AS FIO, dp.title AS [Department Name], begBreak, DATEDIFF(minute, begBreak, endBreak) AS [Break], endBreak
FROM  WORKINGHOURS AS wh 
INNER JOIN DOCTOR AS d 
    ON wh.doctorID = d.doctorID
INNER JOIN department AS dp 
    ON d.departmentID = dp.departNum
WHERE
    DATEDIFF(minute, begBreak, endBreak) > 30
ORDER BY
    [Break] DESC
