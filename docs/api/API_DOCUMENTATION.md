# API Documentation

## Example Usage Scenarios

### 1. Authentication and Registration

#### A. User Login
```http
POST /auth/login
Content-Type: application/json
```
**Request:**
```json
{
  "email": "user@example.com",
  "password": "password123"
}
```
**Success Response:**
```json
{
  "message": "Login successful",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "user": {
    "id": "123",
    "email": "user@example.com",
    "role": "patient"
  }
}
```
**Error Response:**
```json
{
  "message": "Invalid email or password"
}
```

#### B. Patient Registration
```http
POST /auth/register
Content-Type: application/json
```
**Request:**
```json
{
  "firstName": "John",
  "lastName": "Doe",
  "dateOfBirth": "1990-01-01",
  "gender": "M",
  "phoneNumber": "123-456-7890",
  "email": "patient@example.com",
  "password": "password123",
  "addrStreet": "123 Main St",
  "addrZip": "12345",
  "addrCity": "Houston",
  "addrState": "TX",
  "emergencyFirstName": "Jane",
  "emergencyLastName": "Doe",
  "emergencyRelationship": "Spouse",
  "emergencyPhoneNumber": "098-765-4321",
  "emergencyEmail": "emergency@example.com"
}
```
**Success Response:**
```json
{
  "message": "Registration Successful!"
}
```
**Error Response:**
```json
{
  "message": "Email already exists!",
  "code": "VALIDATION_ERROR"
}
```

#### C. Doctor Registration (Admin Only)
```http
POST /auth/admin/register
Authorization: Bearer <admin_token>
Content-Type: application/json
```
**Request:**
```json
{
  "firstName": "Sarah",
  "lastName": "Smith",
  "gender": "F",
  "dateOfBirth": "1980-01-01",
  "workPhoneNumber": "123-456-7890",
  "workEmail": "dr.smith@hospital.com",
  "password": "password123",
  "personalPhoneNumber": "098-765-4321",
  "personalEmail": "sarah.smith@email.com",
  "addrStreet": "456 Medical Center Dr",
  "addrZip": "77001",
  "addrCity": "Houston",
  "addrState": "TX",
  "officeID": "1",
  "specialtyID": "1"
}
```
**Success Response:**
```json
{
  "message": "Registration Successful!"
}
```
**Error Response:**
```json
{
  "message": "Email already exists!",
  "code": "VALIDATION_ERROR"
}
```

### 2. Appointment Booking Flow

#### A. Get Available Specialties
```http
GET /appointment/specialties
```
**Response:**
```json
{
  "specialties": [
    {
      "specialtyID": "1",
      "specialtyName": "Obstetrics",
      "description": "Pregnancy and childbirth care"
    },
    {
      "specialtyID": "2",
      "specialtyName": "Gynecology",
      "description": "Women's reproductive health"
    }
  ]
}
```

#### B. Get Available Services for Specialty
```http
GET /appointment/services?specialtyID=1
```
**Response:**
```json
{
  "services": [
    {
      "serviceID": "101",
      "serviceName": "Initial Prenatal Visit",
      "price": "250.00"
    },
    {
      "serviceID": "102",
      "serviceName": "Regular Checkup",
      "price": "150.00"
    }
  ]
}
```

#### C. Find Available Doctors
```http
GET /appointment/doctors?specialtyID=1&state=TX&city=Houston
```
**Response:**
```json
{
  "doctors": [
    {
      "doctorID": "301",
      "firstName": "Sarah",
      "lastName": "Smith",
      "gender": "F",
      "specialtyName": "Obstetrics",
      "officeLocation": "Houston Women's Clinic",
      "officeAddress": "123 Medical Center Dr, Houston, TX 77001"
    }
  ]
}
```

#### D. Check Available Time Slots
```http
GET /appointment/appointments?doctorID=301&date=2025-03-26
```
**Response:**
```json
{
  "appointments": [
    {
      "appointmentDateTime": "2025-03-26T09:00:00",
      "status": "Scheduled"
    },
    {
      "appointmentDateTime": "2025-03-26T10:00:00",
      "status": "Available"
    }
  ]
}
```

#### E. Book Appointment
```http
POST /appointment/book
Authorization: Bearer <token>
```
**Request:**
```json
{
  "appointmentDateTime": "2025-03-26T10:00:00",
  "reason": "Initial pregnancy consultation",
  "doctorID": "301",
  "serviceID": "101",
  "visitType": "In-Person"
}
```

### 3. Patient Medical History Management

#### A. Submit Medical History
```http
POST /auth/patient/medical-history
Authorization: Bearer <token>
```
**Request:**
```json
{
  "allergies": [
    {
      "allergen": "Penicillin",
      "reaction": "Rash",
      "severity": "Moderate"
    }
  ],
  "conditions": [
    {
      "condition": "Asthma",
      "diagnosedDate": "2020-05-15",
      "status": "Controlled"
    }
  ],
  "surgeries": [
    {
      "procedure": "Appendectomy",
      "date": "2019-03-10",
      "hospital": "Memorial Hospital"
    }
  ],
  "medications": [
    {
      "name": "Albuterol",
      "dosage": "90mcg",
      "frequency": "As needed"
    }
  ]
}
```

#### B. Update Insurance Information
```http
PUT /auth/patient/update-insurance
Authorization: Bearer <token>
```
**Request:**
```json
{
  "insuranceProvider": "Blue Cross",
  "policyNumber": "BC123456789",
  "groupNumber": "G987654",
  "primaryHolder": "John Doe",
  "relationship": "Self",
  "effectiveDate": "2025-01-01",
  "expirationDate": "2025-12-31"
}
```

### 4. Doctor's Daily Workflow

#### A. View Today's Appointments
```http
GET /dataFetch/get-doctor-appointments
Authorization: Bearer <token>
```
**Response:**
```json
{
  "appointments": [
    {
      "appointmentID": "501",
      "patientFirstName": "Alice",
      "patientLastName": "Johnson",
      "appointmentDateTime": "2025-03-26T09:00:00",
      "status": "Scheduled",
      "serviceName": "Regular Checkup",
      "patientDOB": "1990-05-15",
      "patientGender": "F",
      "patientPhoneNumber": "123-456-7890"
    }
  ]
}
```

#### B. Update Appointment Status
```http
PUT /appointment/updateAppointment
Authorization: Bearer <token>
```
**Request:**
```json
{
  "appointmentID": "501",
  "status": "Completed"
}
```

### 5. Admin Analytics and Reports

#### A. Get Appointment Analytics
```http
GET /auth/admin/appointmentAnalytics
Authorization: Bearer <token>
```
**Response:**
```json
{
  "totalAppointments": 150,
  "byStatus": {
    "Completed": 100,
    "Scheduled": 30,
    "Cancelled": 15,
    "Missed": 5
  },
  "bySpecialty": {
    "Obstetrics": 80,
    "Gynecology": 70
  },
  "byDoctor": [
    {
      "doctorName": "Dr. Sarah Smith",
      "appointmentCount": 45
    }
  ]
}
```

#### B. Generate Prescription Report
```http
GET /auth/admin/get-prescription-report?startDate=2025-01-01&endDate=2025-03-26
Authorization: Bearer <token>
```
**Response:**
```json
{
  "totalPrescriptions": 250,
  "byDoctor": [
    {
      "doctorName": "Dr. Sarah Smith",
      "prescriptionCount": 75,
      "topMedications": [
        {
          "medication": "Prenatal Vitamins",
          "count": 30
        }
      ]
    }
  ],
  "mostPrescribed": [
    {
      "medication": "Prenatal Vitamins",
      "count": 100
    }
  ]
}
```

## Notes on Error Handling

All endpoints follow consistent error handling:

```json
{
  "message": "Detailed error message",
  "code": "ERROR_CODE",
  "details": {
    "field": "Description of the issue"
  }
}
```

Common error scenarios:
1. Invalid Authentication
```json
{
  "message": "Invalid or expired token",
  "code": "AUTH_ERROR"
}
```

2. Data Validation
```json
{
  "message": "Invalid input data",
  "code": "VALIDATION_ERROR",
  "details": {
    "appointmentDateTime": "Must be a future date",
    "visitType": "Must be one of the allowed types"
  }
}
```

3. Resource Conflicts
```json
{
  "message": "Resource conflict",
  "code": "CONFLICT_ERROR",
  "details": {
    "appointment": "Time slot already booked"
  }
}
```
