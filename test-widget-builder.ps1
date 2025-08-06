Write-Host "🧪 Testing Widget Builder Fix" -ForegroundColor Green
Write-Host "=============================" -ForegroundColor Cyan

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

Write-Host "`n🎉 TESTING WIDGET BUILDER!" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "🌐 OPEN YOUR BROWSER AND GO TO:" -ForegroundColor Yellow
Write-Host "   http://localhost:4200" -ForegroundColor White
Write-Host "=========================================" -ForegroundColor Cyan

Write-Host "`n📋 What to Test:" -ForegroundColor Yellow
Write-Host "   1. Click '🎨 Open Widget Builder' button" -ForegroundColor White
Write-Host "   2. Click '🔧 Test Navigation' button" -ForegroundColor White
Write-Host "   3. Check browser console for logs" -ForegroundColor White
Write-Host "   4. Should navigate to /widget-builder" -ForegroundColor White

Write-Host "`n⚠️  If it doesn't work:" -ForegroundColor Yellow
Write-Host "   1. Check browser console (F12)" -ForegroundColor White
Write-Host "   2. Look for any error messages" -ForegroundColor White
Write-Host "   3. Make sure Angular compiled successfully" -ForegroundColor White

Write-Host "`n🎯 Quick Access:" -ForegroundColor Yellow
Write-Host "   Just open: http://localhost:4200" -ForegroundColor White

Write-Host "`nPress Enter to exit..." -ForegroundColor Yellow
Read-Host 