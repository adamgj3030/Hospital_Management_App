# Docker Setup Guide

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- Azure account (for production database)

## Project Structure
```
Hospital_Management_App/
├── docker-compose.yml
├── client/
│   ├── Dockerfile
│   └── ...
├── server/
│   ├── Dockerfile
│   └── ...
└── SQLdump_Screenshots/
    └── Hospital_Management_App_prod_dump.sql
```

## Configuration Files

### 1. docker-compose.yml
```yaml
version: '3.8'

services:
  frontend:
    build: ./client
    ports:
      - "5173:5173"
    environment:
      - VITE_API_URL=http://localhost:5000
    depends_on:
      - backend

  backend:
    build: ./server
    ports:
      - "5000:5000"
    environment:
      - DB_HOST=database
      - DB_USER=root
      - DB_PASSWORD=your_password
      - DB_NAME=womens_health_db
      - JWT_SECRET=your_jwt_secret
      - EMAIL_USER=your_email
      - EMAIL_PASS=your_email_password
    depends_on:
      - database

  database:
    image: mysql:8.0.37
    ports:
      - "3306:3306"
    environment:
      - MYSQL_ROOT_PASSWORD=your_password
      - MYSQL_DATABASE=womens_health_db
    volumes:
      - ./SQLdump_Screenshots/Hospital_Management_App_prod_dump.sql:/docker-entrypoint-initdb.d/init.sql
      - db_data:/var/lib/mysql

volumes:
  db_data:
```

### 2. Client Dockerfile (client/Dockerfile)
```dockerfile
FROM node:16

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 5173
CMD ["npm", "run", "dev"]
```

### 3. Server Dockerfile (server/Dockerfile)
```dockerfile
FROM node:16

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 5000
CMD ["npm", "start"]
```

## Environment Setup

### 1. Development Environment
Create `.env` files for local development:

**Client (.env)**
```
VITE_API_URL=http://localhost:5000
```

**Server (.env)**
```
DB_HOST=database
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=womens_health_db
JWT_SECRET=your_jwt_secret
EMAIL_USER=your_email
EMAIL_PASS=your_email_password
```

### 2. Production Environment
For Azure deployment, update server environment variables:

```
DB_HOST=medclinic-mysql-db-server.mysql.database.azure.com
DB_USER=medclinic_db_admin
DB_PASSWORD=your_azure_password
DB_NAME=womens_health_db
```

## Quick Start Guide

1. **Clone the repository**
   ```bash
   git clone [repository-url]
   cd Hospital_Management_App
   ```

2. **Set up environment files**
   - Create .env files in client and server directories
   - Add necessary environment variables

3. **Start the application**
   ```bash
   docker-compose up --build
   ```

4. **Access the application**
   - Frontend: http://localhost:5173
   - Backend API: http://localhost:5000

## Development Workflow

### Making Changes
1. Frontend (React + Vite)
   - Changes hot reload automatically
   - Running on port 5173

2. Backend (Node.js + Express)
   - Restart required for changes: `docker-compose restart backend`
   - Running on port 5000

3. Database
   - Local MySQL instance on port 3306
   - Use Azure database for production

### Database Management
1. **Local Development**
   ```bash
   # Import database schema
   docker-compose exec database mysql -u root -p womens_health_db < SQLdump_Screenshots/Hospital_Management_App_prod_dump.sql
   ```


## Troubleshooting

### Logs
```bash
# View all logs
docker-compose logs

# View specific service logs
docker-compose logs frontend
docker-compose logs backend
docker-compose logs database
```

This Docker setup provides a consistent and reliable way to run the application across different environments while simplifying the development process.