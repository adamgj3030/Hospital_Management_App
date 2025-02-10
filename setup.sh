#!/bin/bash

echo "Setting up Women's Health Medical Database..."

# Copy environment files
echo "Creating environment files..."
cp client/.env.example client/.env
cp server/.env.example server/.env

# Build and start Docker containers
echo "Building and starting Docker containers..."
docker-compose up --build -d

# Wait for services to be ready
echo "Waiting for services to start..."
sleep 10

# Show container status
echo "Checking container status..."
docker-compose ps

echo "
Setup complete! The application should now be running at:
- Frontend: http://localhost:3000
- Backend API: http://localhost:5000
- MySQL Database: localhost:3306

Use these commands to manage the application:
- View logs: docker-compose logs -f
- Stop application: docker-compose down
- Restart application: docker-compose restart
"