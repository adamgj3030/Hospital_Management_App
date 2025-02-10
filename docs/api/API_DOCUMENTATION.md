# API Documentation

## Overview
This document outlines the RESTful API endpoints available in the Women's Health Medical Database system. All endpoints require authentication via JWT token except for login and registration.

## Base URL
```
http://localhost:5000/api
```

## Authentication

### Login
```http
POST /auth/login
```

**Request Body:**
```json
{
  "email": "user@example.com",
  "password": "password123",
  "role": "patient|doctor|admin"
}
```

**Response:**
```json
{
  "token": "jwt_token_here",
  "user": {
    "id": "user_id",
    "role": "patient|doctor|admin",
    "name": "User Name"
  }
}
```

### Registration
```http
POST /auth/register
```

**Request Body:**
```json
{
  "email": "user@example.com",
  "password": "password123",
  "name": "User Name",
  "role": "patient",
  "dateOfBirth": "1990-01-01",
  "phone": "123-456-7890"
}
```

## Patient Endpoints

### Get Patient Dashboard
```http
GET /patient/dashboard
```

**Response:**
```json
{
  "upcomingAppointments": [],
  "prescriptions": [],
  "bills": [],
  "notifications": []
}
```

### Book Appointment
```http
POST /patient/appointments
```

**Request Body:**
```json
{
  "doctorId": "doctor_id",
  "date": "2025-02-15",
  "time": "14:00",
  "type": "regular|followup|emergency"
}
```

### Get Medical History
```http
GET /patient/medical-history
```

### Update Medical History
```http
PUT /patient/medical-history
```

**Request Body:**
```json
{
  "allergies": [],
  "conditions": [],
  "surgeries": [],
  "medications": []
}
```

## Doctor Endpoints

### Get Doctor Schedule
```http
GET /doctor/schedule
```

**Query Parameters:**
- `date`: YYYY-MM-DD
- `office`: office_id (optional)

### Get Patient List
```http
GET /doctor/patients
```

### Update Appointment Status
```http
PUT /doctor/appointments/:id
```

**Request Body:**
```json
{
  "status": "confirmed|cancelled|completed",
  "notes": "Optional notes"
}
```

### Prescribe Medication
```http
POST /doctor/prescriptions
```

**Request Body:**
```json
{
  "patientId": "patient_id",
  "medication": "medication_name",
  "dosage": "dosage_info",
  "frequency": "frequency_info",
  "duration": "duration_info"
}
```

## Admin Endpoints

### Get Financial Report
```http
GET /admin/reports/financial
```

**Query Parameters:**
- `startDate`: YYYY-MM-DD
- `endDate`: YYYY-MM-DD
- `type`: "appointments|prescriptions|all"

### Manage Users
```http
PUT /admin/users/:id
```

**Request Body:**
```json
{
  "status": "active|inactive",
  "role": "patient|doctor"
}
```

### Get System Analytics
```http
GET /admin/analytics
```

**Query Parameters:**
- `period`: "daily|weekly|monthly|yearly"
- `type`: "appointments|prescriptions|revenue"

## Common Response Formats

### Success Response
```json
{
  "success": true,
  "data": {
    // Response data here
  }
}
```

### Error Response
```json
{
  "success": false,
  "error": {
    "code": "ERROR_CODE",
    "message": "Error description"
  }
}
```

## Error Codes
- `AUTH_ERROR`: Authentication related errors
- `VALIDATION_ERROR`: Invalid input data
- `NOT_FOUND`: Resource not found
- `PERMISSION_DENIED`: User lacks required permissions
- `SERVER_ERROR`: Internal server error

## Rate Limiting
- 100 requests per minute per IP address
- 1000 requests per hour per authenticated user

## Security
- All endpoints require HTTPS
- JWT tokens expire after 24 hours
- Passwords must meet minimum complexity requirements
- Input validation on all endpoints
- CORS configured for frontend domain only

This API documentation provides a comprehensive overview of the available endpoints and their usage. For detailed request/response examples and more specific use cases, please refer to the examples section below.

## Example Workflows

### Complete Appointment Booking Flow
1. Patient logs in
2. Gets available doctors
3. Books appointment
4. Receives confirmation
5. Doctor approves
6. Patient gets notification

### Prescription Management Flow
1. Doctor creates prescription
2. Patient receives notification
3. Patient selects pharmacy
4. Patient requests refill
5. Doctor approves refill
6. Pharmacy gets notified

For more examples and detailed workflows, please refer to our [API Examples](./EXAMPLES.md) document.