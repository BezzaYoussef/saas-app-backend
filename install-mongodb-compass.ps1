Write-Host "Installing MongoDB Compass..." -ForegroundColor Green

# Install MongoDB Compass using winget
try {
    winget install MongoDB.Compass
    Write-Host "MongoDB Compass installed successfully!" -ForegroundColor Green
}
catch {
    Write-Host "Failed to install via winget. Installing manually..." -ForegroundColor Yellow
    Write-Host "Please download MongoDB Compass from: https://www.mongodb.com/try/download/compass" -ForegroundColor Cyan
}

Write-Host "`nSetting up MongoDB database..." -ForegroundColor Yellow

# Create data directory
$dataPath = "C:\data\db"
if (!(Test-Path $dataPath)) {
    New-Item -ItemType Directory -Path $dataPath -Force
    Write-Host "Created data directory: $dataPath" -ForegroundColor Green
}

# Try to find MongoDB installation
$possiblePaths = @(
    "C:\Program Files\MongoDB\Server\*\bin\mongod.exe",
    "C:\Program Files\MongoDB\Server\bin\mongod.exe",
    "${env:ProgramFiles}\MongoDB\Server\*\bin\mongod.exe"
)

$mongodPath = $null
foreach ($path in $possiblePaths) {
    $found = Get-ChildItem -Path $path -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($found) {
        $mongodPath = $found.FullName
        break
    }
}

if ($mongodPath) {
    Write-Host "Found MongoDB at: $mongodPath" -ForegroundColor Green
    Write-Host "Starting MongoDB on port 27018..." -ForegroundColor Yellow
    
    # Start MongoDB on port 27018
    Start-Process -FilePath $mongodPath -ArgumentList "--port", "27018", "--dbpath", $dataPath -WindowStyle Hidden
    
    Write-Host "MongoDB started! Waiting for it to be ready..." -ForegroundColor Green
    Start-Sleep -Seconds 10
    
    # Test connection
    $connection = Test-NetConnection -ComputerName localhost -Port 27018 -InformationLevel Quiet
    if ($connection.TcpTestSucceeded) {
        Write-Host "✅ MongoDB is running on port 27018!" -ForegroundColor Green
        Write-Host "`nMongoDB Compass Connection Details:" -ForegroundColor Cyan
        Write-Host "Connection String: mongodb://localhost:27018" -ForegroundColor White
        Write-Host "Database Name: saas_db" -ForegroundColor White
        Write-Host "`nSteps to connect with Compass:" -ForegroundColor Yellow
        Write-Host "1. Open MongoDB Compass" -ForegroundColor White
        Write-Host "2. Click 'New Connection'" -ForegroundColor White
        Write-Host "3. Enter: mongodb://localhost:27018" -ForegroundColor White
        Write-Host "4. Click 'Connect'" -ForegroundColor White
        Write-Host "5. Create database 'saas_db' if it doesn't exist" -ForegroundColor White
    }
    else {
        Write-Host "❌ MongoDB is not accessible on port 27018" -ForegroundColor Red
    }
}
else {
    Write-Host "❌ MongoDB not found. Please install MongoDB first:" -ForegroundColor Red
    Write-Host "1. Go to: https://www.mongodb.com/try/download/community" -ForegroundColor Cyan
    Write-Host "2. Download and install MongoDB Community Server" -ForegroundColor Cyan
    Write-Host "3. Run this script again" -ForegroundColor Cyan
} 