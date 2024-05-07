# Hospital Database Schema

## Overview
This database schema is designed to manage hospital operations efficiently, including patient management, appointments, admissions, prescriptions, inventory, and staff management.

## Tables

### Patient
- PatientID: INT PRIMARY KEY
- Name: VARCHAR(100)
- DateOfBirth: DATE
- Gender: VARCHAR(10)
- ContactInfo: VARCHAR(100)
- Address: VARCHAR(255)
- InsuranceInfo: VARCHAR(255)

### Doctor
- DoctorID: INT PRIMARY KEY
- Name: VARCHAR(100)
- Specialization: VARCHAR(100)
- ContactInfo: VARCHAR(100)
- DepartmentID: INT

### Appointment
- AppointmentID: INT PRIMARY KEY
- PatientID: INT
- DoctorID: INT
- NurseID: INT
- AppointmentDateTime: DATETIME
- Reason: VARCHAR(255)
- Status: ENUM('Scheduled', 'Completed', 'Canceled')

### Admission
- AdmissionID: INT PRIMARY KEY
- PatientID: INT
- NurseID: INT
- AdmissionDateTime: DATETIME
- DischargeDateTime: DATETIME
- WardRoomNumber: VARCHAR(50)
- AdmittingDoctorID: INT
- Diagnosis: VARCHAR(255)

### Prescription
- PrescriptionID: INT PRIMARY KEY
- PatientID: INT
- DoctorID: INT
- NurseID: INT
- MedicationName: VARCHAR(100)
- Dosage: VARCHAR(50)
- Frequency: VARCHAR(50)
- StartDate: DATE
- EndDate: DATE
- PharmacyID: INT

### Department
- DepartmentID: INT PRIMARY KEY
- DepartmentName: VARCHAR(100)
- HeadOfDepartment: VARCHAR(100)
- ContactInfo: VARCHAR(100)

### Staff
- StaffID: INT PRIMARY KEY
- Name: VARCHAR(100)
- Position: VARCHAR(100)
- ContactInfo: VARCHAR(100)
- DepartmentID: INT

### Inventory
- ItemID: INT PRIMARY KEY
- ItemName: VARCHAR(100)
- QuantityOnHand: INT
- Location: VARCHAR(100)
- SupplierInfo: VARCHAR(255)

### ERPatient
- ERPatientID: INT PRIMARY KEY
- Name: VARCHAR(100)
- DateOfBirth: DATE
- Gender: VARCHAR(10)
- ContactInfo: VARCHAR(100)
- Address: VARCHAR(255)
- ArrivalDateTime: DATETIME
- ChiefComplaint: VARCHAR(255)
- TriageLevel: INT
- InitialAssessment: VARCHAR(255)
- TreatmentPlan: VARCHAR(255)
- Disposition: VARCHAR(50)
- Outcome: VARCHAR(50)

### ORPatient
- ORPatientID: INT PRIMARY KEY
- Name: VARCHAR(100)
- DateOfBirth: DATE
- Gender: VARCHAR(10)
- ContactInfo: VARCHAR(100)
- Address: VARCHAR(255)
- ArrivalDateTime: DATETIME
- ProceduresPerformed: VARCHAR(255)
- SurgeonID: INT
- AnesthesiologistID: INT

### ORRoom
- ORRoomID: INT PRIMARY KEY
- RoomNumber: VARCHAR(50)
- DepartmentID: INT
- InventoryID: INT

### Pharmacy
- PharmacyID: INT PRIMARY KEY
- Name: VARCHAR(100)
- Location: VARCHAR(255)
- ContactInfo: VARCHAR(100)
- DrugID: INT
- InventoryID: INT

### Drug
- DrugID: INT PRIMARY KEY
- Name: VARCHAR(100)
- Description: TEXT

### Nurses
- NurseID: INT PRIMARY KEY
- Name: VARCHAR(100)
- ContactInfo: VARCHAR(100)
- DepartmentID: INT
- StaffID: INT

## Foreign Key Constraints
- Appointment: Foreign key constraints for DoctorID and NurseID.
- Admission: Foreign key constraints for NurseID and AdmittingDoctorID.
- ORPatient: Foreign key constraints for SurgeonID and AnesthesiologistID.
- ORRoom: Foreign key constraints for DepartmentID and InventoryID.
- Pharmacy: Foreign key constraints for DrugID and InventoryID.
- Prescription: Foreign key constraints for PatientID, DoctorID, NurseID, PharmacyID, ERPatientID, and ORPatientID.
- Doctor: Foreign key constraint for DepartmentID.
- Nurses: Foreign key constraint for DepartmentID.
- Staff: Foreign key constraints for DepartmentID, DoctorID, and NurseID.
- Inventory: Foreign key constraint for ItemID.
- Patient: Foreign key constraints for ERPatientID and ORPatientID.
- Admission: Foreign key constraint for PatientID.
- Pharmacy: Foreign key constraint for PrescriptionID.

