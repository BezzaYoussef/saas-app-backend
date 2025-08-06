Write-Host "Installing MongoDB..." -ForegroundColor Green

# Check if MongoDB is already installed
$mongodbInstalled = Get-Command mongod -ErrorAction SilentlyContinue

if ($mongodbInstalled) {
    Write-Host "MongoDB is already installed!" -ForegroundColor Green
    Write-Host "Starting MongoDB service..." -ForegroundColor Yellow
    
    # Try to start MongoDB service
    try {
        Start-Service -Name "MongoDB" -ErrorAction Stop
        Write-Host "MongoDB service started successfully!" -ForegroundColor Green
    }
    catch {
        Write-Host "MongoDB service not found. Trying to start mongod directly..." -ForegroundColor Yellow
        Start-Process mongod -ArgumentList "--dbpath", "C:\data\db" -WindowStyle Hidden
        Write-Host "MongoDB started in background!" -ForegroundColor Green
    }
}
else {
    Write-Host "MongoDB not found. Installing..." -ForegroundColor Yellow
    
    # Install MongoDB using winget
    try {
        winget install MongoDB.Server
        Write-Host "MongoDB installed successfully!" -ForegroundColor Green
        Write-Host "Please restart your computer and then run this script again to start MongoDB." -ForegroundColor Yellow
    }
    catch {
        Write-Host "Failed to install MongoDB via winget. Please install manually:" -ForegroundColor Red
        Write-Host "1. Go to: https://www.mongodb.com/try/download/community" -ForegroundColor Cyan
        Write-Host "2. Download and install MongoDB Community Server" -ForegroundColor Cyan
        Write-Host "3. Run this script again after installation" -ForegroundColor Cyan
    }
}

Write-Host "`nTesting MongoDB connection..." -ForegroundColor Yellow
Start-Sleep -Seconds 5

try {
    $connection = Test-NetConnection -ComputerName localhost -Port 27018 -InformationLevel Quiet
    if ($connection.TcpTestSucceeded) {
        Write-Host "MongoDB is running and accessible on port 27018!" -ForegroundColor Green
    }
    else {
        Write-Host "MongoDB is not accessible on port 27018" -ForegroundColor Red
    }
}
catch {
    Write-Host "Could not test MongoDB connection" -ForegroundColor Red
} 