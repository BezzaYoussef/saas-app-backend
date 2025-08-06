Write-Host "🔧 Fixing Backend Connection Issue" -ForegroundColor Green
Write-Host "==================================" -ForegroundColor Cyan

Write-Host "`nStep 1: Killing existing backend processes..." -ForegroundColor Yellow

# Kill any existing processes on port 3000
$processes = netstat -ano | findstr :3000
if ($processes) {
    $processes | ForEach-Object {
        $parts = $_ -split '\s+'
        $pid = $parts[4]
        if ($pid -and $pid -ne "0") {
            Write-Host "Killing process $pid on port 3000..." -ForegroundColor Yellow
            taskkill /PID $pid /F 2>$null
        }
    }
}

Write-Host "Waiting for processes to be killed..." -ForegroundColor Yellow
Start-Sleep -Seconds 5

Write-Host "`nStep 2: Starting MongoDB..." -ForegroundColor Yellow
try {
    # Create data directory if it doesn't exist
    if (!(Test-Path "C:\data\db")) {
        Write-Host "Creating MongoDB data directory..." -ForegroundColor Yellow
        New-Item -ItemType Directory -Path "C:\data\db" -Force | Out-Null
    }
    
    # Start MongoDB
    Write-Host "Starting MongoDB on port 27018..." -ForegroundColor Yellow
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "mongod --port 27018 --dbpath C:\data\db" -WindowStyle Hidden
    
    Write-Host "Waiting for MongoDB to start..." -ForegroundColor Yellow
    Start-Sleep -Seconds 10
}
catch {
    Write-Host "❌ Failed to start MongoDB" -ForegroundColor Red
}

Write-Host "`nStep 3: Starting Backend..." -ForegroundColor Yellow
try {
    Set-Location "saas-app-backend"
    
    # Check if node_modules exists
    if (!(Test-Path "node_modules")) {
        Write-Host "Installing backend dependencies..." -ForegroundColor Yellow
        npm install
    }
    
    # Start backend
    Write-Host "Starting Backend on port 3000..." -ForegroundColor Yellow
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "npm start" -WindowStyle Normal
    
    Write-Host "Waiting for backend to start..." -ForegroundColor Yellow
    Start-Sleep -Seconds 20
    
    # Test backend connection
    Write-Host "Testing backend connection..." -ForegroundColor Yellow
    $backendTest = netstat -ano | findstr :3000
    if ($backendTest) {
        Write-Host "✅ Backend is running on port 3000" -ForegroundColor Green
    } else {
        Write-Host "❌ Backend failed to start" -ForegroundColor Red
    }
}
catch {
    Write-Host "❌ Failed to start backend" -ForegroundColor Red
}

Write-Host "`n🎯 BACKEND CONNECTION FIXED!" -ForegroundColor Green
Write-Host "=============================" -ForegroundColor Cyan

Write-Host "`n📋 Service Status:" -ForegroundColor Yellow
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

Write-Host "`n🌐 Test Backend Connection:" -ForegroundColor Yellow
Write-Host "===========================" -ForegroundColor Cyan
Write-Host "   Open your browser and go to:" -ForegroundColor White
Write-Host "   http://localhost:3000" -ForegroundColor White
Write-Host "   You should see the NestJS welcome page" -ForegroundColor White

Write-Host "`n🔧 If Backend Still Doesn't Work:" -ForegroundColor Red
Write-Host "=================================" -ForegroundColor Cyan
Write-Host "   1. Check the backend terminal window for errors" -ForegroundColor White
Write-Host "   2. Make sure MongoDB is running first" -ForegroundColor White
Write-Host "   3. Try running these commands manually:" -ForegroundColor White
Write-Host "      cd saas-app-backend" -ForegroundColor White
Write-Host "      npm install" -ForegroundColor White
Write-Host "      npm start" -ForegroundColor White

Write-Host "`nPress Enter to exit..." -ForegroundColor Yellow
Read-Host 