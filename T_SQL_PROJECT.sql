 

drop table PRESCRIPTION; 
drop table Medicine;
drop table VISIT;
drop table DIAGNOSIS;
drop table DOCTOR;
drop table PATIENT;
drop table ADDRESS;

SET NOCOUNT ON;

CREATE TABLE Address (
    address_id      INT     PRIMARY KEY
                                 NOT NULL,
    country         VARCHAR (20),
    city            VARCHAR (30),
    street          VARCHAR (30),
    building_number VARCHAR (5)
);
INSERT INTO Address (address_id, country, city, street, building_number)
VALUES (1, 'Poland', 'Warszawa', 'Dluga', '56');
INSERT INTO Address (address_id, country, city, street, building_number)
VALUES (2, 'Poland', 'Warszawa', 'Krórka', '33/66');
INSERT INTO Address (address_id, country, city, street, building_number)
VALUES (3, 'France', 'Paris', 'Revolutione', '1/5');
INSERT INTO Address (address_id, country, city, street, building_number)
VALUES (4, 'Spain', 'Madrid', 'Copek', '56/5');
INSERT INTO Address (address_id, country, city, street, building_number)
VALUES (5, 'Poland', 'Warszawa', 'Niska', '8');
INSERT INTO Address (address_id, country, city, street, building_number)
VALUES (6, 'Poland', 'Kutno', 'Prawa', '1');
INSERT INTO Address (address_id, country, city, street, building_number)
VALUES (7, 'Poland', 'Poznan', 'Lewa', '7');
INSERT INTO Address (address_id, country, city, street, building_number)
VALUES (8, 'Poland', 'Plock', 'Górna', '6');
INSERT INTO Address (address_id, country, city, street, building_number)
VALUES (9, 'Poland', 'Gdansk', 'Dolna', '48');
INSERT INTO Address (address_id, country, city, street, building_number)
VALUES (10, 'Poland', 'Warszawa', 'Glêboka', '68');
INSERT INTO Address (address_id, country, city, street, building_number)
VALUES (11, 'Poland', 'Warszawa', 'Plytka', '4F');
INSERT INTO Address (address_id, country, city, street, building_number)
VALUES (12, 'Poland', 'Warszawa', 'Fajna', '3C');
INSERT INTO Address (address_id, country, city, street, building_number)
VALUES (13, 'Poland', 'Warszawa', 'Zla', '5');
INSERT INTO Address (address_id, country, city, street, building_number)
VALUES (14, 'Poland', 'Radom', 'Petelickiego', '54');
INSERT INTO Address (address_id, country, city, street, building_number)
VALUES (15, 'Poland', 'Warszawa', 'Krzywa', '5B');


CREATE TABLE Patient (
    patient_id     INT      PRIMARY KEY
                               NOT NULL,
    first_name          VARCHAR (20),
    surname       VARCHAR (20),
    date_of_birth DATE,
    PESEL         INT,
    phone_number  INT,
    address_id    INT          REFERENCES Address (address_id) 
);

INSERT INTO Patient (patient_id , first_name ,surname,PESEL, phone_number, date_of_birth, address_id)
VALUES (1, 'Jan', 'Michalski', 96543234, 48642043, '2000-05-30', 1);
INSERT INTO Patient (patient_id , first_name ,surname,PESEL, phone_number, date_of_birth, address_id)
VALUES (2, 'Janek', 'Wiœniewski', 76857987, 43657567, '1997-02-20',  2);
INSERT INTO Patient (patient_id , first_name ,surname,PESEL, phone_number, date_of_birth, address_id)
VALUES (3, 'Gérard', 'Depardieu', 65467548, 11122233, '1991-03-27', 3);
INSERT INTO Patient (patient_id , first_name ,surname,PESEL, phone_number, date_of_birth, address_id)
VALUES (4, 'Francisco', 'Pizarro', 13214789, 87876542, '1980-02-23', 4);
INSERT INTO Patient (patient_id , first_name ,surname,PESEL, phone_number, date_of_birth, address_id)
VALUES (5, 'Donald', 'Tusk', 98774354, 23423688, '1994-12-30', 5);
INSERT INTO Patient (patient_id , first_name ,surname,PESEL, phone_number, date_of_birth, address_id)
VALUES (6, 'Wlodzimierz', 'Czarzasty', 65478524, 47567567, '1960-05-2', 6);
INSERT INTO Patient (patient_id , first_name ,surname,PESEL, phone_number, date_of_birth, address_id)
VALUES (7, 'Janusz', 'Korwin-Mikke', 98461565, 32132346, '2005-02-02', 7);
INSERT INTO Patient (patient_id , first_name ,surname,PESEL, phone_number, date_of_birth, address_id)
VALUES (8, 'Krzysztof', 'Bossak', 65432547, 76765753, '1980-05-14', 8);
INSERT INTO Patient (patient_id , first_name ,surname,PESEL, phone_number, date_of_birth, address_id)
VALUES (9, 'Malgorzata', 'Tacher', 97862211, 94324677, '1997-05-4', 9);
INSERT INTO Patient (patient_id , first_name ,surname,PESEL, phone_number, date_of_birth, address_id)
VALUES (10, 'Kuba', 'Michalski', 86532454, 98434321, '1999-05-25', 10);

CREATE TABLE Doctor (
    doctor_id INT 
            PRIMARY KEY NOT NULL, 
    first_name VARCHAR(20),
    surname VARCHAR(20), 
    phone_number INT, 
    address_id INT REFERENCES Address (address_id), 
    salary INT, 
    bonus INT
);
INSERT INTO Doctor (doctor_id, first_name, surname , phone_number , address_id, salary, bonus)
VALUES (1, 'Jan', 'Doktorski', 486210311, 11, 3000, 0);
INSERT INTO Doctor (doctor_id, first_name, surname , phone_number , address_id, salary, bonus)
VALUES (2, 'Stanislaw', 'Lekarski', 48656565, 12, 4000, 0);
INSERT INTO Doctor (doctor_id, first_name, surname , phone_number , address_id, salary, bonus)
VALUES (3, 'Wlodzimierz', 'Uzdowidzielski', 486185642, 13, 3500, 0);
INSERT INTO Doctor (doctor_id, first_name, surname , phone_number , address_id, salary, bonus)
VALUES (4, 'Krzysztof', 'Zdrowy', 486861123, 14, 2800, 0);
INSERT INTO Doctor (doctor_id, first_name, surname , phone_number , address_id, salary, bonus)
VALUES (5, 'Kacper', 'Szpitalny', 486416846, 15, 2900, 0);
INSERT INTO Doctor (doctor_id, first_name, surname , phone_number , address_id, salary, bonus)
VALUES (6, 'Pawel', 'Medyczny', 54865564, 15, 3000, 0);


CREATE TABLE Diagnosis (
    diagnosis_id      INT PRIMARY KEY
                           NOT NULL,      
    disease_name VARCHAR(20),
    symptoms_comments VARCHAR(400)
);
INSERT INTO Diagnosis (diagnosis_id, disease_name, symptoms_comments)
VALUES (1, 'Allergy', 'rash');
INSERT INTO Diagnosis (diagnosis_id, disease_name, symptoms_comments)
VALUES (2, 'calcium deficiency', 'pain in the joints and bones');
INSERT INTO Diagnosis (diagnosis_id, disease_name, symptoms_comments)
VALUES (3, 'flu', 'headache, fever');
INSERT INTO Diagnosis (diagnosis_id, disease_name, symptoms_comments)
VALUES (4, 'Allergy', 'rash');
INSERT INTO Diagnosis (diagnosis_id, disease_name, symptoms_comments)
VALUES (5, 'cold', 'kaszel, katar');
INSERT INTO Diagnosis (diagnosis_id, disease_name, symptoms_comments)
VALUES (6, 'calcium deficiency', 'pain in the joints and bones');
INSERT INTO Diagnosis (diagnosis_id, disease_name, symptoms_comments)
VALUES (7, 'cold', 'kaszel, katar');
INSERT INTO Diagnosis (diagnosis_id, disease_name, symptoms_comments)
VALUES (8, 'Allergy', 'rash');
INSERT INTO Diagnosis (diagnosis_id, disease_name, symptoms_comments)
VALUES (9, 'flu', 'headache, fever');
INSERT INTO Diagnosis (diagnosis_id, disease_name, symptoms_comments)
VALUES (10, 'flu', 'headache, fever');
INSERT INTO Diagnosis (diagnosis_id, disease_name, symptoms_comments)
VALUES (11, 'bronchitis', 'kaszel, katar');
INSERT INTO Diagnosis (diagnosis_id, disease_name, symptoms_comments)
VALUES (12, 'Allergy', 'rash');
INSERT INTO Diagnosis (diagnosis_id, disease_name, symptoms_comments)
VALUES (13, 'calcium deficiency', 'pain in the joints and bones');


CREATE TABLE Visit (
    visit_id      INT PRIMARY KEY
                           NOT NULL,
    date_of_visit DATE     NOT NULL,
    patient_id    INT      NOT NULL
                           REFERENCES Patient (patient_id),
    doctor_id     INT NOT NULL
                           REFERENCES Doctor (doctor_id),
    diagnosis_id INT
                            REFERENCES Diagnosis (diagnosis_id)
);
INSERT INTO Visit (visit_id, date_of_visit, patient_id , doctor_id, diagnosis_id )
VALUES (1, '2019-05-10', 1, 1, 1);
INSERT INTO Visit (visit_id, date_of_visit, patient_id , doctor_id, diagnosis_id  )
VALUES (2, '2018-04-10', 2, 2, 2);
INSERT INTO Visit (visit_id, date_of_visit, patient_id , doctor_id, diagnosis_id  )
VALUES (3, '2017-01-13', 3, 3, 3);
INSERT INTO Visit (visit_id, date_of_visit, patient_id , doctor_id, diagnosis_id  )
VALUES (4, '2018-04-16', 4, 4, 4);
INSERT INTO Visit (visit_id, date_of_visit, patient_id , doctor_id, diagnosis_id  )
VALUES (5, '2019-11-26', 5, 5, 5);
INSERT INTO Visit (visit_id, date_of_visit, patient_id , doctor_id, diagnosis_id  )
VALUES (6, '2019-04-01', 6, 5, 6);
INSERT INTO Visit (visit_id, date_of_visit, patient_id , doctor_id, diagnosis_id  )
VALUES (7, '2019-01-03', 7, 5, 7);
INSERT INTO Visit (visit_id, date_of_visit, patient_id , doctor_id, diagnosis_id  )
VALUES (8, '2019-07-20', 8, 5, 8);
INSERT INTO Visit (visit_id, date_of_visit, patient_id , doctor_id, diagnosis_id  )
VALUES (9, '2018-04-16', 9, 4, 9);
INSERT INTO Visit (visit_id, date_of_visit, patient_id , doctor_id, diagnosis_id  )
VALUES (10, '2019-04-19', 10, 3, 10);
INSERT INTO Visit (visit_id, date_of_visit, patient_id , doctor_id, diagnosis_id  )
VALUES (11, '2018-03-12', 1, 1, 11);
INSERT INTO Visit (visit_id, date_of_visit, patient_id , doctor_id, diagnosis_id  )
VALUES (12, '2015-06-12', 6, 5, 12);
INSERT INTO Visit (visit_id, date_of_visit, patient_id , doctor_id, diagnosis_id  )
VALUES (13, '2014-03-27', 6, 5, 13);

CREATE TABLE Medicine(
    medicine_id      INT PRIMARY KEY
                           NOT NULL,
    name_of_medicine   VARCHAR(30) UNIQUE
);
INSERT INTO Medicine (medicine_id, name_of_medicine)
VALUES (1, 'Adderall');
INSERT INTO Medicine (medicine_id, name_of_medicine)
VALUES (2, 'Doxycycline');
INSERT INTO Medicine (medicine_id, name_of_medicine)
VALUES (3, 'Ibuprofen');
INSERT INTO Medicine (medicine_id, name_of_medicine)
VALUES (4, 'Losartan');
INSERT INTO Medicine (medicine_id, name_of_medicine)
VALUES (5, 'Metoprolol');
INSERT INTO Medicine (medicine_id, name_of_medicine)
VALUES (6, 'Oxycodone');
INSERT INTO Medicine (medicine_id, name_of_medicine)
VALUES (7, 'Lisinopril');
INSERT INTO Medicine (medicine_id, name_of_medicine)
VALUES (8, 'Clindamycin');
INSERT INTO Medicine (medicine_id, name_of_medicine)
VALUES (9, 'Cyclobenzaprine');
INSERT INTO Medicine (medicine_id, name_of_medicine)
VALUES (10, 'Ativan');


CREATE TABLE Prescription (
    prescription_id      INT  PRIMARY KEY
                           NOT NULL,      
    medicine_id  INT NOT NULL
                           REFERENCES Medicine (medicine_id),
    quantity_packages INT,
    comment_dosage VARCHAR(400),
    visit_id INT NOT NULL
                            REFERENCES Visit (visit_id)
);
INSERT INTO Prescription (prescription_id, medicine_id, quantity_packages, comment_dosage, visit_id)
VALUES (1, 1, 2, ' 2g, twice a day afret eating, for 3 days', 1);
INSERT INTO Prescription (prescription_id, medicine_id, quantity_packages, comment_dosage, visit_id)
VALUES (2, 2, 2, ' 4g, twice a day afret eating, for 2 days', 2);
INSERT INTO Prescription (prescription_id, medicine_id, quantity_packages, comment_dosage, visit_id)
VALUES (3, 3, 3, ' 1g, three times a day afret eating, for 4 days', 3);
INSERT INTO Prescription (prescription_id, medicine_id, quantity_packages, comment_dosage, visit_id)
VALUES (4, 4, 1, ' 2g, twice a day afret eating, for 2 days', 4);
INSERT INTO Prescription (prescription_id, medicine_id, quantity_packages, comment_dosage, visit_id)
VALUES (5, 5, 2, ' 5g, three times a day afret eating, for 5 days', 5);
INSERT INTO Prescription (prescription_id, medicine_id, quantity_packages, comment_dosage, visit_id)
VALUES (6, 6, 4, ' 1g, twice a day afret eating, for 4 days', 6);
INSERT INTO Prescription (prescription_id, medicine_id, quantity_packages, comment_dosage, visit_id)
VALUES (7, 7, 3, ' 2g, twice a day afret eating, for 6 days', 7);
INSERT INTO Prescription (prescription_id, medicine_id, quantity_packages, comment_dosage, visit_id)
VALUES (8, 8, 1, ' 3g, three times a day afret eating, for 3 days', 8);
INSERT INTO Prescription (prescription_id, medicine_id, quantity_packages, comment_dosage, visit_id)
VALUES (9, 9, 1, ' 1g, twice a day afret eating, for 2 days', 9);
INSERT INTO Prescription (prescription_id, medicine_id, quantity_packages, comment_dosage, visit_id)
VALUES (10, 10, 3, ' 1g, twice a day afret eating, for 7 days', 10);
INSERT INTO Prescription (prescription_id, medicine_id, quantity_packages, comment_dosage, visit_id)
VALUES (11, 6, 1, ' 1g, three times a day afret eating, for 6 days', 11);
INSERT INTO Prescription (prescription_id, medicine_id, quantity_packages, comment_dosage, visit_id)
VALUES (12, 6, 1, ' 2g, twice a day afret eating, for 3 days', 12);
INSERT INTO Prescription (prescription_id, medicine_id, quantity_packages, comment_dosage, visit_id)
VALUES (13, 1, 1, ' 2g, three times a day afret eating, for 3 days', 13);


GO


/*-------------------------------------------------------------------
									TRIGGER
After adding a visit display all his information (about date, doctor and patient surname). 
Trigger also should display information how many times this patient was in hospital
(how many visits are exist with his participation).
Also if any one will try to type date in past, raise an error.
*/-----------------------------------------------------------------------

CREATE TRIGGER new_visit ON visit 
FOR INSERT
AS
DECLARE
@number_of_visit_by_patient INT,
@patient_first_name VARCHAR(20),
@patient_surname VARCHAR(20),
@doctor_first_name VARCHAR(20),
@doctor_surname VARCHAR(20),
@date_of_visit DATE;

SELECT @number_of_visit_by_patient = COUNT(visit.visit_id) FROM visit, inserted WHERE visit.patient_id = inserted.patient_id;

SELECT @date_of_visit = inserted.date_of_visit FROM inserted, Visit WHERE visit.patient_id = inserted.patient_id;

IF @date_of_visit < GETDATE()
	BEGIN
		BEGIN TRY -- EROR HANDLING
			SELECT
			1 / 0 AS Error;
		END TRY
		BEGIN CATCH
			SELECT
				ERROR_NUMBER() AS ErrorNumber,
				ERROR_STATE() AS ErrorState,
				ERROR_SEVERITY() AS ErrorSeverity,
				ERROR_PROCEDURE() AS ErrorProcedure,
				ERROR_LINE() AS ErrorLine,
				'Ups.. There is forbidden to add visit in the past' AS ErrorMessage;
		END CATCH;
		ROLLBACK TRANSACTION
	END

SELECT @patient_first_name = Patient.first_name FROM inserted, Patient, Visit WHERE visit.patient_id = inserted.patient_id;
SELECT @patient_surname = Patient.surname FROM inserted, Patient, Visit WHERE visit.patient_id = inserted.patient_id;

SELECT @doctor_first_name = Doctor.first_name FROM inserted, Doctor, Visit WHERE visit.doctor_id = inserted.doctor_id;
SELECT @doctor_surname = Doctor.surname FROM inserted, Doctor, Visit WHERE visit.doctor_id = inserted.doctor_id;

PRINT 'Patient ' + @patient_first_name + ' ' + @patient_surname + ' has visit with doctor ' + @doctor_first_name + ' ' + @doctor_surname + ' in the date: ' + CAST(@date_of_visit AS VARCHAR);
PRINT 'Number of visits by this patient before: ' + CAST(@number_of_visit_by_patient AS VARCHAR);

GO

--CHECKING
INSERT INTO Visit (visit_id, date_of_visit, patient_id , doctor_id, diagnosis_id  )
VALUES (21, '2020-01-10', 10, 5, 13);



/*--------------------------------------------
			PROCEDURE WITH OUT
Procedure for inserting patients. The procedure should check whether the patient 
with the same PESEL already exists (otherwise we report an error).
If patient does not exits, proceduree add patient, but it will use another function
that will get a new patient_id.
Return the new id of patient in output parameter. 
Display a value received from procedure in output.
*/--------------------------------------------

GO
--CREATE OWN DATA TYPE
CREATE TYPE TrueFalse  
FROM BIT NOT NULL ;  
GO

--FUNCTION THAT IS LOOKING IF THE PACTIENT ALREADY EXIST
CREATE FUNCTION ifPatienExist(@patient_pesel INT)
RETURNS TrueFalse
AS
BEGIN
	DECLARE @outPut TrueFalse;
	SELECT @outPut = COUNT(1) FROM Patient WHERE patient.PESEL = @patient_pesel;
	RETURN @outPut;
END

GO

--FUNCTION MAKING A NEW ID FOR PATIENT (SCALAR FUNCTION)
GO
CREATE FUNCTION newPatientId()
RETURNS INT
AS
BEGIN
	DECLARE @outPut INT;
	SELECT @outPut = MAX(patient.patient_id)+1 FROM patient;
	RETURN @outPut;
END

GO


CREATE PROCEDURE AddPatient
@p_id INT OUT,
@p_first_name VARCHAR(20),
@p_surname  VARCHAR(20),
@p_date_of_birth DATE,
@p_pesel INT,
@p_phone_number INT,
@p_address_id INT
AS 
BEGIN
SET NUMERIC_ROUNDABORT OFF;

DECLARE @p_pesel_scal INT;
SET @p_pesel_scal = @p_pesel;

    IF (SELECT s18389.ifPatienExist(@p_pesel_scal)) = 0														-- USING ANOTHER FUNCTION IN SELECT AND WITH OWN DATA TYPE
		BEGIN
			SET @p_id = s18389.newPatientId();																-- USING ANOTHER FUNCTION TO SET VARIABLE (SCALAR FUNCTION)
			INSERT INTO patient(patient_id,first_name,surname,date_of_birth,pesel,phone_number,address_id) 
			VALUES (@p_id,@p_first_name,@p_surname,@p_date_of_birth,@p_pesel,@p_phone_number,@p_address_id);
			PRINT 'Succesfully added a patient with a new number ' + CAST(@p_id AS VARCHAR);
		END;
    ELSE
		BEGIN
		   BEGIN TRY
				SELECT
				1 / 0 AS Error;
			END TRY
			BEGIN CATCH
				SELECT
					ERROR_NUMBER() AS ErrorNumber,
					ERROR_STATE() AS ErrorState,
					ERROR_SEVERITY() AS ErrorSeverity,
					ERROR_PROCEDURE() AS ErrorProcedure,
					ERROR_LINE() AS ErrorLine,
					'Ups... There exist already patient with this PESEL!' AS ErrorMessage;
			END CATCH;
			ROLLBACK TRANSACTION
		END;

END

GO



--CHECKING
DECLARE 
	@pp_new_id INT,
	@pp_date DATE = '2000-05-30',
	@pp_pesel INT = 9708050471,
	@pp_phone_number INT = 501801201,
	@pp_address_id INT = 3;
EXEC AddPatient @p_id = @pp_new_id OUT, @p_first_name ='Sim', @p_surname = 'Idontknow', @p_date_of_birth = @pp_date, @p_pesel = @pp_pesel,  @p_phone_number = @pp_phone_number, @p_address_id = @pp_address_id;

GO


/*--------------------------------------------
			CURSOR IN CURSOR
Procedure that is showing list of all doctors with their list of visits (date)
by usinh cursor in cursor.
ADD FUN THAT IT WILL SHOW IN POINTED MOUTH AND YEAR
*/--------------------------------------------

CREATE PROCEDURE list_of_vists
AS
BEGIN
	SET NOCOUNT OFF;
	DECLARE cur_doctor CURSOR FOR
		SELECT e.first_name, e.surname, e.doctor_id FROM Doctor e;

	DECLARE cur_visit CURSOR FOR
	SELECT d.date_of_visit, d.doctor_id FROM Visit d;

	DECLARE 
		@doctor_first_name VARCHAR(20), 
		@doctor_surname VARCHAR(20),
		@doctor_id INT,
		@visit_date DATE,
		@doctor_id_visit INT;

	OPEN cur_doctor;
		FETCH NEXT FROM cur_doctor INTO @doctor_first_name, @doctor_surname, @doctor_id;
		WHILE @@Fetch_status = 0
		BEGIN
			PRINT 'Doctor: ' + CAST(@doctor_id AS VARCHAR) + ' ' + @doctor_first_name + ' ' + @doctor_surname + ' had visits at ';		
			OPEN cur_visit;
				FETCH NEXT FROM cur_visit INTO @visit_date, @doctor_id_visit;
				WHILE @@Fetch_status = 0
				BEGIN
					IF @doctor_id_visit = @doctor_id
					BEGIN
						PRINT CAST(@visit_date AS VARCHAR) + ' ';
					END;
					FETCH NEXT FROM cur_visit INTO @visit_date, @doctor_id_visit;
				END;
			CLOSE cur_visit;
			FETCH NEXT FROM cur_doctor INTO @doctor_first_name, @doctor_surname, @doctor_id;
			PRINT '';
		END;
	CLOSE cur_doctor;
	DEALLOCATE cur_visit;
	DEALLOCATE cur_doctor;
END
GO

--CHECKING
DECLARE @year INT;
EXEC list_of_vists ;