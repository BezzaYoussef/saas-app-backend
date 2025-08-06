Write-Host "👁️ Testing Preview Fix - Version 2" -ForegroundColor Green
Write-Host "=====================================" -ForegroundColor Cyan

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

Write-Host "`n👁️ PREVIEW FIX V2 READY!" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "🌐 OPEN YOUR BROWSER AND GO TO:" -ForegroundColor Yellow
Write-Host "   http://localhost:4200" -ForegroundColor White
Write-Host "=========================================" -ForegroundColor Cyan

Write-Host "`n📋 How to Test the Preview Fix:" -ForegroundColor Yellow
Write-Host "   1. Click '🎨 Open Widget Builder' button" -ForegroundColor White
Write-Host "   2. Click '🧪 Simple Test Widget' button (should work)" -ForegroundColor White
Write-Host "   3. Switch to '👁️ Preview' tab" -ForegroundColor White
Write-Host "   4. You should see a simple test widget" -ForegroundColor White
Write-Host "   5. Click '💰 Load Pricing Example' button" -ForegroundColor White
Write-Host "   6. Switch to '👁️ Preview' tab again" -ForegroundColor White
Write-Host "   7. Click '🐛 Debug Preview' if it doesn't work" -ForegroundColor White

Write-Host "`n🚀 What Should Work Now:" -ForegroundColor Yellow
Write-Host "   ✅ Simple test widget displays in preview" -ForegroundColor White
Write-Host "   ✅ Pricing widget displays in preview" -ForegroundColor White
Write-Host "   ✅ Interactive buttons work in preview" -ForegroundColor White
Write-Host "   ✅ CSS styles are applied correctly" -ForegroundColor White
Write-Host "   ✅ JavaScript functionality works" -ForegroundColor White
Write-Host "   ✅ Font Awesome icons display" -ForegroundColor White
Write-Host "   ✅ Responsive design in preview" -ForegroundColor White

Write-Host "`n💡 Debug Features:" -ForegroundColor Yellow
Write-Host "   🐛 Debug Preview button logs info to console" -ForegroundColor White
Write-Host "   🧪 Simple Test Widget for basic testing" -ForegroundColor White
Write-Host "   👁️ Improved iframe rendering" -ForegroundColor White
Write-Host "   🔧 Better error handling" -ForegroundColor White

Write-Host "`n⚠️  If preview still doesn't work:" -ForegroundColor Yellow
Write-Host "   1. Click '🐛 Debug Preview' button" -ForegroundColor White
Write-Host "   2. Check browser console (F12) for debug info" -ForegroundColor White
Write-Host "   3. Try the '🧪 Simple Test Widget' first" -ForegroundColor White
Write-Host "   4. Make sure you're on the Preview tab" -ForegroundColor White
Write-Host "   5. Wait a few seconds for iframe to load" -ForegroundColor White

Write-Host "`n🎯 Quick Access:" -ForegroundColor Yellow
Write-Host "   Just open: http://localhost:4200" -ForegroundColor White

Write-Host "`nPress Enter to exit..." -ForegroundColor Yellow
Read-Host 