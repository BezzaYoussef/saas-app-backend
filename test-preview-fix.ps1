Write-Host "🔧 Testing Preview Fix" -ForegroundColor Green
Write-Host "====================" -ForegroundColor Cyan

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

Write-Host "`n🔧 PREVIEW FIX READY!" -ForegroundColor Green
Write-Host "=========================" -ForegroundColor Cyan
Write-Host "🌐 OPEN YOUR BROWSER AND GO TO:" -ForegroundColor Yellow
Write-Host "   http://localhost:4200" -ForegroundColor White
Write-Host "=========================" -ForegroundColor Cyan

Write-Host "`n🔧 Preview Issues Fixed:" -ForegroundColor Yellow
Write-Host "   ✅ Fixed ViewChild references (static: false)" -ForegroundColor White
Write-Host "   ✅ Added fallback ID-based element access" -ForegroundColor White
Write-Host "   ✅ Improved tab change handling" -ForegroundColor White
Write-Host "   ✅ Added better error handling" -ForegroundColor White
Write-Host "   ✅ Increased timeout for DOM readiness" -ForegroundColor White
Write-Host "   ✅ Added console logging for debugging" -ForegroundColor White

Write-Host "`n📋 How to Test the Preview Fix:" -ForegroundColor Yellow
Write-Host "   1. Open http://localhost:4200" -ForegroundColor White
Write-Host "   2. Try these buttons on the welcome page:" -ForegroundColor White
Write-Host "      - '▶️ Try Demo Widget' (should show demo in preview)" -ForegroundColor White
Write-Host "      - '🧪 Test Simple Widget' (should show simple test)" -ForegroundColor White
Write-Host "   3. In the modal, try:" -ForegroundColor White
Write-Host "      - Click 'Preview' tab (should show content)" -ForegroundColor White
Write-Host "      - Try 'Test Preview' button in components panel" -ForegroundColor White
Write-Host "      - Try 'Load Demo' button in components panel" -ForegroundColor White

Write-Host "`n🎯 Expected Results:" -ForegroundColor Yellow
Write-Host "   🔧 Preview tab shows content instead of placeholder" -ForegroundColor White
Write-Host "   🔧 Demo widget displays with gradient background" -ForegroundColor White
Write-Host "   🔧 Simple test widget shows basic content" -ForegroundColor White
Write-Host "   🔧 Buttons in widgets are clickable" -ForegroundColor White
Write-Host "   🔧 No more 'Preview container not available' errors" -ForegroundColor White
Write-Host "   🔧 Console shows successful preview updates" -ForegroundColor White

Write-Host "`n🎪 Demo Widget Features:" -ForegroundColor Yellow
Write-Host "   🎨 Beautiful gradient background" -ForegroundColor White
Write-Host "   📱 Responsive grid layout" -ForegroundColor White
Write-Host "   🎯 Interactive buttons with hover effects" -ForegroundColor White
Write-Host "   💰 Three pricing plans displayed" -ForegroundColor White
Write-Host "   ✨ Glassmorphism design effects" -ForegroundColor White

Write-Host "`n⚠️  If issues persist:" -ForegroundColor Yellow
Write-Host "   1. Check browser console (F12) for errors" -ForegroundColor White
Write-Host "   2. Look for 'Preview updated with URL:' messages" -ForegroundColor White
Write-Host "   3. Try refreshing the page" -ForegroundColor White
Write-Host "   4. Check that the preview tab is active" -ForegroundColor White
Write-Host "   5. Verify that content is being set (currentHtml)" -ForegroundColor White

Write-Host "`n🎯 Quick Access:" -ForegroundColor Yellow
Write-Host "   Just open: http://localhost:4200" -ForegroundColor White

Write-Host "`nPress Enter to exit..." -ForegroundColor Yellow
Read-Host 