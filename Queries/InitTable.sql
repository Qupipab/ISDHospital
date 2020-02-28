USE ISDHospital

CREATE TABLE department (
    departNum INT PRIMARY KEY NOT NULL,
    title NVARCHAR(25) NOT NULL
);

CREATE TABLE doctor (
    doctorID INT PRIMARY KEY IDENTITY(1,1),
    lastName NVARCHAR(50)  NOT NULL,
    firstName NVARCHAR(50)  NOT NULL,
    patron NVARCHAR(50)  NOT NULL,
    post NVARCHAR(25)  NOT NULL,
    birthday DATE NOT NULL,
    departmentID INT REFERENCES department(departNum)
);

CREATE TABLE patient (
    patientID INT PRIMARY KEY IDENTITY(1,1),
    lastName NVARCHAR(50) NOT NULL,
    firstName NVARCHAR(50) NOT NULL,
    patron NVARCHAR(50) NOT NULL,
    brithday DATE NOT NULL
);

CREATE TABLE appointment (
    appointmentID INT PRIMARY KEY IDENTITY(1,1),
    doctor INT REFERENCES doctor (doctorID),
    patient INT REFERENCES patient(patientID),
    beginning DATETIME NOT NULL,
    duration INT CHECK(duration = 10 OR duration = 20 OR duration = 30),
    diagnosis NVARCHAR(25)
);

CREATE TABLE workingHours (
    doctorID INT REFERENCES doctor(doctorID),
    begWH DATETIME NOT NULL,
    begBreak TIME NOT NULL,
    endBreak TIME NOT NULL,
    endWH DATETIME NOT NULL
);