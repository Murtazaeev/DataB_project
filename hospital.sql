/* 
drop table ADDRESS cascade constraints PURGE;
drop table DIAGNOSIS cascade constraints PURGE;
drop table DOCTOR cascade constraints PURGE;
drop table MEDICINE cascade constraints PURGE;
drop table PATIENT cascade constraints PURGE;
drop table PRESCRIPTION cascade constraints PURGE;
drop table VISIT cascade constraints PURGE;
*/

set serveroutput on;
SET SERVEROUT ON;
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

CREATE TABLE Address (
    address_id      NUMBER(10)     PRIMARY KEY
                                 NOT NULL,
    country         VARCHAR2 (20),
    city            VARCHAR2 (30),
    street          VARCHAR2 (30),
    building_number VARCHAR2 (5)
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
VALUES (10, 'Poland', 'Warszawa', 'Glęboka', '68');
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
    patient_id     NUMBER (8)      PRIMARY KEY
                               NOT NULL,
    first_name          VARCHAR2 (20),
    surname       VARCHAR2 (20),
    date_of_birth DATE,
    PESEL         NUMBER,
    phone_number  NUMBER,
    address_id    NUMBER          REFERENCES Address (address_id) 
);

INSERT INTO Patient (patient_id , first_name ,surname,PESEL, phone_number, date_of_birth, address_id)
VALUES (1, 'Jan', 'Michalski', 96543234, 48642043, '2000-05-30', 1);
INSERT INTO Patient (patient_id , first_name ,surname,PESEL, phone_number, date_of_birth, address_id)
VALUES (2, 'Janek', 'Wiśniewski', 76857987, 43657567, '1997-02-20',  2);
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
    doctor_id NUMBER 
            PRIMARY KEY NOT NULL, 
    first_name VARCHAR2(20),
    surname VARCHAR2(20), 
    phone_number NUMBER, 
    address_id NUMBER REFERENCES Address (address_id), 
    salary NUMBER, 
    bonus NUMBER
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
    diagnosis_id      NUMBER (10) PRIMARY KEY
                           NOT NULL,      
    disease_name VARCHAR2(20),
    symptoms_comments VARCHAR2(400)
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
    visit_id      NUMBER (10) PRIMARY KEY
                           NOT NULL,
    date_of_visit DATE     NOT NULL,
    patient_id    NUMBER      NOT NULL
                           REFERENCES Patient (patient_id),
    doctor_id     NUMBER NOT NULL
                           REFERENCES Doctor (doctor_id),
    diagnosis_id NUMBER
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
    medicine_id      NUMBER (10) PRIMARY KEY
                           NOT NULL,
    name_of_medicine   VARCHAR2(30) UNIQUE
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
    prescription_id      NUMBER (10) PRIMARY KEY
                           NOT NULL,      
    medicine_id  NUMBER NOT NULL
                           REFERENCES Medicine (medicine_id),
    quantity_packages NUMBER(3),
    comment_dosage VARCHAR2(400),
    visit_id NUMBER NOT NULL
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

/*--------------------------------------------
				TRIGGER
After adding a visit display all his information (about date, doctor and patient surname). 
Trigger also should display number of this visit, in given day. 
If number of vists in this day is bigger then 10, raise an error.
*/--------------------------------------------
CREATE OR REPLACE TRIGGER new_visit
BEFORE INSERT ON visit FOR EACH ROW
DECLARE
visit_number_at_day NUMBER;
patient_first_name VARCHAR2(20);
patient_surname VARCHAR2(20);
doctor_first_name VARCHAR2(20);
doctor_surname VARCHAR2(20);
exc_too_many_visits EXCEPTION;
BEGIN
SELECT COUNT(visit_id) INTO visit_number_at_day FROM visit WHERE date_of_visit = :new.date_of_visit;
visit_number_at_day := visit_number_at_day +1;
IF visit_number_at_day > 10 THEN
    RAISE exc_too_many_visits; 
END IF;
SELECT patient.surname INTO patient_surname
FROM visit
INNER JOIN patient ON :new.patient_id = patient.patient_id
GROUP BY patient.surname, patient.surname;
SELECT doctor.surname INTO doctor_surname
FROM visit
INNER JOIN doctor ON :new.doctor_id = doctor.doctor_id
GROUP BY doctor.surname;
DBMS_output.put_line('Patient ' || patient_first_name || ' ' || patient_surname || ' has visit with doctor ' || doctor_first_name || ' '|| doctor_surname );
DBMS_output.put_line('Number or visit in '|| :new.date_of_visit || ' is: ' || visit_number_at_day );

EXCEPTION --exception handling
   WHEN exc_too_many_visits THEN 
       dbms_output.put_line('Too many visits in this day! (Over 10)'); 
       
END;
/

--CHECKING
INSERT INTO Visit (visit_id, date_of_visit, patient_id , doctor_id, diagnosis_id  )
VALUES (14, '2019-05-28', 10, 5, 13);



/*--------------------------------------------
			PROCEDURE WITH OUT
Procedure for inserting patients. The procedure should check whether the patient 
with the same PESEL already exists (otherwise we report an error).
Return the new id of patient in output parameter. 
Display a value received from procedure in output.
*/--------------------------------------------
CREATE OR REPLACE PROCEDURE Add_Patient 
(p_first_name patient.first_name%TYPE,
p_surname patient.surname%TYPE,
p_date_of_birth patient.date_of_birth%TYPE,
p_pesel patient.pesel%TYPE,
p_phone_number patient.phone_number%TYPE,
p_address_id patient.address_id%TYPE,
p_newPatNo OUT patient.patient_id%TYPE)
AS 
v_ifexists INTEGER;
exc_the_patient_already_exists EXCEPTION;
BEGIN
    SELECT COUNT(1) INTO v_ifexists FROM patient WHERE p_pesel = patient.pesel;
    IF v_ifexists=0  THEN        
        SELECT MAX(patient.patient_id)+1 INTO p_newPatNo FROM patient;
        INSERT INTO patient(patient_id,first_name,surname,date_of_birth,pesel,phone_number,address_id) 
		VALUES (p_newPatNo,p_first_name,p_surname,p_date_of_birth,p_pesel,p_phone_number,p_address_id);
        dbms_output.put_line('Succesfully added a patient with a new number ' || p_newPatNo) ;
    ELSE
        RAISE exc_the_patient_already_exists;
    --Raise_application_error(-20100,'This patient already exists!') ;    
 END IF;
 
 EXCEPTION --exception handling
   WHEN exc_the_patient_already_exists THEN 
       dbms_output.put_line('This patient already exists!');   
       
END Add_Patient;
/

--CHECKING
DECLARE v_patient INTEGER;
BEGIN    
    Add_Patient(p_first_name=>'Sim', p_surname => 'JOHNSON',p_date_of_birth => '2000-05-30',p_pesel => 9708050471, p_phone_number => 501801201 ,p_address_id=> 3 ,p_newPatNo => v_patient);    
END;




/*--------------------------------------------
				FUNCTION
Function which given a parameter (doctor id and date) will return number of visits 
taken by this doctor in the given date, if number of visits = 0, raise error.
*/--------------------------------------------
CREATE OR REPLACE FUNCTION visits_at_day(p_doctor_id INTEGER, p_date DATE) RETURN INTEGER
IS 
visit_number_at_day INTEGER;
exc_doctor_no_visit EXCEPTION;
BEGIN

    SELECT COUNT(1) INTO visit_number_at_day FROM visit WHERE visit.doctor_id = p_doctor_id AND visit.date_of_visit = p_date;
    IF visit_number_at_day = 0 THEN
        --Raise_application_error(-20100,'Doctor has not any visits this day!') ;   
        RAISE exc_doctor_no_visit;
    ELSE
        RETURN(visit_number_at_day);
    END IF;
    
 EXCEPTION --exception handling
   WHEN exc_doctor_no_visit THEN 
       dbms_output.put_line('Doctor has not any visits this day!');   
       
END visits_at_day;
/

--CHECKING
EXECUTE dbms_output.put_line('Doctor has: ' || visits_at_day(1, '19/05/10') ||' visit(s) this day');


/*--------------------------------------------
				CURSOR
Giving bonuses to doctors.
If visits bigger or equal to 2 in 2018 and salary < 3000, and no bonus yet, 
then give bonus of 10% of salary, 
if doctor has salary > 4000 and no visit in 2018 raise an error.
*/--------------------------------------------
CREATE OR REPLACE PROCEDURE GiveRaise
IS 
v_doctor_id doctor.doctor_id%TYPE; 
v_salary doctor.salary%TYPE;
v_date visit.date_of_visit%TYPE;
number_of_visits INTEGER;
exc_doctor_with_no_visit EXCEPTION;
if_has_bonus INTEGER;
CURSOR cur IS SELECT doctor.doctor_id, doctor.salary, visit.date_of_visit FROM doctor, visit WHERE visit.doctor_id = doctor.doctor_id AND EXTRACT(YEAR FROM visit.date_of_visit) = 2018;
BEGIN
    OPEN cur;    
    LOOP
        FETCH cur INTO v_doctor_id, v_salary, v_date;
        EXIT WHEN cur%NOTFOUND;
           IF v_salary < 3000 THEN  
                    SELECT COUNT(1) INTO number_of_visits FROM visit WHERE visit.doctor_id = v_doctor_id AND EXTRACT(YEAR FROM visit.date_of_visit) = 2018;
                    SELECT doctor.bonus INTO if_has_bonus FROM doctor WHERE v_doctor_id = doctor_id;
                    IF number_of_visits >= 2 AND if_has_bonus = null OR if_has_bonus = 0 THEN
                        UPDATE doctor
                        SET bonus = bonus + salary * 0.1
                        WHERE doctor_id = v_doctor_id;
                        dbms_output.put_line('Doctor with number ' || v_doctor_id || ' got ' || v_salary*0.1 || ' bonus');      
                    END IF;
           ELSIF v_salary > 4000 THEN
                SELECT COUNT(1) INTO number_of_visits FROM visit WHERE visit.doctor_id = v_doctor_id AND EXTRACT(YEAR FROM visit.date_of_visit) = 2018;
                IF number_of_visits = 0 THEN
                    RAISE exc_doctor_with_no_visit;
                    CLOSE cur;
                END IF;    
            END IF;
    END LOOP;
    CLOSE cur;
    
     EXCEPTION --exception handling
   WHEN exc_doctor_with_no_visit THEN 
       dbms_output.put_line('There is a doctor with no visits in 2018 and salary over 4000!');   
END;

--CHECKING
EXECUTE GiveRaise;