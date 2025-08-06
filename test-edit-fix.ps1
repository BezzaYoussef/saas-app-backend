Write-Host "🔧 Testing Edit Widget Fix" -ForegroundColor Green
Write-Host "=========================" -ForegroundColor Cyan

Write-Host "`nStep 1: Checking if services are running..." -ForegroundColor Yellow

# Check MongoDB
$mongoStatus = netstat -ano | findstr :27018
if ($mongoStatus) {
    Write-Host "   ✅ MongoDB: Running on port 27018" -ForegroundColor Green
} else {
    Write-Host "   ❌ MongoDB: Not running" -ForegroundColor Red
}

# Check Backend
$backendStatus = netstat -ano | findstr :3000
if ($backendStatus) {
    Write-Host "   ✅ Backend: Running on port 3000" -ForegroundColor Green
} else {
    Write-Host "   ❌ Backend: Not running" -ForegroundColor Red
}

# Check Frontend
$frontendStatus = netstat -ano | findstr :4200
if ($frontendStatus) {
    Write-Host "   ✅ Frontend: Running on port 4200" -ForegroundColor Green
} else {
    Write-Host "   ❌ Frontend: Not running" -ForegroundColor Red
}

Write-Host "`nStep 2: Instructions to test the fixes..." -ForegroundColor Yellow
Write-Host "=============================================" -ForegroundColor Cyan

Write-Host "`n🎯 Test Edit Widget Fix:" -ForegroundColor Yellow
Write-Host "=======================" -ForegroundColor Cyan
Write-Host "   1. Open http://localhost:4200" -ForegroundColor White
Write-Host "   2. Click 'Launch Widget Builder'" -ForegroundColor White
Write-Host "   3. Go to 'Database' tab" -ForegroundColor White
Write-Host "   4. Click 'Load Widgets' to load saved widgets" -ForegroundColor White
Write-Host "   5. Try clicking 'Edit' button on any widget" -ForegroundColor White
Write-Host "   6. Should now work without 'Widget ID is missing' error" -ForegroundColor White

Write-Host "`n🎯 Test Scrolling in Saved Widgets:" -ForegroundColor Yellow
Write-Host "===================================" -ForegroundColor Cyan
Write-Host "   1. In the 'Database' tab" -ForegroundColor White
Write-Host "   2. If you have many widgets, you should see a scrollbar" -ForegroundColor White
Write-Host "   3. The scrollbar should be styled and functional" -ForegroundColor White
Write-Host "   4. Widget cards should be properly spaced" -ForegroundColor White

Write-Host "`n🔧 What was fixed:" -ForegroundColor Yellow
Write-Host "==================" -ForegroundColor Cyan
Write-Host "   1. Widget ID handling - now supports both 'id' and '_id' fields" -ForegroundColor White
Write-Host "   2. Improved error handling in editWidget method" -ForegroundColor White
Write-Host "   3. Better data processing in loadWidgetsFromBackend" -ForegroundColor White
Write-Host "   4. Scrolling already implemented in widget-list CSS" -ForegroundColor White

Write-Host "`n🌐 Open your browser and test:" -ForegroundColor Yellow
Write-Host "   http://localhost:4200" -ForegroundColor White

Write-Host "`nPress Enter to exit..." -ForegroundColor Yellow
Read-Host 