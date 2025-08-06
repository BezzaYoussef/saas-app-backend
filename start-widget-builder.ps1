Write-Host "Starting Widget Builder..." -ForegroundColor Green

# Step 1: Start MongoDB
Write-Host "`nStep 1: Starting MongoDB..." -ForegroundColor Yellow
try {
    $dataPath = "C:\data\db"
    if (!(Test-Path $dataPath)) {
        New-Item -ItemType Directory -Path $dataPath -Force
    }
    
    $mongodPath = Get-ChildItem -Path "C:\Program Files\MongoDB\Server\*\bin\mongod.exe" -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($mongodPath) {
        Start-Process -FilePath $mongodPath.FullName -ArgumentList "--port", "27018", "--dbpath", $dataPath -WindowStyle Hidden
        Start-Sleep -Seconds 5
        Write-Host "✅ MongoDB started on port 27018" -ForegroundColor Green
    }
    else {
        Write-Host "❌ MongoDB not found. Please install it first." -ForegroundColor Red
        exit 1
    }
}
catch {
    Write-Host "Error starting MongoDB: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

# Step 2: Start Backend
Write-Host "`nStep 2: Starting Backend Server..." -ForegroundColor Yellow
try {
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "npm run start:dev" -WindowStyle Normal
    Write-Host "✅ Backend server starting..." -ForegroundColor Green
}
catch {
    Write-Host "❌ Failed to start backend server" -ForegroundColor Red
    exit 1
}

# Step 3: Start Frontend
Write-Host "`nStep 3: Starting Frontend Server..." -ForegroundColor Yellow
try {
    Set-Location "..\saas-app-frontend"
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "npm start" -WindowStyle Normal
    Write-Host "✅ Frontend server starting..." -ForegroundColor Green
}
catch {
    Write-Host "❌ Failed to start frontend server" -ForegroundColor Red
    exit 1
}

# Step 4: Wait and show URL
Write-Host "`nStep 4: Waiting for servers to start..." -ForegroundColor Yellow
Start-Sleep -Seconds 20

Write-Host "`n🎉 WIDGET BUILDER IS READY!" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "🌐 OPEN YOUR BROWSER AND GO TO:" -ForegroundColor Yellow
Write-Host "   http://localhost:4200" -ForegroundColor White
Write-Host "=========================================" -ForegroundColor Cyan

Write-Host "`n📋 Server URLs:" -ForegroundColor Yellow
Write-Host "   Frontend: http://localhost:4200" -ForegroundColor White
Write-Host "   Backend:  http://localhost:3000" -ForegroundColor White
Write-Host "   MongoDB:  localhost:27018" -ForegroundColor White

Write-Host "`n🚀 Widget Builder Features:" -ForegroundColor Yellow
Write-Host "   ✅ Drag & Drop Editor" -ForegroundColor White
Write-Host "   ✅ Real-time Preview" -ForegroundColor White
Write-Host "   ✅ Code View (HTML/CSS/JS)" -ForegroundColor White
Write-Host "   ✅ Component Library" -ForegroundColor White
Write-Host "   ✅ Save to Database" -ForegroundColor White
Write-Host "   ✅ Export Widget Code" -ForegroundColor White

Write-Host "`n⚠️  If the page doesn't load:" -ForegroundColor Yellow
Write-Host "   1. Wait a few more seconds for servers to start" -ForegroundColor White
Write-Host "   2. Check the terminal windows for any errors" -ForegroundColor White
Write-Host "   3. Make sure ports 3000 and 4200 are not in use" -ForegroundColor White

Write-Host "`nPress Enter to exit..." -ForegroundColor Yellow
Read-Host 