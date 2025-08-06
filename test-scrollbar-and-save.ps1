Write-Host "🎯 Testing Scrollbar and Single Save Fixes" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Cyan

Write-Host "`nStep 1: Starting Services..." -ForegroundColor Yellow
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

Write-Host "`n🎯 FIXES READY FOR TESTING!" -ForegroundColor Green
Write-Host "===========================" -ForegroundColor Cyan
Write-Host "🌐 OPEN YOUR BROWSER AND GO TO:" -ForegroundColor Yellow
Write-Host "   http://localhost:4200" -ForegroundColor White
Write-Host "===========================" -ForegroundColor Cyan

Write-Host "`n🎯 Fixed Issues:" -ForegroundColor Yellow
Write-Host "===============" -ForegroundColor Cyan
Write-Host "   ✅ Added scrollbar to saved widgets section" -ForegroundColor White
Write-Host "   ✅ Fixed duplicate widget creation (only saves one)" -ForegroundColor White
Write-Host "   ✅ Improved widget card layout" -ForegroundColor White
Write-Host "   ✅ Better form clearing after save" -ForegroundColor White

Write-Host "`n📋 Test Instructions:" -ForegroundColor Yellow
Write-Host "===================" -ForegroundColor Cyan

Write-Host "`nStep 1: Test Single Save" -ForegroundColor Green
Write-Host "   1. Click 'Launch Widget Builder'" -ForegroundColor White
Write-Host "   2. Enter a widget name (e.g., 'Test Widget')" -ForegroundColor White
Write-Host "   3. Add some content to HTML/CSS/JS tabs" -ForegroundColor White
Write-Host "   4. Click 'Save Widget' ONCE" -ForegroundColor White
Write-Host "   5. Verify only ONE widget is created" -ForegroundColor White
Write-Host "   6. Check that form is cleared after save" -ForegroundColor White

Write-Host "`nStep 2: Test Scrollbar" -ForegroundColor Green
Write-Host "   1. Create multiple widgets (5-10 widgets)" -ForegroundColor White
Write-Host "   2. Go to Database tab" -ForegroundColor White
Write-Host "   3. Verify scrollbar appears when widgets overflow" -ForegroundColor White
Write-Host "   4. Test scrolling up and down" -ForegroundColor White
Write-Host "   5. Check scrollbar styling (should be custom styled)" -ForegroundColor White

Write-Host "`nStep 3: Test Widget Cards" -ForegroundColor Green
Write-Host "   1. Verify widget cards have proper layout" -ForegroundColor White
Write-Host "   2. Check hover effects on cards" -ForegroundColor White
Write-Host "   3. Verify edit/delete buttons are properly aligned" -ForegroundColor White
Write-Host "   4. Test widget preview functionality" -ForegroundColor White

Write-Host "`n🎯 Expected Results:" -ForegroundColor Yellow
Write-Host "===================" -ForegroundColor Cyan

Write-Host "`n✅ Single Save:" -ForegroundColor Green
Write-Host "   - Only one widget created per save" -ForegroundColor White
Write-Host "   - Form clears after successful save" -ForegroundColor White
Write-Host "   - No duplicate API calls" -ForegroundColor White
Write-Host "   - Success message appears" -ForegroundColor White

Write-Host "`n✅ Scrollbar:" -ForegroundColor Green
Write-Host "   - Scrollbar appears when widgets overflow" -ForegroundColor White
Write-Host "   - Custom styled scrollbar (8px width)" -ForegroundColor White
Write-Host "   - Smooth scrolling behavior" -ForegroundColor White
Write-Host "   - Hover effects on scrollbar thumb" -ForegroundColor White

Write-Host "`n✅ Widget Cards:" -ForegroundColor Green
Write-Host "   - Proper grid layout (responsive)" -ForegroundColor White
Write-Host "   - Hover effects with translateY(-2px)" -ForegroundColor White
Write-Host "   - Edit/Delete buttons in one line" -ForegroundColor White
Write-Host "   - Widget preview with proper sizing" -ForegroundColor White

Write-Host "`n🎯 Scrollbar Specifications:" -ForegroundColor Yellow
Write-Host "===========================" -ForegroundColor Cyan
Write-Host "   ✅ Width: 8px" -ForegroundColor White
Write-Host "   ✅ Track color: #f1f5f9" -ForegroundColor White
Write-Host "   ✅ Thumb color: #cbd5e1" -ForegroundColor White
Write-Host "   ✅ Hover color: #94a3b8" -ForegroundColor White
Write-Host "   ✅ Border radius: 4px" -ForegroundColor White

Write-Host "`n🎯 Widget Card Specifications:" -ForegroundColor Yellow
Write-Host "=============================" -ForegroundColor Cyan
Write-Host "   ✅ Min height: 200px" -ForegroundColor White
Write-Host "   ✅ Border radius: 12px" -ForegroundColor White
Write-Host "   ✅ Box shadow: 0 4px 6px rgba(0,0,0,0.05)" -ForegroundColor White
Write-Host "   ✅ Hover transform: translateY(-2px)" -ForegroundColor White
Write-Host "   ✅ Grid: auto-fill, minmax(300px, 1fr)" -ForegroundColor White

Write-Host "`nPress Enter to exit..." -ForegroundColor Yellow
Read-Host 