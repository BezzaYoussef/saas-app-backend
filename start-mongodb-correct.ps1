Write-Host "🔧 Starting MongoDB Correctly" -ForegroundColor Green
Write-Host "============================" -ForegroundColor Cyan

Write-Host "`nStep 1: Killing existing MongoDB processes..." -ForegroundColor Yellow

# Kill any existing MongoDB processes
$mongoProcesses = Get-Process -Name "mongod" -ErrorAction SilentlyContinue
if ($mongoProcesses) {
    Write-Host "Killing existing MongoDB processes..." -ForegroundColor Yellow
    Stop-Process -Name "mongod" -Force
    Start-Sleep -Seconds 3
}

Write-Host "`nStep 2: Creating data directory..." -ForegroundColor Yellow
# Create data directory if it doesn't exist
if (!(Test-Path "C:\data\db")) {
    Write-Host "Creating MongoDB data directory..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path "C:\data\db" -Force | Out-Null
    Write-Host "✅ Data directory created" -ForegroundColor Green
} else {
    Write-Host "✅ Data directory already exists" -ForegroundColor Green
}

Write-Host "`nStep 3: Starting MongoDB..." -ForegroundColor Yellow
try {
    # Start MongoDB on port 27018
    Write-Host "Starting MongoDB on port 27018..." -ForegroundColor Yellow
    Start-Process -FilePath "C:\Program Files\MongoDB\Server\8.0\bin\mongod.exe" -ArgumentList "--port", "27018", "--dbpath", "C:\data\db" -WindowStyle Hidden
    
    Write-Host "Waiting for MongoDB to start..." -ForegroundColor Yellow
    Start-Sleep -Seconds 10
    
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
    Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "`nStep 4: Testing MongoDB connection..." -ForegroundColor Yellow
try {
    # Test if MongoDB is accessible
    $testConnection = Test-NetConnection -ComputerName localhost -Port 27018 -InformationLevel Quiet
    if ($testConnection) {
        Write-Host "✅ MongoDB connection test successful" -ForegroundColor Green
    } else {
        Write-Host "❌ MongoDB connection test failed" -ForegroundColor Red
    }
}
catch {
    Write-Host "❌ MongoDB connection test failed" -ForegroundColor Red
}

Write-Host "`n🎯 MONGODB STATUS:" -ForegroundColor Yellow
Write-Host "=================" -ForegroundColor Cyan

# Check MongoDB status
$mongoStatus = netstat -ano | findstr :27018
if ($mongoStatus) {
    Write-Host "   ✅ MongoDB: Running on port 27018" -ForegroundColor Green
    Write-Host "   📍 Connection: mongodb://localhost:27018/saas_db" -ForegroundColor White
} else {
    Write-Host "   ❌ MongoDB: Not running" -ForegroundColor Red
}

Write-Host "`n🔧 If MongoDB is not running:" -ForegroundColor Red
Write-Host "=============================" -ForegroundColor Cyan
Write-Host "   1. Check if MongoDB is installed" -ForegroundColor White
Write-Host "   2. Try running manually:" -ForegroundColor White
Write-Host "      mongod --port 27018 --dbpath C:\data\db" -ForegroundColor White
Write-Host "   3. Check Windows Event Viewer for errors" -ForegroundColor White

Write-Host "`n🎯 Next Steps:" -ForegroundColor Yellow
Write-Host "==============" -ForegroundColor Cyan
Write-Host "   1. If MongoDB is running, start the backend" -ForegroundColor White
Write-Host "   2. Run: cd saas-app-backend && npm start" -ForegroundColor White
Write-Host "   3. Test backend connection: http://localhost:3000" -ForegroundColor White

Write-Host "`nPress Enter to exit..." -ForegroundColor Yellow
Read-Host 