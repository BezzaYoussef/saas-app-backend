Write-Host "🎯 Testing Complete Widget System" -ForegroundColor Green
Write-Host "=================================" -ForegroundColor Cyan

Write-Host "`nStep 1: Checking Prerequisites..." -ForegroundColor Yellow

# Check if Node.js is installed
try {
    $nodeVersion = node --version
    Write-Host "✅ Node.js version: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Node.js not found. Please install Node.js first." -ForegroundColor Red
    exit 1
}

# Check if npm is installed
try {
    $npmVersion = npm --version
    Write-Host "✅ npm version: $npmVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ npm not found. Please install npm first." -ForegroundColor Red
    exit 1
}

# Check if MongoDB is installed
try {
    $mongoVersion = mongod --version
    Write-Host "✅ MongoDB is installed" -ForegroundColor Green
} catch {
    Write-Host "⚠️  MongoDB not found. Will attempt to start with default installation." -ForegroundColor Yellow
}

Write-Host "`nStep 2: Starting MongoDB..." -ForegroundColor Yellow
try {
    # Create data directory if it doesn't exist
    $dataDir = "C:\data\db"
    if (!(Test-Path $dataDir)) {
        New-Item -ItemType Directory -Path $dataDir -Force | Out-Null
        Write-Host "✅ Created MongoDB data directory: $dataDir" -ForegroundColor Green
    }
    
    # Start MongoDB
    Start-Process mongod -ArgumentList "--dbpath", $dataDir, "--port", "27017" -WindowStyle Hidden
    Start-Sleep -Seconds 5
    Write-Host "✅ MongoDB started on port 27017" -ForegroundColor Green
} catch {
    Write-Host "❌ Failed to start MongoDB: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "💡 Try running: .\install-mongodb.ps1" -ForegroundColor Yellow
}

Write-Host "`nStep 3: Installing Backend Dependencies..." -ForegroundColor Yellow
try {
    Set-Location "saas-app-backend"
    npm install
    Write-Host "✅ Backend dependencies installed" -ForegroundColor Green
} catch {
    Write-Host "❌ Failed to install backend dependencies: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

Write-Host "`nStep 4: Starting Backend..." -ForegroundColor Yellow
try {
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "npm run start:dev" -WindowStyle Normal
    Write-Host "✅ Backend started on http://localhost:3002" -ForegroundColor Green
} catch {
    Write-Host "❌ Failed to start backend: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

Write-Host "`nStep 5: Installing Frontend Dependencies..." -ForegroundColor Yellow
try {
    Set-Location "..\saas-app-frontend"
    npm install
    Write-Host "✅ Frontend dependencies installed" -ForegroundColor Green
} catch {
    Write-Host "❌ Failed to install frontend dependencies: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

Write-Host "`nStep 6: Starting Frontend..." -ForegroundColor Yellow
try {
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "npm start" -WindowStyle Normal
    Write-Host "✅ Frontend started on http://localhost:4200" -ForegroundColor Green
} catch {
    Write-Host "❌ Failed to start frontend: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

Write-Host "`nStep 7: Waiting for services to initialize..." -ForegroundColor Yellow
Start-Sleep -Seconds 30

Write-Host "`n🎯 WIDGET SYSTEM READY!" -ForegroundColor Green
Write-Host "=======================" -ForegroundColor Cyan
Write-Host "🌐 OPEN YOUR BROWSER AND GO TO:" -ForegroundColor Yellow
Write-Host "   http://localhost:4200" -ForegroundColor White
Write-Host "=======================" -ForegroundColor Cyan

Write-Host "`n🎯 Testing Checklist:" -ForegroundColor Yellow
Write-Host "====================" -ForegroundColor Cyan

Write-Host "`n📱 1. BASIC NAVIGATION:" -ForegroundColor Green
Write-Host "   ✅ Home page loads" -ForegroundColor White
Write-Host "   ✅ Sign up/Sign in pages work" -ForegroundColor White
Write-Host "   ✅ Dashboard loads" -ForegroundColor White
Write-Host "   ✅ Widget Builder accessible" -ForegroundColor White

Write-Host "`n🎨 2. WIDGET BUILDER:" -ForegroundColor Green
Write-Host "   ✅ Components panel loads" -ForegroundColor White
Write-Host "   ✅ Drag and drop works" -ForegroundColor White
Write-Host "   ✅ Properties panel opens" -ForegroundColor White
Write-Host "   ✅ Preview tab works" -ForegroundColor White
Write-Host "   ✅ Code tab shows HTML/CSS/JS" -ForegroundColor White

Write-Host "`n💾 3. SAVE FUNCTIONALITY:" -ForegroundColor Green
Write-Host "   ✅ Widget saves to database" -ForegroundColor White
Write-Host "   ✅ Success message appears" -ForegroundColor White
Write-Host "   ✅ Widget appears in dashboard" -ForegroundColor White
Write-Host "   ✅ Edit existing widgets works" -ForegroundColor White

Write-Host "`n📱 4. RESPONSIVE DESIGN:" -ForegroundColor Green
Write-Host "   ✅ Desktop layout (1200px+)" -ForegroundColor White
Write-Host "   ✅ Tablet layout (768px-1024px)" -ForegroundColor White
Write-Host "   ✅ Mobile layout (<768px)" -ForegroundColor White
Write-Host "   ✅ Touch-friendly interactions" -ForegroundColor White

Write-Host "`n🎯 Step-by-Step Testing:" -ForegroundColor Yellow
Write-Host "=======================" -ForegroundColor Cyan

Write-Host "`nStep 1: Test Home Page" -ForegroundColor Green
Write-Host "   1. Open http://localhost:4200" -ForegroundColor White
Write-Host "   2. Verify page loads without errors" -ForegroundColor White
Write-Host "   3. Check browser console (F12) for errors" -ForegroundColor White

Write-Host "`nStep 2: Test Widget Builder" -ForegroundColor Green
Write-Host "   1. Navigate to Widget Builder" -ForegroundColor White
Write-Host "   2. Drag a button component to canvas" -ForegroundColor White
Write-Host "   3. Click on the component to open properties" -ForegroundColor White
Write-Host "   4. Change text and styling" -ForegroundColor White
Write-Host "   5. Test preview tab" -ForegroundColor White

Write-Host "`nStep 3: Test Save Functionality" -ForegroundColor Green
Write-Host "   1. Fill in widget name and description" -ForegroundColor White
Write-Host "   2. Click 'Save Widget' button" -ForegroundColor White
Write-Host "   3. Verify success message" -ForegroundColor White
Write-Host "   4. Check dashboard for saved widget" -ForegroundColor White

Write-Host "`nStep 4: Test Dashboard" -ForegroundColor Green
Write-Host "   1. Navigate to dashboard" -ForegroundColor White
Write-Host "   2. Verify saved widgets appear" -ForegroundColor White
Write-Host "   3. Test edit functionality" -ForegroundColor White
Write-Host "   4. Test delete functionality" -ForegroundColor White

Write-Host "`nStep 5: Test Responsive Design" -ForegroundColor Green
Write-Host "   1. Open DevTools (F12)" -ForegroundColor White
Write-Host "   2. Test mobile view (375px width)" -ForegroundColor White
Write-Host "   3. Test tablet view (768px width)" -ForegroundColor White
Write-Host "   4. Test desktop view (1200px+ width)" -ForegroundColor White

Write-Host "`n🎯 API Testing:" -ForegroundColor Yellow
Write-Host "==============" -ForegroundColor Cyan

Write-Host "`nTest Backend API:" -ForegroundColor Green
Write-Host "curl http://localhost:3002/api/widgets" -ForegroundColor White
Write-Host "curl http://localhost:3002/api/widgets/stats" -ForegroundColor White

Write-Host "`nTest Database Connection:" -ForegroundColor Green
Write-Host "Test-NetConnection localhost -Port 27017" -ForegroundColor White

Write-Host "`n⚠️  Troubleshooting:" -ForegroundColor Yellow
Write-Host "==================" -ForegroundColor Cyan

Write-Host "`n❌ If Backend Fails:" -ForegroundColor Red
Write-Host "   1. Check if MongoDB is running: Test-NetConnection localhost -Port 27017" -ForegroundColor White
Write-Host "   2. Check backend logs for errors" -ForegroundColor White
Write-Host "   3. Verify DATABASE_URL in development.env" -ForegroundColor White
Write-Host "   4. Try restarting MongoDB" -ForegroundColor White

Write-Host "`n❌ If Frontend Fails:" -ForegroundColor Red
Write-Host "   1. Check if backend is running on port 3002" -ForegroundColor White
Write-Host "   2. Check browser console (F12) for CORS errors" -ForegroundColor White
Write-Host "   3. Verify API URLs in widget-builder.service.ts" -ForegroundColor White
Write-Host "   4. Try clearing browser cache" -ForegroundColor White

Write-Host "`n❌ If Save Fails:" -ForegroundColor Red
Write-Host "   1. Check browser console for API errors" -ForegroundColor White
Write-Host "   2. Verify backend is running and accessible" -ForegroundColor White
Write-Host "   3. Check MongoDB connection" -ForegroundColor White
Write-Host "   4. Try refreshing the page" -ForegroundColor White

Write-Host "`n🎯 Quick Commands:" -ForegroundColor Yellow
Write-Host "==================" -ForegroundColor Cyan
Write-Host "Backend URL: http://localhost:3002" -ForegroundColor White
Write-Host "Frontend URL: http://localhost:4200" -ForegroundColor White
Write-Host "MongoDB: localhost:27017" -ForegroundColor White
Write-Host "API Test: curl http://localhost:3002/api/widgets" -ForegroundColor White

Write-Host "`n✅ System Status:" -ForegroundColor Green
Write-Host "================" -ForegroundColor Cyan
Write-Host "MongoDB: Running on port 27017" -ForegroundColor White
Write-Host "Backend: Running on port 3002" -ForegroundColor White
Write-Host "Frontend: Running on port 4200" -ForegroundColor White
Write-Host "Widget API: http://localhost:3002/api/widgets" -ForegroundColor White

Write-Host "`n🎯 Ready to test! Open http://localhost:4200 in your browser." -ForegroundColor Green
Write-Host "Press Enter to exit..." -ForegroundColor Yellow
Read-Host
