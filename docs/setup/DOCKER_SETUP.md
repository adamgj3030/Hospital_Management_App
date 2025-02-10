# Docker Setup Guide

## Why Docker?

Docker makes it incredibly easy for anyone to run this application by packaging everything needed into containers. This means:

1. No need to install MySQL, Node.js, or other dependencies manually
2. Consistent environment across all machines
3. Easy setup with just a few commands
4. Isolated development environment

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Project Structure with Docker

```
Hospital_Management_App/
├── docker-compose.yml
├── client/
│   ├── Dockerfile
│   └── ...
├── server/
│   ├── Dockerfile
│   └── ...
└── init.sql
```

## Configuration Files

### 1. docker-compose.yml
```yaml
version: '3.8'

services:
  frontend:
    build: ./client
    ports:
      - "3000:3000"
    environment:
      - REACT_APP_API_URL=http://localhost:5000
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
    depends_on:
      - database

  database:
    image: mysql:8
    ports:
      - "3306:3306"
    environment:
      - MYSQL_ROOT_PASSWORD=your_password
      - MYSQL_DATABASE=womens_health_db
    volumes:
      - ./init.sql:/docker-entrypoint-initdb.d/init.sql
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

EXPOSE 3000
CMD ["npm", "start"]
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

## Quick Start Guide

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/Hospital_Management_App.git
   cd Hospital_Management_App
   ```

2. **Create environment files**
   ```bash
   # Create .env file in client directory
   REACT_APP_API_URL=http://localhost:5000

   # Create .env file in server directory
   DB_HOST=database
   DB_USER=root
   DB_PASSWORD=your_password
   DB_NAME=womens_health_db
   ```

3. **Start the application**
   ```bash
   docker-compose up --build
   ```

4. **Access the application**
   - Frontend: http://localhost:3000
   - Backend API: http://localhost:5000

## Common Docker Commands

```bash
# Start containers in background
docker-compose up -d

# Stop containers
docker-compose down

# View logs
docker-compose logs -f

# Rebuild containers
docker-compose up --build

# Remove volumes (database data)
docker-compose down -v
```

## Troubleshooting

### 1. Port Conflicts
If you see "port is already in use" errors:
- Ensure no other services are using ports 3000, 5000, or 3306
- Or modify the port mappings in docker-compose.yml

### 2. Database Connection Issues
- Check if the database container is running: `docker-compose ps`
- Verify environment variables in the backend service
- Check logs: `docker-compose logs database`

### 3. Node Modules Issues
- Remove node_modules folders and rebuild:
  ```bash
  rm -rf client/node_modules server/node_modules
  docker-compose up --build
  ```

## Development Workflow

1. **Making Changes**
   - Edit files locally
   - Changes in React app refresh automatically
   - Backend changes require container restart

2. **Installing New Dependencies**
   - Add to package.json
   - Rebuild container: `docker-compose up --build`

3. **Database Changes**
   - Modify init.sql
   - Rebuild with fresh database:
     ```bash
     docker-compose down -v
     docker-compose up --build
     ```

This Docker setup provides a consistent and reliable way to run the application across different environments while simplifying the development process.