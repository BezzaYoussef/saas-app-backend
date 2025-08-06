Write-Host "Starting MongoDB on port 27018..." -ForegroundColor Green

# Check if MongoDB is already installed
$mongodbInstalled = Get-Command mongod -ErrorAction SilentlyContinue

if ($mongodbInstalled) {
    Write-Host "MongoDB is installed. Starting on port 27018..." -ForegroundColor Yellow
    
    # Create data directory if it doesn't exist
    $dataPath = "C:\data\db"
    if (!(Test-Path $dataPath)) {
        New-Item -ItemType Directory -Path $dataPath -Force
        Write-Host "Created data directory: $dataPath" -ForegroundColor Yellow
    }
    
    # Start MongoDB on port 27018
    try {
        Start-Process mongod -ArgumentList "--port", "27018", "--dbpath", $dataPath -WindowStyle Hidden
        Write-Host "MongoDB started on port 27018!" -ForegroundColor Green
        
        # Wait a moment for MongoDB to start
        Start-Sleep -Seconds 5
        
        # Test connection
        $connection = Test-NetConnection -ComputerName localhost -Port 27018 -InformationLevel Quiet
        if ($connection.TcpTestSucceeded) {
            Write-Host "MongoDB is running and accessible on port 27018!" -ForegroundColor Green
            Write-Host "Your backend should now be able to connect." -ForegroundColor Cyan
        }
        else {
            Write-Host "MongoDB is not accessible on port 27018" -ForegroundColor Red
        }
    }
    catch {
        Write-Host "Failed to start MongoDB: $($_.Exception.Message)" -ForegroundColor Red
    }
}
else {
    Write-Host "MongoDB is not installed. Please install it first:" -ForegroundColor Red
    Write-Host "1. Go to: https://www.mongodb.com/try/download/community" -ForegroundColor Cyan
    Write-Host "2. Download and install MongoDB Community Server" -ForegroundColor Cyan
    Write-Host "3. Run this script again after installation" -ForegroundColor Cyan
} 