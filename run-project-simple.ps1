Write-Host "🚀 Running Project - Simple Version" -ForegroundColor Green
Write-Host "===================================" -ForegroundColor Cyan

Write-Host "`nStep 1: Starting MongoDB..." -ForegroundColor Yellow

# Kill any existing MongoDB processes
$mongoProcesses = Get-Process -Name "mongod" -ErrorAction SilentlyContinue
if ($mongoProcesses) {
    Write-Host "Killing existing MongoDB processes..." -ForegroundColor Yellow
    Stop-Process -Name "mongod" -Force
    Start-Sleep -Seconds 3
}

# Create data directory if it doesn't exist
if (!(Test-Path "C:\data\db")) {
    Write-Host "Creating MongoDB data directory..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path "C:\data\db" -Force | Out-Null
}

# Start MongoDB
Write-Host "Starting MongoDB on port 27018..." -ForegroundColor Yellow
Start-Process -FilePath "C:\Program Files\MongoDB\Server\8.0\bin\mongod.exe" -ArgumentList "--port", "27018", "--dbpath", "C:\data\db" -WindowStyle Hidden

Write-Host "Waiting for MongoDB to start..." -ForegroundColor Yellow
Start-Sleep -Seconds 10

# Test MongoDB connection
$mongoTest = netstat -ano | findstr :27018
if ($mongoTest) {
    Write-Host "✅ MongoDB is running on port 27018" -ForegroundColor Green
} else {
    Write-Host "❌ MongoDB failed to start" -ForegroundColor Red
}

Write-Host "`nStep 2: Starting Backend..." -ForegroundColor Yellow

# Kill any existing processes on port 3000
$processes3000 = netstat -ano | findstr :3000
if ($processes3000) {
    $processes3000 | ForEach-Object {
        $parts = $_ -split '\s+'
        $pid = $parts[4]
        if ($pid -and $pid -ne "0") {
            Write-Host "Killing process $pid on port 3000..." -ForegroundColor Yellow
            taskkill /PID $pid /F 2>$null
        }
    }
}

# Start backend
Write-Host "Starting Backend on port 3000..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "npm start" -WindowStyle Normal

Write-Host "Waiting for backend to start..." -ForegroundColor Yellow
Start-Sleep -Seconds 15

# Test backend connection
$backendTest = netstat -ano | findstr :3000
if ($backendTest) {
    Write-Host "✅ Backend is running on port 3000" -ForegroundColor Green
} else {
    Write-Host "❌ Backend failed to start" -ForegroundColor Red
}

Write-Host "`nStep 3: Starting Frontend..." -ForegroundColor Yellow

# Kill any existing processes on port 4200
$processes4200 = netstat -ano | findstr :4200
if ($processes4200) {
    $processes4200 | ForEach-Object {
        $parts = $_ -split '\s+'
        $pid = $parts[4]
        if ($pid -and $pid -ne "0") {
            Write-Host "Killing process $pid on port 4200..." -ForegroundColor Yellow
            taskkill /PID $pid /F 2>$null
        }
    }
}

# Navigate to frontend directory
$frontendPath = "..\saas-app-frontend"
if (Test-Path $frontendPath) {
    Write-Host "Found frontend at: $frontendPath" -ForegroundColor Green
    Set-Location $frontendPath
    
    # Start frontend
    Write-Host "Starting Frontend on port 4200..." -ForegroundColor Yellow
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "npm start" -WindowStyle Normal
    
    Write-Host "Waiting for frontend to start..." -ForegroundColor Yellow
    Start-Sleep -Seconds 15
    
    # Test frontend connection
    $frontendTest = netstat -ano | findstr :4200
    if ($frontendTest) {
        Write-Host "✅ Frontend is running on port 4200" -ForegroundColor Green
    } else {
        Write-Host "❌ Frontend failed to start" -ForegroundColor Red
    }
} else {
    Write-Host "❌ Frontend directory not found at: $frontendPath" -ForegroundColor Red
    Write-Host "Please check if the frontend is in the correct location" -ForegroundColor Yellow
}

Write-Host "`n🎯 PROJECT STATUS:" -ForegroundColor Yellow
Write-Host "=================" -ForegroundColor Cyan

# Check MongoDB
$mongoStatus = netstat -ano | findstr :27018
if ($mongoStatus) {
    Write-Host "   ✅ MongoDB: Running on port 27018" -ForegroundColor Green
} else {
    Write-Host "   ❌ MongoDB: Not running" -ForegroundColor Red
}

# Check Backend
$backendStatus = netstat -ano | findstr :3000
if ($backendStatus) {
    Write-Host "   ✅ Backend: Running on port 3000" -ForegroundColor Green
} else {
    Write-Host "   ❌ Backend: Not running" -ForegroundColor Red
}

# Check Frontend
$frontendStatus = netstat -ano | findstr :4200
if ($frontendStatus) {
    Write-Host "   ✅ Frontend: Running on port 4200" -ForegroundColor Green
} else {
    Write-Host "   ❌ Frontend: Not running" -ForegroundColor Red
}

Write-Host "`n🌐 OPEN YOUR BROWSER AND GO TO:" -ForegroundColor Yellow
Write-Host "   http://localhost:4200" -ForegroundColor White

Write-Host "`n🎯 Test the Widget Builder:" -ForegroundColor Yellow
Write-Host "===========================" -ForegroundColor Cyan
Write-Host "   1. Open http://localhost:4200" -ForegroundColor White
Write-Host "   2. Click 'Launch Widget Builder'" -ForegroundColor White
Write-Host "   3. Create a test widget" -ForegroundColor White
Write-Host "   4. Click 'Save Widget'" -ForegroundColor White

Write-Host "`nPress Enter to exit..." -ForegroundColor Yellow
Read-Host 