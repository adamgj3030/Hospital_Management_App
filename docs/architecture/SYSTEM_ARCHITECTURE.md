# System Architecture Overview

## Technology Stack

### Frontend
- **React**: UI framework
- **Tailwind CSS**: Styling framework
- **Vite**: Build tool

### Backend
- **Node.js**: Runtime environment
- **Express**: Web framework
- **MySQL**: Database (v8.0.37-azure)
- **JWT**: Authentication
- **Nodemailer**: Email notifications

## Database Architecture

### Core Tables
- **Users**: patient, doctor, admin (role-based tables)
- **Medical**: appointments, prescriptions, medical_history
- **Operations**: billing, insurance, services
- **Communication**: email_queue

### Key Features
- Foreign key constraints for data integrity
- Database triggers for:
  - Email notifications on appointment status changes
  - Automatic appointment updates when doctor/patient status changes
- Enum types for status fields
- Automated timestamps for auditing

### Email Queue System
```sql
CREATE TABLE email_queue (
  queueID INT UNSIGNED AUTO_INCREMENT,
  appointmentID INT UNSIGNED NOT NULL,
  patientID INT UNSIGNED NOT NULL,
  doctorID INT UNSIGNED NOT NULL,
  emailType ENUM('Confirmation', 'Cancellation') NOT NULL,
  status ENUM('Pending', 'Sent', 'Failed') NOT NULL DEFAULT 'Pending',
  sentAt DATETIME DEFAULT NULL,
  PRIMARY KEY (queueID)
)
```

## Authentication & Security

### JWT Implementation
- 1-hour token expiration
- Role-based access control (patient, doctor, admin)
- Token payload includes user ID and role

### Basic Security Measures
- CORS configuration for frontend domain
- SQL query parameterization
- Role-based route protection
- Input validation on API endpoints

### Areas for Security Enhancement
- Password hashing not implemented (currently plain text)
- No rate limiting
- No SSL/TLS configuration documented

## Data Flow Examples

### Appointment Booking
1. Frontend submits appointment request
2. Backend validates:
   - Doctor availability
   - Patient/Doctor status
   - Time slot conflicts
3. Database transaction:
   - Creates appointment record
   - Triggers email notification
4. Email service processes queue

### Prescription Management
1. Doctor creates prescription
2. System validates:
   - Patient-doctor relationship
   - Active status checks
3. Database updates:
   - Prescription record
   - Refill counters
   - Insurance approvals

## Database Triggers

### Appointment Status Trigger
```sql
CREATE TRIGGER appointment_status_email_update 
AFTER UPDATE ON appointment 
FOR EACH ROW
BEGIN
    IF OLD.status = 'Requested' AND NEW.status = 'Scheduled' THEN
        INSERT INTO email_queue (
            appointmentID, 
            patientID, 
            doctorID, 
            emailType
        ) VALUES (
            NEW.appointmentID, 
            NEW.patientID, 
            NEW.doctorID, 
            'Confirmation'
        );
    ELSEIF OLD.status = 'Scheduled' AND NEW.status = 'Cancelled' THEN
        INSERT INTO email_queue (
            appointmentID, 
            patientID, 
            doctorID, 
            emailType
        ) VALUES (
            NEW.appointmentID, 
            NEW.patientID, 
            NEW.doctorID, 
            'Cancellation'
        );
    END IF;
END;
```

## Development Environment

### Local Setup
- Node.js backend server
- MySQL database
- React development server
- Environment variables for configuration

### Database Connection
- Connection pooling implemented
- Transaction support for critical operations
- Foreign key constraints enforced

## Future Enhancement Recommendations

1. Security Improvements
   - Implement password hashing
   - Add rate limiting
   - Configure SSL/TLS
   - Enhance input validation

2. Performance Optimizations
   - Add caching layer
   - Implement connection pooling limits
   - Optimize database queries
   - Add index optimization

3. Monitoring
   - Add error tracking
   - Implement performance monitoring
   - Add audit logging

This documentation reflects the current implementation while noting areas for potential improvement.