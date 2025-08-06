@echo off
echo Starting VvvebJs SaaS Widget Builder Project...
echo.

echo Step 1: Starting MongoDB on port 27018...
powershell -ExecutionPolicy Bypass -File start-mongodb-simple.ps1
if %errorlevel% neq 0 (
    echo Failed to start MongoDB
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
echo Step 3: Installing Backend Dependencies...
cd ..\saas-app-backend
call npm install --ignore-scripts
if %errorlevel% neq 0 (
    echo Failed to install backend dependencies
    pause
    exit /b 1
)

echo.
echo Step 4: Starting Backend Server...
start "Backend Server" cmd /k "npm run start:dev"

echo.
echo Step 5: Starting Frontend Server...
cd ..\saas-app-frontend
start "Frontend Server" cmd /k "npm start"

echo.
echo Waiting for servers to start...
timeout /t 15 /nobreak > nul

echo.
echo ========================================
echo VvvebJs SaaS Widget Builder is running!
echo ========================================
echo.
echo Access URLs:
echo   Backend API: http://localhost:3000
echo   Frontend App: http://localhost:4200
echo   MongoDB: localhost:27018
echo.
echo To access the Widget Builder:
echo   1. Open your browser
echo   2. Go to: http://localhost:4200
echo   3. Navigate to the Widget Builder section
echo.
echo Press any key to exit...
pause > nul 