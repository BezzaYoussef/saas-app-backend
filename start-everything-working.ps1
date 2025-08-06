Write-Host "🚀 Starting Everything - Working Version" -ForegroundColor Green
Write-Host "=======================================" -ForegroundColor Cyan

Write-Host "`nStep 1: Killing existing processes..." -ForegroundColor Yellow

# Kill any existing processes on ports 3000, 4200, and 27018
Write-Host "Killing processes on port 3000..." -ForegroundColor Yellow
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

Write-Host "Killing processes on port 4200..." -ForegroundColor Yellow
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

Write-Host "Killing MongoDB processes..." -ForegroundColor Yellow
$mongoProcesses = Get-Process -Name "mongod" -ErrorAction SilentlyContinue
if ($mongoProcesses) {
    Write-Host "Killing existing MongoDB processes..." -ForegroundColor Yellow
    Stop-Process -Name "mongod" -Force
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
    Start-Process -FilePath "C:\Program Files\MongoDB\Server\8.0\bin\mongod.exe" -ArgumentList "--port", "27018", "--dbpath", "C:\data\db" -WindowStyle Hidden
    
    Write-Host "Waiting for MongoDB to start..." -ForegroundColor Yellow
    Start-Sleep -Seconds 15
    
    # Test MongoDB connection
    Write-Host "Testing MongoDB connection..." -ForegroundColor Yellow
    $mongoTest = netstat -ano | findstr :27018
    if ($mongoTest) {
        Write-Host "✅ MongoDB is running on port 27018" -ForegroundColor Green
    } else {
        Write-Host "❌ MongoDB failed to start" -ForegroundColor Red
    }
}
catch {
    Write-Host "❌ Failed to start MongoDB" -ForegroundColor Red
}

Write-Host "`nStep 3: Starting Backend..." -ForegroundColor Yellow
try {
    # We're already in the backend directory, so no need to change location
    
    # Check if node_modules exists
    if (!(Test-Path "node_modules")) {
        Write-Host "Installing backend dependencies..." -ForegroundColor Yellow
        npm install
    }
    
    # Start backend
    Write-Host "Starting Backend on port 3000..." -ForegroundColor Yellow
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "npm start" -WindowStyle Normal
    
    Write-Host "Waiting for backend to start..." -ForegroundColor Yellow
    Start-Sleep -Seconds 30
    
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

Write-Host "`nStep 4: Starting Frontend..." -ForegroundColor Yellow
try {
    Set-Location "../saas-app-frontend"
    
    # Check if node_modules exists
    if (!(Test-Path "node_modules")) {
        Write-Host "Installing frontend dependencies..." -ForegroundColor Yellow
        npm install
    }
    
    # Start frontend
    Write-Host "Starting Frontend on port 4200..." -ForegroundColor Yellow
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "npm start" -WindowStyle Normal
    
    Write-Host "Waiting for frontend to start..." -ForegroundColor Yellow
    Start-Sleep -Seconds 30
    
    # Test frontend connection
    Write-Host "Testing frontend connection..." -ForegroundColor Yellow
    $frontendTest = netstat -ano | findstr :4200
    if ($frontendTest) {
        Write-Host "✅ Frontend is running on port 4200" -ForegroundColor Green
    } else {
        Write-Host "❌ Frontend failed to start" -ForegroundColor Red
    }
}
catch {
    Write-Host "❌ Failed to start frontend" -ForegroundColor Red
}

Write-Host "`n🎯 EVERYTHING STARTED!" -ForegroundColor Green
Write-Host "=====================" -ForegroundColor Cyan
Write-Host "🌐 OPEN YOUR BROWSER AND GO TO:" -ForegroundColor Yellow
Write-Host "   http://localhost:4200" -ForegroundColor White
Write-Host "=====================" -ForegroundColor Cyan

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

# Check Frontend
$frontendStatus = netstat -ano | findstr :4200
if ($frontendStatus) {
    Write-Host "   ✅ Frontend: Running on port 4200" -ForegroundColor Green
} else {
    Write-Host "   ❌ Frontend: Not running" -ForegroundColor Red
}

Write-Host "`n🎯 Test the Application:" -ForegroundColor Yellow
Write-Host "=======================" -ForegroundColor Cyan
Write-Host "   1. Open http://localhost:4200" -ForegroundColor White
Write-Host "   2. Click 'Launch Widget Builder'" -ForegroundColor White
Write-Host "   3. Create a test widget with name and content" -ForegroundColor White
Write-Host "   4. Click 'Save Widget'" -ForegroundColor White
Write-Host "   5. Check if it appears in Database tab" -ForegroundColor White

Write-Host "`n🔧 If Save Still Fails:" -ForegroundColor Red
Write-Host "=======================" -ForegroundColor Cyan
Write-Host "   1. Check browser console (F12) for errors" -ForegroundColor White
Write-Host "   2. Verify all services are running above" -ForegroundColor White
Write-Host "   3. Try refreshing the page" -ForegroundColor White
Write-Host "   4. Check backend terminal for MongoDB connection errors" -ForegroundColor White

Write-Host "`nPress Enter to exit..." -ForegroundColor Yellow
Read-Host 