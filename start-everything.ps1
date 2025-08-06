Write-Host "🚀 Starting Everything - Widget Builder Project" -ForegroundColor Green
Write-Host "================================================" -ForegroundColor Cyan

# Step 1: Start MongoDB
Write-Host "`nStep 1: Starting MongoDB..." -ForegroundColor Yellow
try {
    $dataPath = "C:\data\db"
    if (!(Test-Path $dataPath)) {
        New-Item -ItemType Directory -Path $dataPath -Force
        Write-Host "✅ Created MongoDB data directory" -ForegroundColor Green
    }
    
    $mongodPath = Get-ChildItem -Path "C:\Program Files\MongoDB\Server\*\bin\mongod.exe" -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($mongodPath) {
        Start-Process -FilePath $mongodPath.FullName -ArgumentList "--port", "27018", "--dbpath", $dataPath -WindowStyle Hidden
        Start-Sleep -Seconds 5
        Write-Host "✅ MongoDB started on port 27018" -ForegroundColor Green
    }
    else {
        Write-Host "❌ MongoDB not found. Please install it first." -ForegroundColor Red
        Write-Host "   Download from: https://www.mongodb.com/try/download/community" -ForegroundColor Yellow
    }
}
catch {
    Write-Host "Error starting MongoDB: $($_.Exception.Message)" -ForegroundColor Red
}

# Step 2: Start Backend
Write-Host "`nStep 2: Starting Backend Server..." -ForegroundColor Yellow
try {
    Set-Location "saas-app-backend"
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "npm run start:dev" -WindowStyle Normal
    Write-Host "✅ Backend server starting on http://localhost:3000" -ForegroundColor Green
}
catch {
    Write-Host "❌ Failed to start backend server" -ForegroundColor Red
}

# Step 3: Start Frontend
Write-Host "`nStep 3: Starting Frontend Server..." -ForegroundColor Yellow
try {
    Set-Location "saas-app-frontend"
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "npm start" -WindowStyle Normal
    Write-Host "✅ Frontend server starting on http://localhost:4200" -ForegroundColor Green
}
catch {
    Write-Host "❌ Failed to start frontend server" -ForegroundColor Red
}

# Step 4: Wait and show URLs
Write-Host "`nStep 4: Waiting for servers to start..." -ForegroundColor Yellow
Start-Sleep -Seconds 30

Write-Host "`n🎉 EVERYTHING IS STARTING!" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "🌐 OPEN YOUR BROWSER AND GO TO:" -ForegroundColor Yellow
Write-Host "   http://localhost:4200" -ForegroundColor White
Write-Host "=========================================" -ForegroundColor Cyan

Write-Host "`n📋 Server URLs:" -ForegroundColor Yellow
Write-Host "   Widget Builder: http://localhost:4200" -ForegroundColor White
Write-Host "   Backend API:   http://localhost:3000" -ForegroundColor White
Write-Host "   MongoDB:       localhost:27018" -ForegroundColor White

Write-Host "`n🚀 Widget Builder Features:" -ForegroundColor Yellow
Write-Host "   ✅ Drag & Drop Editor" -ForegroundColor White
Write-Host "   ✅ Real-time Preview" -ForegroundColor White
Write-Host "   ✅ Code View (HTML/CSS/JS)" -ForegroundColor White
Write-Host "   ✅ Component Library" -ForegroundColor White
Write-Host "   ✅ Save to Database" -ForegroundColor White
Write-Host "   ✅ Export Widget Code" -ForegroundColor White

Write-Host "`n⚠️  If the page doesn't load:" -ForegroundColor Yellow
Write-Host "   1. Wait 30-60 seconds for Angular to compile" -ForegroundColor White
Write-Host "   2. Check the terminal windows for any errors" -ForegroundColor White
Write-Host "   3. Make sure ports 3000 and 4200 are not in use" -ForegroundColor White

Write-Host "`n🎯 Quick Access:" -ForegroundColor Yellow
Write-Host "   Just open: http://localhost:4200" -ForegroundColor White

Write-Host "`nPress Enter to exit..." -ForegroundColor Yellow
Read-Host 