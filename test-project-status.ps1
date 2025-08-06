Write-Host "🔍 Testing Project Status" -ForegroundColor Green
Write-Host "=======================" -ForegroundColor Cyan

Write-Host "`nStep 1: Checking MongoDB..." -ForegroundColor Yellow
$mongoStatus = netstat -ano | findstr :27018
if ($mongoStatus) {
    Write-Host "✅ MongoDB is running on port 27018" -ForegroundColor Green
} else {
    Write-Host "❌ MongoDB is not running" -ForegroundColor Red
    Write-Host "Starting MongoDB..." -ForegroundColor Yellow
    
    # Create data directory if it doesn't exist
    if (!(Test-Path "C:\data\db")) {
        New-Item -ItemType Directory -Path "C:\data\db" -Force | Out-Null
    }
    
    # Start MongoDB
    Start-Process -FilePath "C:\Program Files\MongoDB\Server\8.0\bin\mongod.exe" -ArgumentList "--port", "27018", "--dbpath", "C:\data\db" -WindowStyle Hidden
    Start-Sleep -Seconds 10
    Write-Host "✅ MongoDB started" -ForegroundColor Green
}

Write-Host "`nStep 2: Checking Backend..." -ForegroundColor Yellow
$backendStatus = netstat -ano | findstr :3000
if ($backendStatus) {
    Write-Host "✅ Backend is running on port 3000" -ForegroundColor Green
} else {
    Write-Host "❌ Backend is not running" -ForegroundColor Red
    Write-Host "Starting Backend..." -ForegroundColor Yellow
    
    Set-Location "saas-app-backend"
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "npm start" -WindowStyle Normal
    Start-Sleep -Seconds 15
    Write-Host "✅ Backend started" -ForegroundColor Green
}

Write-Host "`nStep 3: Checking Frontend..." -ForegroundColor Yellow
$frontendStatus = netstat -ano | findstr :4200
if ($frontendStatus) {
    Write-Host "✅ Frontend is running on port 4200" -ForegroundColor Green
} else {
    Write-Host "❌ Frontend is not running" -ForegroundColor Red
    Write-Host "Starting Frontend..." -ForegroundColor Yellow
    
    Set-Location "saas-app-frontend"
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "npm start" -WindowStyle Normal
    Start-Sleep -Seconds 15
    Write-Host "✅ Frontend started" -ForegroundColor Green
}

Write-Host "`n🎯 FINAL STATUS:" -ForegroundColor Yellow
Write-Host "===============" -ForegroundColor Cyan

# Final check
$mongoFinal = netstat -ano | findstr :27018
$backendFinal = netstat -ano | findstr :3000
$frontendFinal = netstat -ano | findstr :4200

if ($mongoFinal -and $backendFinal -and $frontendFinal) {
    Write-Host "🎉 ALL SERVICES ARE RUNNING!" -ForegroundColor Green
    Write-Host "=============================" -ForegroundColor Cyan
    Write-Host "🌐 OPEN YOUR BROWSER AND GO TO:" -ForegroundColor Yellow
    Write-Host "   http://localhost:4200" -ForegroundColor White
    Write-Host "=============================" -ForegroundColor Cyan
    
    Write-Host "`n🎯 Test Instructions:" -ForegroundColor Yellow
    Write-Host "=====================" -ForegroundColor Cyan
    Write-Host "   1. Open http://localhost:4200" -ForegroundColor White
    Write-Host "   2. Click 'Launch Widget Builder'" -ForegroundColor White
    Write-Host "   3. Enter a widget name (e.g., 'Test Widget')" -ForegroundColor White
    Write-Host "   4. Add some content to the widget" -ForegroundColor White
    Write-Host "   5. Click 'Save Widget'" -ForegroundColor White
    Write-Host "   6. Check the 'Database' tab to see your saved widget" -ForegroundColor White
    
    Write-Host "`n🔧 If Save Fails:" -ForegroundColor Red
    Write-Host "=================" -ForegroundColor Cyan
    Write-Host "   1. Press F12 in browser to open console" -ForegroundColor White
    Write-Host "   2. Look for any error messages" -ForegroundColor White
    Write-Host "   3. Check if all services are running above" -ForegroundColor White
    Write-Host "   4. Try refreshing the page" -ForegroundColor White
} else {
    Write-Host "❌ Some services are not running" -ForegroundColor Red
    Write-Host "===============================" -ForegroundColor Cyan
    
    if (!$mongoFinal) {
        Write-Host "   ❌ MongoDB: Not running" -ForegroundColor Red
    }
    if (!$backendFinal) {
        Write-Host "   ❌ Backend: Not running" -ForegroundColor Red
    }
    if (!$frontendFinal) {
        Write-Host "   ❌ Frontend: Not running" -ForegroundColor Red
    }
    
    Write-Host "`n🔧 Manual Start Commands:" -ForegroundColor Yellow
    Write-Host "=========================" -ForegroundColor Cyan
    Write-Host "   MongoDB: mongod --port 27018 --dbpath C:\data\db" -ForegroundColor White
    Write-Host "   Backend: cd saas-app-backend && npm start" -ForegroundColor White
    Write-Host "   Frontend: cd saas-app-frontend && npm start" -ForegroundColor White
}

Write-Host "`nPress Enter to exit..." -ForegroundColor Yellow
Read-Host 