Write-Host "Starting MongoDB using Docker..." -ForegroundColor Green

# Check if Docker is running
try {
    docker version | Out-Null
    Write-Host "Docker is available!" -ForegroundColor Green
}
catch {
    Write-Host "Docker is not running. Please start Docker Desktop first." -ForegroundColor Red
    Write-Host "Download Docker Desktop from: https://www.docker.com/products/docker-desktop/" -ForegroundColor Cyan
    exit 1
}

# Check if MongoDB container already exists
$containerExists = docker ps -a --filter "name=mongodb" --format "{{.Names}}" | Select-String "mongodb"

if ($containerExists) {
    Write-Host "MongoDB container already exists. Starting it..." -ForegroundColor Yellow
    docker start mongodb
}
else {
    Write-Host "Creating new MongoDB container..." -ForegroundColor Yellow
    docker run -d --name mongodb -p 27018:27017 mongo:latest
}

Write-Host "Waiting for MongoDB to start..." -ForegroundColor Yellow
Start-Sleep -Seconds 10

# Test connection
try {
    $connection = Test-NetConnection -ComputerName localhost -Port 27018 -InformationLevel Quiet
    if ($connection.TcpTestSucceeded) {
        Write-Host "MongoDB is running and accessible on port 27018!" -ForegroundColor Green
        Write-Host "You can now start your backend application." -ForegroundColor Cyan
    }
    else {
        Write-Host "MongoDB is not accessible on port 27018" -ForegroundColor Red
    }
}
catch {
    Write-Host "Could not test MongoDB connection" -ForegroundColor Red
} 