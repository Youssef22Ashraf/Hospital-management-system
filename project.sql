-- Create the hospital database
-- CREATE DATABASE IF NOT EXISTS hospital;
-- USE hospital;

-- Patient table
-- CREATE TABLE Patient (
--     PatientID INT PRIMARY KEY,
--     Name VARCHAR(100),
--     DateOfBirth DATE,
--     Gender VARCHAR(10),
--     ContactInfo VARCHAR(100),
--     Address VARCHAR(255),
--     InsuranceInfo VARCHAR(255)
-- );

-- Doctor table
-- CREATE TABLE Doctor (
--     DoctorID INT PRIMARY KEY,
--     Name VARCHAR(100),
--     Specialization VARCHAR(100),
--     ContactInfo VARCHAR(100),
--     DepartmentID INT
-- );

-- Appointment table
-- CREATE TABLE Appointment (
--     AppointmentID INT PRIMARY KEY,
--     PatientID INT,
--     DoctorID INT,
--     NurseID INT,
--     AppointmentDateTime DATETIME,
--     Reason VARCHAR(255),
--     Status ENUM('Scheduled', 'Completed', 'Canceled')
-- );

-- Admission table
-- CREATE TABLE Admission (
--     AdmissionID INT PRIMARY KEY,
--     PatientID INT,
--     NurseID INT,
--     AdmissionDateTime DATETIME,
--     DischargeDateTime DATETIME,
--     WardRoomNumber VARCHAR(50),
--     AdmittingDoctorID INT,
--     Diagnosis VARCHAR(255)
-- );

-- Prescription table
-- CREATE TABLE Prescription (
--     PrescriptionID INT PRIMARY KEY,
--     PatientID INT,
--     DoctorID INT,
--     NurseID INT,
--     MedicationName VARCHAR(100),
--     Dosage VARCHAR(50),
--     Frequency VARCHAR(50),
--     StartDate DATE,
--     EndDate DATE,
--     PharmacyID INT
-- );

-- Department table
-- CREATE TABLE Department (
--     DepartmentID INT PRIMARY KEY,
--     DepartmentName VARCHAR(100),
--     HeadOfDepartment VARCHAR(100),
--     ContactInfo VARCHAR(100)
-- );

-- Staff table
-- CREATE TABLE Staff (
--     StaffID INT PRIMARY KEY,
--     Name VARCHAR(100),
--     Position VARCHAR(100),
--     ContactInfo VARCHAR(100),
--     DepartmentID INT
-- );

-- Inventory table
-- CREATE TABLE Inventory (
--     ItemID INT PRIMARY KEY,
--     ItemName VARCHAR(100),
--     QuantityOnHand INT,
--     Location VARCHAR(100),
--     SupplierInfo VARCHAR(255)
-- );

-- ERPatient table
-- CREATE TABLE ERPatient (
--     ERPatientID INT PRIMARY KEY,
--     Name VARCHAR(100),
--     DateOfBirth DATE,
--     Gender VARCHAR(10),
--     ContactInfo VARCHAR(100),
--     Address VARCHAR(255),
--     ArrivalDateTime DATETIME,
--     ChiefComplaint VARCHAR(255),
--     TriageLevel INT,
--     InitialAssessment VARCHAR(255),
--     TreatmentPlan VARCHAR(255),
--     Disposition VARCHAR(50),
--     Outcome VARCHAR(50)
-- );

-- ORPatient table
-- CREATE TABLE ORPatient (
--     ORPatientID INT PRIMARY KEY,
--     Name VARCHAR(100),
--     DateOfBirth DATE,
--     Gender VARCHAR(10),
--     ContactInfo VARCHAR(100),
--     Address VARCHAR(255),
--     ArrivalDateTime DATETIME,
--     ProceduresPerformed VARCHAR(255),
--     SurgeonID INT,
--     AnesthesiologistID INT
-- );

-- ORRoom table
-- CREATE TABLE ORRoom (
--     ORRoomID INT PRIMARY KEY,
--     RoomNumber VARCHAR(50),
--     DepartmentID INT,
--     InventoryID INT
-- );

-- Pharmacy table
-- CREATE TABLE Pharmacy (
--     PharmacyID INT PRIMARY KEY,
--     Name VARCHAR(100),
--     Location VARCHAR(255),
--     ContactInfo VARCHAR(100),
--     DrugID INT,
--     InventoryID INT
-- );

-- Drug table
-- CREATE TABLE Drug (
--     DrugID INT PRIMARY KEY,
--     Name VARCHAR(100),
--     Description TEXT
-- );

-- Nurses table
-- CREATE TABLE Nurses (
--     NurseID INT PRIMARY KEY,
--     Name VARCHAR(100),
--     ContactInfo VARCHAR(100),
--     DepartmentID INT,
--     StaffID INT
-- );

-- -- Add Foreign Keys
-- ALTER TABLE Appointment
--     ADD CONSTRAINT fk_appointment_nurse FOREIGN KEY (NurseID) REFERENCES Nurses(NurseID) ON DELETE SET NULL ON UPDATE CASCADE,
--     ADD CONSTRAINT fk_appointment_doctor FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID) ON DELETE SET NULL ON UPDATE CASCADE;

-- -- Admission table foreign key constraints
-- ALTER TABLE Admission
--     ADD CONSTRAINT fk_admission_nurse FOREIGN KEY (NurseID) REFERENCES Nurses(NurseID) ON DELETE SET NULL ON UPDATE CASCADE,
--     ADD CONSTRAINT fk_admission_doctor FOREIGN KEY (AdmittingDoctorID) REFERENCES Doctor(DoctorID) ON DELETE SET NULL ON UPDATE CASCADE;

-- -- ORPatient table foreign key constraints
-- ALTER TABLE ORPatient
--     ADD CONSTRAINT fk_orpatient_surgeon FOREIGN KEY (SurgeonID) REFERENCES Doctor(DoctorID) ON DELETE SET NULL ON UPDATE CASCADE,
--     ADD CONSTRAINT fk_orpatient_anesthesiologist FOREIGN KEY (AnesthesiologistID) REFERENCES Doctor(DoctorID) ON DELETE SET NULL ON UPDATE CASCADE;

-- -- ORRoom table foreign key constraints
-- ALTER TABLE ORRoom
--     ADD CONSTRAINT fk_orroom_department FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID) ON DELETE SET NULL ON UPDATE CASCADE,
--     ADD CONSTRAINT fk_orroom_inventory FOREIGN KEY (InventoryID) REFERENCES Inventory(ItemID) ON DELETE SET NULL ON UPDATE CASCADE;

-- -- Pharmacy table foreign key constraints
-- ALTER TABLE Pharmacy
--     ADD CONSTRAINT fk_pharmacy_drug FOREIGN KEY (DrugID) REFERENCES Drug(DrugID) ON DELETE SET NULL ON UPDATE CASCADE,
--     ADD CONSTRAINT fk_pharmacy_inventory FOREIGN KEY (InventoryID) REFERENCES Inventory(ItemID) ON DELETE SET NULL ON UPDATE CASCADE;

-- -- Prescription table foreign key constraints
-- ALTER TABLE Prescription
--     ADD CONSTRAINT fk_prescription_patient FOREIGN KEY (PatientID) REFERENCES Patient(PatientID) ON DELETE SET NULL ON UPDATE CASCADE,
--     ADD CONSTRAINT fk_prescription_doctor FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID) ON DELETE SET NULL ON UPDATE CASCADE,
--     ADD CONSTRAINT fk_prescription_nurse FOREIGN KEY (NurseID) REFERENCES Nurses(NurseID) ON DELETE SET NULL ON UPDATE CASCADE,
--     ADD CONSTRAINT fk_prescription_pharmacy FOREIGN KEY (PharmacyID) REFERENCES Pharmacy(PharmacyID) ON DELETE SET NULL ON UPDATE CASCADE,
--     ADD CONSTRAINT fk_prescription_erpatient FOREIGN KEY (PatientID) REFERENCES ERPatient(ERPatientID) ON DELETE SET NULL ON UPDATE CASCADE,
--     ADD CONSTRAINT fk_prescription_orpatient FOREIGN KEY (PatientID) REFERENCES ORPatient(ORPatientID) ON DELETE SET NULL ON UPDATE CASCADE;
-- Prescription table foreign key constraints

-- -- Add DepartmentID as foreign key to Doctor table
-- ALTER TABLE Doctor
--     ADD CONSTRAINT fk_doctor_department FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID) ON DELETE SET NULL ON UPDATE CASCADE;

-- -- Add DepartmentID as foreign key to Nurses table
-- ALTER TABLE Nurses
--     ADD CONSTRAINT fk_nurses_department FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID) ON DELETE SET NULL ON UPDATE CASCADE;
--     
-- -- Add some foreign keys to staff table
-- ALTER TABLE Staff
-- 	ADD CONSTRAINT fk_staff_department FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID) ON DELETE SET NULL ON UPDATE CASCADE,
--     ADD CONSTRAINT fk_staff_doctor FOREIGN KEY (staffID) REFERENCES Doctor(DoctorID) ON DELETE cascade ON UPDATE CASCADE,
--     ADD CONSTRAINT fk_staff_nurse FOREIGN KEY (staffid) REFERENCES Nurses(NurseID) ON DELETE cascade ON UPDATE CASCADE;
--     
-- ALTER TABLE Inventory
--     ADD CONSTRAINT fk_inventory_drug FOREIGN KEY (ItemID) REFERENCES Drug(DrugID) ON DELETE cascade ON UPDATE CASCADE;

-- ALTER TABLE Patient
--     ADD CONSTRAINT fk_patient_erpatient FOREIGN KEY (PatientID) REFERENCES ERPatient(ERPatientID) ON DELETE cascade ON UPDATE CASCADE,
--     ADD CONSTRAINT fk_patient_orpatient FOREIGN KEY (PatientID) REFERENCES ORPatient(ORPatientID) ON DELETE cascade ON UPDATE CASCADE;

-- ALTER TABLE Admission
--     ADD CONSTRAINT fk_admission_patient FOREIGN KEY (PatientID) REFERENCES Patient(PatientID) ON DELETE SET NULL ON UPDATE CASCADE;

-- ALTER TABLE Pharmacy
-- 	ADD COLUMN ph_PrescriptionID Int,
--     ADD CONSTRAINT fk_pharmacy_prescription FOREIGN KEY (ph_PrescriptionID) REFERENCES Prescription(PrescriptionID) ON DELETE SET NULL ON UPDATE CASCADE;
