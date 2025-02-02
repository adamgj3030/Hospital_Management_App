# Women's Health Medical Database

A user-friendly platform connecting **doctors** and **patients** for appointment scheduling, prescription management, billing/insurance tracking, and more. Designed with real-world business constraints in mind, our full-stack solution provides a seamless, interactive experience across multiple user roles.

---

## Table of Contents
1. [Overview](#overview)  
2. [Features](#features)  
   - [Patient Services](#patient-services)  
   - [Doctor Services](#doctor-services)  
   - [Admin Services](#admin-services)  
   - [Triggers](#triggers)  
3. [Architecture and Technology Stack](#architecture-and-technology-stack)  
4. [Screenshots (Optional)](#screenshots-optional)  
5. [Installation and Setup](#installation-and-setup)  
6. [Team Members & Contributions](#team-members--contributions)  
7. [License](#license)

---

## Overview
Our **Women’s Health Medical Database** is built to streamline healthcare processes—covering everything from **appointment scheduling** to **medical record maintenance**, **billing**, and **insurance management**. The platform is highly scalable and can be extended to other medical domains.

### Key Highlights:
- **Intuitive UI** for patients, doctors, and admins, each with tailored dashboards.
- **Comprehensive Database** schema designed for real-world health service constraints.
- **Automated Email Triggers** for appointment confirmations and cancellations.

---

## Features

### Patient Services
1. **Appointment Management**  
   - Book appointments with doctors across various specialties and locations.  
   - View, filter, and cancel appointments.
2. **Medical Records**  
   - Add and update allergies, disabilities, vaccines, surgeries, and general health info.
3. **Prescriptions**  
   - View current prescriptions, request refills, and select a preferred pharmacy.
4. **Billing**  
   - View and pay bills (partial or full).  
   - See billing details linked to appointments and medications.
5. **Insurance Management**  
   - Add and update insurance info.  
   - Search for insurance providers.

### Doctor Services
1. **Multiple Offices**  
   - Manage appointments across multiple locations in different states.
2. **Appointment Updates**  
   - Accept or deny appointment requests.  
   - View patient’s upcoming, requested, and past appointments.
3. **Patient Information**  
   - Access patient contact details, medical history, and appointment records.  
   - Update patient prescriptions and medical history notes.

### Admin Services
1. **User Management**  
   - Deactivate patient or doctor accounts.
2. **Reports and Metrics**  
   - **Prescription Analysis**: Medicine details, associated doctors, and insurance data.
   - **Appointment Metrics**: Track appointments by patient, doctor, visit types, specialties, and date ranges.
   - **Doctor Reports**: Review doctor specialties, office locations, prescriptions, and availability.
   - **Financial/Billing Reports**: Analyze billing data per patient, doctor, or office location.

### Triggers
1. **`doctor_inactivation_update`**  
   - When a doctor is deactivated (`inactive` set from 0 → 1), all their appointments move from:  
     - **Scheduled** → **Cancelled**  
     - **Requested** → **Request Denied**
2. **`patient_inactivation_update`**  
   - When a patient is deactivated (`inactive` set from 0 → 1), all their appointments move from:  
     - **Scheduled** → **Cancelled**  
     - **Requested** → **Request Denied**
3. **`appointment_status_email_update`**  
   - Monitors status changes in the **appointments** table.  
   - If status changes from **Requested** → **Scheduled**, a confirmation email is queued.  
   - If status changes from **Scheduled** → **Cancelled**, a cancellation email is queued.

---

## Architecture and Technology Stack
- **Frontend**: React  
  - Provides a dynamic and responsive user interface.
- **Backend**: Node.js + Express  
  - Handles RESTful APIs, user authentication, and business logic.
- **Database**: MySQL  
  - Stores user data, appointments, prescriptions, billing, and more.
- **Deployment**:  
  - Deployed on a cloud platform (e.g., AWS, Heroku, or similar) for both backend and frontend.

---

## Installation and Setup

1. **Clone the Repository**
   ```bash
   git clone https://github.com/YourUsername/Womens-Health-Medical-Database.git
   cd Womens-Health-Medical-Database
   ```

2. **Database Setup**
   ```sql
   CREATE DATABASE womens_health_db;
   USE womens_health_db;
   SOURCE path/to/dumpfile.sql;
   ```

3. **Backend Setup**
   ```bash
   cd server
   npm install
   npm start
   ```

4. **Frontend Setup**
   ```bash
   cd ../client
   npm install
   npm start
   ```

5. **Access the Application**
   - Open your browser at `http://localhost:3000/` to view the login page.

---

## Team Members & Contributions

| Name                  | Key Contributions | Rating |
|-----------------------|------------------|--------|
| **Sthiber Guevara**   | Patient pages, doctor schedule, admin financial report | 4.5 |
| **Anthony Casarta**   | Personal info, medical history, insurance, deployment | 4.5 |
| **Eraj Anwar**        | Authentication, registration, doctor assignment | 4 |
| **Isabella Truong**   | Dashboards, sidebars, patient info reports | 4 |
| **Adam Johnson**      | Booking, appointment handling, admin deactivation, email triggers | 5 |

---

## License

This project is licensed under the [MIT License](LICENSE).

Feel free to fork and modify for your own use.

---

**Thank you for checking out our Women’s Health Medical Database!**  
If you have any questions or suggestions, please open an issue or submit a pull request. We appreciate your feedback and contributions.

---

> **Note:** This application is a conceptual project for a database systems course (COSC 3380 – Fall 2024). While it mirrors real-world constraints and functionalities, it is not intended for production use without further security and compliance reviews.

