USE ISDHospital

SELECT 
    diagnosis, beginning
FROM 
    appointment 
WHERE 
    DATEPART(m, beginning) = DATEPART(m, DATEADD(m, 0, getdate()))
    AND DATEPART(yyyy, beginning) = DATEPART(yyyy, DATEADD(m, 0, getdate()))
ORDER BY 
    COUNT(diagnosis) OVER (PARTITION BY diagnosis) DESC, diagnosis DESC