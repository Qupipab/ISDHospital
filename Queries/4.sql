USE ISDHospital

SELECT d.doctorID, d.firstName, d.lastName, d.patron, COUNT(app.patient) AS patients, COUNT(app.patient) / 12.0 AS averagePasient,
    (SELECT TOP 1 diagnosis
    FROM appointment INNER JOIN doctor
    ON appointment.doctor = doctor.doctorID
    ORDER BY doctor.doctorID DESC) AS diagnosis
FROM doctor AS d 
INNER JOIN appointment AS app
ON d.doctorID = app.doctor
GROUP BY d.firstName, d.doctorID, d.lastName, d.patron
ORDER BY COUNT(app.patient) DESC

-- Что-то пошло не так.