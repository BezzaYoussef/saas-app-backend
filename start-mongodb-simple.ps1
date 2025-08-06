Write-Host "Starting MongoDB on port 27018..." -ForegroundColor Green

# Create data directory
$dataPath = "C:\data\db"
if (!(Test-Path $dataPath)) {
    New-Item -ItemType Directory -Path $dataPath -Force
    Write-Host "Created data directory: $dataPath" -ForegroundColor Yellow
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
        Write-Host "✅ MongoDB is running and accessible on port 27018!" -ForegroundColor Green
        Write-Host "Your backend should now be able to connect." -ForegroundColor Cyan
    }
    else {
        Write-Host "❌ MongoDB is not accessible on port 27018" -ForegroundColor Red
    }
}
else {
    Write-Host "❌ MongoDB not found. Please install it first:" -ForegroundColor Red
    Write-Host "1. Go to: https://www.mongodb.com/try/download/community" -ForegroundColor Cyan
    Write-Host "2. Download and install MongoDB Community Server" -ForegroundColor Cyan
    Write-Host "3. Run this script again after installation" -ForegroundColor Cyan
} 