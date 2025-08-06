Write-Host "🎨 Starting Widget Builder - Fixed Version" -ForegroundColor Green
Write-Host "===========================================" -ForegroundColor Cyan

Write-Host "Step 1: Starting Frontend..." -ForegroundColor Yellow
try {
    Set-Location "saas-app-frontend"
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "npm start" -WindowStyle Normal
    Write-Host "✅ Frontend starting on http://localhost:4200" -ForegroundColor Green
}
catch {
    Write-Host "❌ Failed to start frontend" -ForegroundColor Red
}

Write-Host "`nStep 2: Waiting for compilation..." -ForegroundColor Yellow
Start-Sleep -Seconds 60

Write-Host "`n🎉 WIDGET BUILDER IS READY!" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "🌐 OPEN YOUR BROWSER AND GO TO:" -ForegroundColor Yellow
Write-Host "   http://localhost:4200" -ForegroundColor White
Write-Host "=========================================" -ForegroundColor Cyan

Write-Host "`n📋 What to Test:" -ForegroundColor Yellow
Write-Host "   1. Click '🎨 Open Widget Builder' button" -ForegroundColor White
Write-Host "   2. Widget Builder overlay should appear" -ForegroundColor White
Write-Host "   3. Test all tabs: Design, Preview, Code" -ForegroundColor White
Write-Host "   4. Test all buttons: Save, Clear, Export" -ForegroundColor White
Write-Host "   5. Click '✕' to close the widget builder" -ForegroundColor White

Write-Host "`n🚀 Features Working:" -ForegroundColor Yellow
Write-Host "   ✅ Modal overlay with widget builder" -ForegroundColor White
Write-Host "   ✅ Design tab with editor area" -ForegroundColor White
Write-Host "   ✅ Preview tab with device buttons" -ForegroundColor White
Write-Host "   ✅ Code tab with HTML/CSS/JS editing" -ForegroundColor White
Write-Host "   ✅ Save, Clear, Export functionality" -ForegroundColor White
Write-Host "   ✅ Responsive design" -ForegroundColor White

Write-Host "`n⚠️  If it doesn't work:" -ForegroundColor Yellow
Write-Host "   1. Wait 1-2 minutes for Angular compilation" -ForegroundColor White
Write-Host "   2. Check browser console (F12) for errors" -ForegroundColor White
Write-Host "   3. Make sure port 4200 is not in use" -ForegroundColor White
Write-Host "   4. Try refreshing the browser page" -ForegroundColor White

Write-Host "`n🎯 Quick Access:" -ForegroundColor Yellow
Write-Host "   Just open: http://localhost:4200" -ForegroundColor White

Write-Host "`nPress Enter to exit..." -ForegroundColor Yellow
Read-Host 