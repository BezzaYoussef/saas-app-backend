Write-Host "🔧 Testing Backend Connection" -ForegroundColor Green
Write-Host "============================" -ForegroundColor Cyan

Write-Host "`nStep 1: Checking MongoDB..." -ForegroundColor Yellow
try {
    $mongodbTest = Test-NetConnection -ComputerName localhost -Port 27018 -InformationLevel Quiet
    if ($mongodbTest) {
        Write-Host "✅ MongoDB is running on port 27018" -ForegroundColor Green
    } else {
        Write-Host "❌ MongoDB is not running on port 27018" -ForegroundColor Red
        Write-Host "   Starting MongoDB..." -ForegroundColor Yellow
        
        # Try to start MongoDB
        $dataDir = "C:\data\db"
        if (!(Test-Path $dataDir)) {
            New-Item -ItemType Directory -Path $dataDir -Force | Out-Null
        }
        
        Start-Process mongod -ArgumentList "--dbpath", $dataDir, "--port", "27018" -WindowStyle Hidden
        Start-Sleep -Seconds 5
        Write-Host "✅ MongoDB started" -ForegroundColor Green
    }
}
catch {
    Write-Host "❌ MongoDB test failed: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "`nStep 2: Checking Backend..." -ForegroundColor Yellow
try {
    $backendTest = Test-NetConnection -ComputerName localhost -Port 3000 -InformationLevel Quiet
    if ($backendTest) {
        Write-Host "✅ Backend is running on port 3000" -ForegroundColor Green
    } else {
        Write-Host "❌ Backend is not running on port 3000" -ForegroundColor Red
        Write-Host "   Starting Backend..." -ForegroundColor Yellow
        
        Set-Location "saas-app-backend"
        Start-Process powershell -ArgumentList "-NoExit", "-Command", "npm run start:dev" -WindowStyle Normal
        Start-Sleep -Seconds 10
        Write-Host "✅ Backend started" -ForegroundColor Green
    }
}
catch {
    Write-Host "❌ Backend test failed: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "`nStep 3: Testing API Endpoint..." -ForegroundColor Yellow
try {
    $apiTest = Invoke-RestMethod -Uri "http://localhost:3000/api/widgets" -Method GET -ErrorAction Stop
    Write-Host "✅ Backend API is responding" -ForegroundColor Green
    Write-Host "   Response: $($apiTest | ConvertTo-Json -Depth 1)" -ForegroundColor White
}
catch {
    Write-Host "❌ Backend API test failed: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "   This means the backend is not ready yet" -ForegroundColor Yellow
}

Write-Host "`nStep 4: Starting Frontend..." -ForegroundColor Yellow
try {
    Set-Location "..\saas-app-frontend"
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "npm start" -WindowStyle Normal
    Write-Host "✅ Frontend starting on http://localhost:4200" -ForegroundColor Green
}
catch {
    Write-Host "❌ Failed to start frontend" -ForegroundColor Red
}

Write-Host "`nStep 5: Waiting for services..." -ForegroundColor Yellow
Start-Sleep -Seconds 30

Write-Host "`n🔧 BACKEND CONNECTION TEST COMPLETE!" -ForegroundColor Green
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "🌐 FRONTEND: http://localhost:4200" -ForegroundColor Yellow
Write-Host "🔧 BACKEND: http://localhost:3000" -ForegroundColor Yellow
Write-Host "🗄️  MONGODB: localhost:27018" -ForegroundColor Yellow
Write-Host "=====================================" -ForegroundColor Cyan

Write-Host "`n📋 How to Fix 'Failed to save widget' Error:" -ForegroundColor Yellow
Write-Host "=============================================" -ForegroundColor Cyan

Write-Host "`n🎯 Step 1: Verify Backend is Running" -ForegroundColor Green
Write-Host "   1. Open http://localhost:3000 in browser" -ForegroundColor White
Write-Host "   2. You should see NestJS welcome page" -ForegroundColor White
Write-Host "   3. If not, backend is not running" -ForegroundColor White

Write-Host "`n🎯 Step 2: Test API Endpoint" -ForegroundColor Green
Write-Host "   1. Open http://localhost:3000/api/widgets" -ForegroundColor White
Write-Host "   2. You should see JSON response (empty array is OK)" -ForegroundColor White
Write-Host "   3. If error, backend has issues" -ForegroundColor White

Write-Host "`n🎯 Step 3: Test Widget Save" -ForegroundColor Green
Write-Host "   1. Open http://localhost:4200" -ForegroundColor White
Write-Host "   2. Launch Widget Builder" -ForegroundColor White
Write-Host "   3. Drag a component to canvas" -ForegroundColor White
Write-Host "   4. Click 'Save' button" -ForegroundColor White
Write-Host "   5. Check 'Database' tab for saved widget" -ForegroundColor White

Write-Host "`n🎯 Step 4: Debug Console Errors" -ForegroundColor Green
Write-Host "   1. Open browser DevTools (F12)" -ForegroundColor White
Write-Host "   2. Go to Console tab" -ForegroundColor White
Write-Host "   3. Try to save widget" -ForegroundColor White
Write-Host "   4. Look for error messages" -ForegroundColor White

Write-Host "`n⚠️  Common Issues and Solutions:" -ForegroundColor Yellow
Write-Host "=================================" -ForegroundColor Cyan

Write-Host "`n❌ Issue: CORS Error" -ForegroundColor Red
Write-Host "   Solution: Backend needs CORS enabled" -ForegroundColor White
Write-Host "   Check: Backend should have app.enableCors()" -ForegroundColor White

Write-Host "`n❌ Issue: Connection Refused" -ForegroundColor Red
Write-Host "   Solution: Backend is not running" -ForegroundColor White
Write-Host "   Fix: Start backend with 'npm run start:dev'" -ForegroundColor White

Write-Host "`n❌ Issue: MongoDB Connection Error" -ForegroundColor Red
Write-Host "   Solution: MongoDB is not running" -ForegroundColor White
Write-Host "   Fix: Start MongoDB on port 27018" -ForegroundColor White

Write-Host "`n❌ Issue: 404 Not Found" -ForegroundColor Red
Write-Host "   Solution: API endpoint doesn't exist" -ForegroundColor White
Write-Host "   Fix: Check if widget controller is properly registered" -ForegroundColor White

Write-Host "`n🎯 Quick Fix Commands:" -ForegroundColor Yellow
Write-Host "=====================" -ForegroundColor Cyan
Write-Host "1. Start MongoDB: mongod --dbpath C:\data\db --port 27018" -ForegroundColor White
Write-Host "2. Start Backend: cd saas-app-backend && npm run start:dev" -ForegroundColor White
Write-Host "3. Start Frontend: cd saas-app-frontend && npm start" -ForegroundColor White
Write-Host "4. Test API: curl http://localhost:3000/api/widgets" -ForegroundColor White

Write-Host "`nPress Enter to exit..." -ForegroundColor Yellow
Read-Host 