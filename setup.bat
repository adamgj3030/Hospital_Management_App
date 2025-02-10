@echo off
echo Setting up Women's Health Medical Database...

REM Copy environment files
echo Creating environment files...
copy client\.env.example client\.env
copy server\.env.example server\.env

REM Build and start Docker containers
echo Building and starting Docker containers...
docker-compose up --build -d

REM Wait for services to be ready
echo Waiting for services to start...
timeout /t 10 /nobreak

REM Show container status
echo Checking container status...
docker-compose ps

echo.
echo Setup complete! The application should now be running at:
echo - Frontend: http://localhost:3000
echo - Backend API: http://localhost:5000
echo - MySQL Database: localhost:3306
echo.
echo Use these commands to manage the application:
echo - View logs: docker-compose logs -f
echo - Stop application: docker-compose down
echo - Restart application: docker-compose restart
echo.
pause