Write-Host "Starting VvvebJs SaaS Widget Builder Project..." -ForegroundColor Green

# Step 1: Start MongoDB
Write-Host "`nStep 1: Starting MongoDB on port 27018..." -ForegroundColor Yellow
try {
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
        }
        else {
            Write-Host "❌ MongoDB is not accessible on port 27018" -ForegroundColor Red
        }
    }
    else {
        Write-Host "❌ MongoDB not found. Please install it first:" -ForegroundColor Red
        Write-Host "1. Go to: https://www.mongodb.com/try/download/community" -ForegroundColor Cyan
        Write-Host "2. Download and install MongoDB Community Server" -ForegroundColor Cyan
        Write-Host "3. Run this script again" -ForegroundColor Cyan
        exit 1
    }
}
catch {
    Write-Host "Error starting MongoDB: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

# Step 2: Install Frontend Dependencies
Write-Host "`nStep 2: Installing Frontend Dependencies..." -ForegroundColor Yellow
try {
    Set-Location "..\saas-app-frontend"
    npm install --ignore-scripts
    Write-Host "✅ Frontend dependencies installed!" -ForegroundColor Green
}
catch {
    Write-Host "❌ Failed to install frontend dependencies: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

# Step 3: Install Backend Dependencies
Write-Host "`nStep 3: Installing Backend Dependencies..." -ForegroundColor Yellow
try {
    Set-Location "..\saas-app-backend"
    npm install --ignore-scripts
    Write-Host "✅ Backend dependencies installed!" -ForegroundColor Green
}
catch {
    Write-Host "❌ Failed to install backend dependencies: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

# Step 4: Start Backend Server
Write-Host "`nStep 4: Starting Backend Server..." -ForegroundColor Yellow
try {
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "npm run start:dev" -WindowStyle Normal
    Write-Host "✅ Backend server started!" -ForegroundColor Green
    Write-Host "Backend will be available at: http://localhost:3000" -ForegroundColor Cyan
}
catch {
    Write-Host "❌ Failed to start backend server: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

# Step 5: Start Frontend Server
Write-Host "`nStep 5: Starting Frontend Server..." -ForegroundColor Yellow
try {
    Set-Location "..\saas-app-frontend"
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "npm start" -WindowStyle Normal
    Write-Host "✅ Frontend server started!" -ForegroundColor Green
    Write-Host "Frontend will be available at: http://localhost:4200" -ForegroundColor Cyan
}
catch {
    Write-Host "❌ Failed to start frontend server: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

# Step 6: Wait and provide instructions
Write-Host "`nStep 6: Waiting for servers to start..." -ForegroundColor Yellow
Start-Sleep -Seconds 15

Write-Host "`n🎉 VvvebJs SaaS Widget Builder is starting up!" -ForegroundColor Green
Write-Host "`n📋 Access URLs:" -ForegroundColor Cyan
Write-Host "   Backend API: http://localhost:3000" -ForegroundColor White
Write-Host "   Frontend App: http://localhost:4200" -ForegroundColor White
Write-Host "   MongoDB: localhost:27018" -ForegroundColor White

Write-Host "`n🚀 To access the Widget Builder:" -ForegroundColor Yellow
Write-Host "   1. Open your browser" -ForegroundColor White
Write-Host "   2. Go to: http://localhost:4200" -ForegroundColor White
Write-Host "   3. Navigate to the Widget Builder section" -ForegroundColor White

Write-Host "`n📚 API Endpoints:" -ForegroundColor Yellow
Write-Host "   GET    /api/widgets          - Get all widgets" -ForegroundColor White
Write-Host "   POST   /api/widgets          - Create new widget" -ForegroundColor White
Write-Host "   GET    /api/widgets/:id      - Get widget by ID" -ForegroundColor White
Write-Host "   PUT    /api/widgets/:id      - Update widget" -ForegroundColor White
Write-Host "   DELETE /api/widgets/:id      - Delete widget" -ForegroundColor White

Write-Host "`n⚠️  Troubleshooting:" -ForegroundColor Yellow
Write-Host "   - If MongoDB fails, install it from: https://www.mongodb.com/try/download/community" -ForegroundColor White
Write-Host "   - If ports are in use, check if other services are running" -ForegroundColor White
Write-Host "   - Check the terminal windows for any error messages" -ForegroundColor White

Write-Host "`nPress Enter to exit this setup script..." -ForegroundColor Yellow
Read-Host 