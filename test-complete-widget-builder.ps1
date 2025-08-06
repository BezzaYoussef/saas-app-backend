Write-Host "🎯 Testing Complete Widget Builder" -ForegroundColor Green
Write-Host "=================================" -ForegroundColor Cyan

Write-Host "`nStep 1: Starting Complete Stack..." -ForegroundColor Yellow
try {
    # Start MongoDB
    Write-Host "Starting MongoDB..." -ForegroundColor Yellow
    $dataDir = "C:\data\db"
    if (!(Test-Path $dataDir)) {
        New-Item -ItemType Directory -Path $dataDir -Force | Out-Null
    }
    Start-Process mongod -ArgumentList "--dbpath", $dataDir, "--port", "27018" -WindowStyle Hidden
    Start-Sleep -Seconds 5
    
    # Start Backend
    Write-Host "Starting Backend..." -ForegroundColor Yellow
    Set-Location "saas-app-backend"
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "npm run start:dev" -WindowStyle Normal
    
    # Start Frontend
    Write-Host "Starting Frontend..." -ForegroundColor Yellow
    Set-Location "..\saas-app-frontend"
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "npm start" -WindowStyle Normal
    
    Write-Host "✅ All services started!" -ForegroundColor Green
}
catch {
    Write-Host "❌ Failed to start services: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "`nStep 2: Waiting for services..." -ForegroundColor Yellow
Start-Sleep -Seconds 60

Write-Host "`n🎯 COMPLETE WIDGET BUILDER READY!" -ForegroundColor Green
Write-Host "===================================" -ForegroundColor Cyan
Write-Host "🌐 OPEN YOUR BROWSER AND GO TO:" -ForegroundColor Yellow
Write-Host "   http://localhost:4200" -ForegroundColor White
Write-Host "===================================" -ForegroundColor Cyan

Write-Host "`n🎯 Features to Test:" -ForegroundColor Yellow
Write-Host "===================" -ForegroundColor Cyan

Write-Host "`n📱 1. RESPONSIVE DESIGN:" -ForegroundColor Green
Write-Host "   ✅ Open DevTools (F12)" -ForegroundColor White
Write-Host "   ✅ Click mobile icon (📱)" -ForegroundColor White
Write-Host "   ✅ Test iPad (768px x 1024px)" -ForegroundColor White
Write-Host "   ✅ Test iPhone (375px x 667px)" -ForegroundColor White
Write-Host "   ✅ Test Galaxy (360px x 640px)" -ForegroundColor White
Write-Host "   ✅ Test landscape orientation" -ForegroundColor White

Write-Host "`n💾 2. SAVE WIDGET FUNCTIONALITY:" -ForegroundColor Green
Write-Host "   ✅ Launch Widget Builder" -ForegroundColor White
Write-Host "   ✅ Drag components to canvas" -ForegroundColor White
Write-Host "   ✅ Add CSS and JavaScript" -ForegroundColor White
Write-Host "   ✅ Click 'Save' button" -ForegroundColor White
Write-Host "   ✅ Check 'Database' tab" -ForegroundColor White
Write-Host "   ✅ Verify widget is saved" -ForegroundColor White

Write-Host "`n🎨 3. WIDGET BUILDER FEATURES:" -ForegroundColor Green
Write-Host "   ✅ Scroll through components" -ForegroundColor White
Write-Host "   ✅ Drag and drop components" -ForegroundColor White
Write-Host "   ✅ Preview tab works" -ForegroundColor White
Write-Host "   ✅ Code tab shows HTML/CSS/JS" -ForegroundColor White
Write-Host "   ✅ Database tab loads saved widgets" -ForegroundColor White

Write-Host "`n📱 4. MOBILE RESPONSIVE TESTING:" -ForegroundColor Green
Write-Host "   ✅ Components scroll horizontally on phone" -ForegroundColor White
Write-Host "   ✅ Modal takes full screen on phone" -ForegroundColor White
Write-Host "   ✅ Tabs scroll horizontally on phone" -ForegroundColor White
Write-Host "   ✅ Touch-friendly button sizes" -ForegroundColor White
Write-Host "   ✅ No horizontal overflow" -ForegroundColor White

Write-Host "`n🎯 Testing Steps:" -ForegroundColor Yellow
Write-Host "=================" -ForegroundColor Cyan

Write-Host "`nStep 1: Test Desktop Version" -ForegroundColor Green
Write-Host "   1. Open http://localhost:4200" -ForegroundColor White
Write-Host "   2. Click '🚀 Launch Widget Builder'" -ForegroundColor White
Write-Host "   3. Test dragging components" -ForegroundColor White
Write-Host "   4. Test preview functionality" -ForegroundColor White
Write-Host "   5. Test save functionality" -ForegroundColor White

Write-Host "`nStep 2: Test Tablet Version" -ForegroundColor Green
Write-Host "   1. Open DevTools (F12)" -ForegroundColor White
Write-Host "   2. Click mobile icon (📱)" -ForegroundColor White
Write-Host "   3. Select 'iPad' from dropdown" -ForegroundColor White
Write-Host "   4. Test the layout and functionality" -ForegroundColor White
Write-Host "   5. Verify components panel is narrower" -ForegroundColor White

Write-Host "`nStep 3: Test Phone Version" -ForegroundColor Green
Write-Host "   1. In DevTools, select 'iPhone'" -ForegroundColor White
Write-Host "   2. Test full-screen modal" -ForegroundColor White
Write-Host "   3. Test horizontal scrolling components" -ForegroundColor White
Write-Host "   4. Test vertical layout" -ForegroundColor White
Write-Host "   5. Test touch interactions" -ForegroundColor White

Write-Host "`nStep 4: Test Save Functionality" -ForegroundColor Green
Write-Host "   1. Drag a component to canvas" -ForegroundColor White
Write-Host "   2. Add some CSS in the Code tab" -ForegroundColor White
Write-Host "   3. Add some JavaScript in the Code tab" -ForegroundColor White
Write-Host "   4. Click 'Save' button" -ForegroundColor White
Write-Host "   5. Check 'Database' tab for saved widget" -ForegroundColor White

Write-Host "`n🎯 Expected Results:" -ForegroundColor Yellow
Write-Host "===================" -ForegroundColor Cyan

Write-Host "`n✅ Desktop (1024px+):" -ForegroundColor Green
Write-Host "   - Side-by-side layout" -ForegroundColor White
Write-Host "   - Components panel on left" -ForegroundColor White
Write-Host "   - Vertical scrolling in components" -ForegroundColor White
Write-Host "   - Modal with rounded corners" -ForegroundColor White

Write-Host "`n✅ Tablet (768px-1024px):" -ForegroundColor Green
Write-Host "   - Reduced component panel width" -ForegroundColor White
Write-Host "   - Smaller padding and fonts" -ForegroundColor White
Write-Host "   - Optimized for touch" -ForegroundColor White

Write-Host "`n✅ Phone (768px-):" -ForegroundColor Green
Write-Host "   - Full-screen modal" -ForegroundColor White
Write-Host "   - Horizontal scrolling components" -ForegroundColor White
Write-Host "   - Vertical layout (stacked)" -ForegroundColor White
Write-Host "   - Touch-friendly buttons" -ForegroundColor White

Write-Host "`n✅ Save Functionality:" -ForegroundColor Green
Write-Host "   - Widget saves with HTML, CSS, JS" -ForegroundColor White
Write-Host "   - Success message appears" -ForegroundColor White
Write-Host "   - Widget appears in Database tab" -ForegroundColor White
Write-Host "   - No console errors" -ForegroundColor White

Write-Host "`n⚠️  Troubleshooting:" -ForegroundColor Yellow
Write-Host "==================" -ForegroundColor Cyan

Write-Host "`n❌ If Save Fails:" -ForegroundColor Red
Write-Host "   1. Check if backend is running on http://localhost:3000" -ForegroundColor White
Write-Host "   2. Check if MongoDB is running on port 27018" -ForegroundColor White
Write-Host "   3. Open browser console (F12) for error details" -ForegroundColor White
Write-Host "   4. Try refreshing the page" -ForegroundColor White

Write-Host "`n❌ If Mobile Not Working:" -ForegroundColor Red
Write-Host "   1. Make sure you're using DevTools mobile simulation" -ForegroundColor White
Write-Host "   2. Try different device presets" -ForegroundColor White
Write-Host "   3. Test both portrait and landscape" -ForegroundColor White
Write-Host "   4. Hard refresh (Ctrl+F5) after changing device size" -ForegroundColor White

Write-Host "`n❌ If Components Not Dragging:" -ForegroundColor Red
Write-Host "   1. Check if you're in the Design tab" -ForegroundColor White
Write-Host "   2. Try dragging from different positions" -ForegroundColor White
Write-Host "   3. Check browser console for errors" -ForegroundColor White

Write-Host "`n🎯 Quick Commands:" -ForegroundColor Yellow
Write-Host "==================" -ForegroundColor Cyan
Write-Host "Test Backend: curl http://localhost:3000/api/widgets" -ForegroundColor White
Write-Host "Test MongoDB: Test-NetConnection localhost -Port 27018" -ForegroundColor White
Write-Host "Open Frontend: http://localhost:4200" -ForegroundColor White

Write-Host "`nPress Enter to exit..." -ForegroundColor Yellow
Read-Host 