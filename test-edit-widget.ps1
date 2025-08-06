Write-Host "🎯 Testing Edit Widget Functionality" -ForegroundColor Green
Write-Host "=================================" -ForegroundColor Cyan

Write-Host "`nStep 1: Starting Backend..." -ForegroundColor Yellow
try {
    Set-Location "saas-app-backend"
    
    # Kill any existing processes on port 3000
    Write-Host "Killing existing processes on port 3000..." -ForegroundColor Yellow
    $processes = netstat -ano | findstr :3000
    if ($processes) {
        $processes | ForEach-Object {
            $parts = $_ -split '\s+'
            $pid = $parts[4]
            if ($pid -and $pid -ne "0") {
                Write-Host "Killing process $pid..." -ForegroundColor Yellow
                taskkill /PID $pid /F 2>$null
            }
        }
    }
    
    # Start MongoDB
    Write-Host "Starting MongoDB..." -ForegroundColor Yellow
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "mongod --port 27018 --dbpath C:\data\db" -WindowStyle Hidden
    
    # Wait for MongoDB to start
    Start-Sleep -Seconds 5
    
    # Start Backend
    Write-Host "Starting Backend..." -ForegroundColor Yellow
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "npm start" -WindowStyle Normal
    Write-Host "✅ Backend starting on http://localhost:3000" -ForegroundColor Green
}
catch {
    Write-Host "❌ Failed to start backend" -ForegroundColor Red
}

Write-Host "`nStep 2: Starting Frontend..." -ForegroundColor Yellow
try {
    Set-Location "saas-app-frontend"
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "npm start" -WindowStyle Normal
    Write-Host "✅ Frontend starting on http://localhost:4200" -ForegroundColor Green
}
catch {
    Write-Host "❌ Failed to start frontend" -ForegroundColor Red
}

Write-Host "`nStep 3: Waiting for services..." -ForegroundColor Yellow
Start-Sleep -Seconds 90

Write-Host "`n🎯 EDIT WIDGET TEST READY!" -ForegroundColor Green
Write-Host "===========================" -ForegroundColor Cyan
Write-Host "🌐 OPEN YOUR BROWSER AND GO TO:" -ForegroundColor Yellow
Write-Host "   http://localhost:4200" -ForegroundColor White
Write-Host "===========================" -ForegroundColor Cyan

Write-Host "`n📋 Step-by-Step Test Instructions:" -ForegroundColor Yellow
Write-Host "=================================" -ForegroundColor Cyan

Write-Host "`nStep 1: Create a Test Widget" -ForegroundColor Green
Write-Host "   1. Click 'Launch Widget Builder'" -ForegroundColor White
Write-Host "   2. Enter a widget name (e.g., 'Test Widget')" -ForegroundColor White
Write-Host "   3. Add some content to HTML/CSS/JS tabs" -ForegroundColor White
Write-Host "   4. Click 'Save Widget'" -ForegroundColor White
Write-Host "   5. Verify it appears in the Database tab" -ForegroundColor White

Write-Host "`nStep 2: Test Edit Functionality" -ForegroundColor Green
Write-Host "   1. Go to Database tab" -ForegroundColor White
Write-Host "   2. Find your saved widget" -ForegroundColor White
Write-Host "   3. Click the EDIT button (pencil icon)" -ForegroundColor White
Write-Host "   4. Verify the widget data loads in the editor" -ForegroundColor White
Write-Host "   5. Make some changes to the content" -ForegroundColor White
Write-Host "   6. Click 'Update Widget'" -ForegroundColor White
Write-Host "   7. Verify the changes are saved" -ForegroundColor White

Write-Host "`nStep 3: Debug Information" -ForegroundColor Green
Write-Host "   1. Open browser Developer Tools (F12)" -ForegroundColor White
Write-Host "   2. Go to Console tab" -ForegroundColor White
Write-Host "   3. Look for any error messages" -ForegroundColor White
Write-Host "   4. Check Network tab for API calls" -ForegroundColor White

Write-Host "`n🎯 Expected Behavior:" -ForegroundColor Yellow
Write-Host "===================" -ForegroundColor Cyan

Write-Host "`n✅ When clicking Edit:" -ForegroundColor Green
Write-Host "   - Widget data should load in the editor" -ForegroundColor White
Write-Host "   - Name field should be populated" -ForegroundColor White
Write-Host "   - HTML/CSS/JS content should appear" -ForegroundColor White
Write-Host "   - Should switch to Design tab" -ForegroundColor White
Write-Host "   - Preview should update with widget content" -ForegroundColor White

Write-Host "`n✅ When clicking Update:" -ForegroundColor Green
Write-Host "   - Changes should be saved to backend" -ForegroundColor White
Write-Host "   - Success message should appear" -ForegroundColor White
Write-Host "   - Should return to Database tab" -ForegroundColor White
Write-Host "   - Widget list should refresh" -ForegroundColor White

Write-Host "`n❌ Common Issues:" -ForegroundColor Red
Write-Host "===============" -ForegroundColor Cyan
Write-Host "   - 'Invalid widget data' error" -ForegroundColor White
Write-Host "   - Backend connection refused" -ForegroundColor White
Write-Host "   - Widget data not loading" -ForegroundColor White
Write-Host "   - Update button not working" -ForegroundColor White

Write-Host "`n🔧 Troubleshooting:" -ForegroundColor Yellow
Write-Host "=================" -ForegroundColor Cyan

Write-Host "`nIf you see 'Invalid widget data' error:" -ForegroundColor Green
Write-Host "   1. Check browser console for detailed error" -ForegroundColor White
Write-Host "   2. Verify backend is running on port 3000" -ForegroundColor White
Write-Host "   3. Check MongoDB is running on port 27018" -ForegroundColor White
Write-Host "   4. Try refreshing the page" -ForegroundColor White

Write-Host "`nIf edit button doesn't work:" -ForegroundColor Green
Write-Host "   1. Check if widget has valid ID" -ForegroundColor White
Write-Host "   2. Verify widget data structure" -ForegroundColor White
Write-Host "   3. Check for JavaScript errors in console" -ForegroundColor White

Write-Host "`nIf update doesn't work:" -ForegroundColor Green
Write-Host "   1. Check if widget name is not empty" -ForegroundColor White
Write-Host "   2. Verify backend API is responding" -ForegroundColor White
Write-Host "   3. Check network tab for failed requests" -ForegroundColor White

Write-Host "`n🎯 Console Commands to Test:" -ForegroundColor Yellow
Write-Host "===========================" -ForegroundColor Cyan
Write-Host "   - Open browser console (F12)" -ForegroundColor White
Write-Host "   - Type: console.log('Testing edit widget')" -ForegroundColor White
Write-Host "   - Check for any error messages" -ForegroundColor White

Write-Host "`nPress Enter to exit..." -ForegroundColor Yellow
Read-Host 