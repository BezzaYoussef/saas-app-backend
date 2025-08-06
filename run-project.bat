@echo off
echo Starting SaaS Application Setup...

echo.
echo Step 1: Installing Backend Dependencies...
cd saas-app-backend
call npm install --ignore-scripts
if %errorlevel% neq 0 (
    echo Failed to install backend dependencies
    pause
    exit /b 1
)

echo.
echo Step 2: Installing Frontend Dependencies...
cd ..\saas-app-frontend
call npm install --ignore-scripts
if %errorlevel% neq 0 (
    echo Failed to install frontend dependencies
    pause
    exit /b 1
)

echo.
echo Step 3: Starting MongoDB (if available)...
echo Note: Make sure MongoDB is installed and running on port 27017
echo You can download MongoDB from: https://www.mongodb.com/try/download/community

echo.
echo Step 4: Starting Backend Server...
cd ..\saas-app-backend
start "Backend Server" cmd /k "npm run start:dev"

echo.
echo Step 5: Starting Frontend Server...
cd ..\saas-app-frontend
start "Frontend Server" cmd /k "npm start"

echo.
echo Project is starting up!
echo Backend will be available at: http://localhost:3000
echo Frontend will be available at: http://localhost:4200
echo.
echo Press any key to exit this setup script...
pause > nul 