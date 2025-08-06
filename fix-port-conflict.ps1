Write-Host "🔧 Fixing Port Conflict" -ForegroundColor Green
Write-Host "=====================" -ForegroundColor Cyan

Write-Host "`nStep 1: Killing processes on port 3000..." -ForegroundColor Yellow

# Find and kill processes on port 3000
$processes3000 = netstat -ano | findstr :3000
if ($processes3000) {
    Write-Host "Found processes on port 3000:" -ForegroundColor Yellow
    $processes3000 | ForEach-Object {
        $parts = $_ -split '\s+'
        $pid = $parts[4]
        if ($pid -and $pid -ne "0") {
            Write-Host "Killing process $pid on port 3000..." -ForegroundColor Yellow
            taskkill /PID $pid /F 2>$null
        }
    }
} else {
    Write-Host "No processes found on port 3000" -ForegroundColor Green
}

Write-Host "`nStep 2: Killing processes on port 4200..." -ForegroundColor Yellow

# Find and kill processes on port 4200
$processes4200 = netstat -ano | findstr :4200
if ($processes4200) {
    Write-Host "Found processes on port 4200:" -ForegroundColor Yellow
    $processes4200 | ForEach-Object {
        $parts = $_ -split '\s+'
        $pid = $parts[4]
        if ($pid -and $pid -ne "0") {
            Write-Host "Killing process $pid on port 4200..." -ForegroundColor Yellow
            taskkill /PID $pid /F 2>$null
        }
    }
} else {
    Write-Host "No processes found on port 4200" -ForegroundColor Green
}

Write-Host "`nStep 3: Starting MongoDB..." -ForegroundColor Yellow

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

Write-Host "`nStep 4: Starting Backend..." -ForegroundColor Yellow

# Start backend
Write-Host "Starting Backend on port 3000..." -ForegroundColor Yellow
Set-Location "saas-app-backend"
Start-Process powershell -ArgumentList "-NoExit", "-Command", "npm start" -WindowStyle Normal

Write-Host "Waiting for backend to start..." -ForegroundColor Yellow
Start-Sleep -Seconds 15

Write-Host "`nStep 5: Starting Frontend..." -ForegroundColor Yellow

# Start frontend
Write-Host "Starting Frontend on port 4200..." -ForegroundColor Yellow
Set-Location "saas-app-frontend"
Start-Process powershell -ArgumentList "-NoExit", "-Command", "npm start" -WindowStyle Normal

Write-Host "Waiting for frontend to start..." -ForegroundColor Yellow
Start-Sleep -Seconds 15

Write-Host "`n🎯 STATUS CHECK:" -ForegroundColor Yellow
Write-Host "===============" -ForegroundColor Cyan

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

Write-Host "`nPress Enter to exit..." -ForegroundColor Yellow
Read-Host 