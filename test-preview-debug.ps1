Write-Host "🔧 Testing Preview Debug" -ForegroundColor Green
Write-Host "=======================" -ForegroundColor Cyan

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

Write-Host "`n🔧 PREVIEW DEBUG READY!" -ForegroundColor Green
Write-Host "=========================" -ForegroundColor Cyan
Write-Host "🌐 OPEN YOUR BROWSER AND GO TO:" -ForegroundColor Yellow
Write-Host "   http://localhost:4200" -ForegroundColor White
Write-Host "=========================" -ForegroundColor Cyan

Write-Host "`n🔧 Debug Features Added:" -ForegroundColor Yellow
Write-Host "   ✅ Multiple preview container detection methods" -ForegroundColor White
Write-Host "   ✅ Enhanced console logging for debugging" -ForegroundColor White
Write-Host "   ✅ Force preview test method" -ForegroundColor White
Write-Host "   ✅ Automatic tab switching" -ForegroundColor White
Write-Host "   ✅ Better error handling" -ForegroundColor White
Write-Host "   ✅ Increased timeouts for DOM readiness" -ForegroundColor White

Write-Host "`n📋 How to Debug the Preview Issues:" -ForegroundColor Yellow
Write-Host "   1. Open http://localhost:4200" -ForegroundColor White
Write-Host "   2. Open browser console (F12)" -ForegroundColor White
Write-Host "   3. Try these buttons on the welcome page:" -ForegroundColor White
Write-Host "      - '⚡ Force Preview Test' (should force preview to work)" -ForegroundColor White
Write-Host "      - '▶️ Try Demo Widget' (should show demo)" -ForegroundColor White
Write-Host "      - '🧪 Test Simple Widget' (should show simple test)" -ForegroundColor White
Write-Host "   4. In the modal, try:" -ForegroundColor White
Write-Host "      - '⚡ Force Test' button in components panel" -ForegroundColor White
Write-Host "      - 'Test Preview' button for debugging" -ForegroundColor White
Write-Host "      - 'Load Demo' button" -ForegroundColor White

Write-Host "`n🎯 Console Messages to Look For:" -ForegroundColor Yellow
Write-Host "   ✅ 'Found preview container via ViewChild'" -ForegroundColor White
Write-Host "   ✅ 'Found preview container via ID'" -ForegroundColor White
Write-Host "   ✅ 'Found preview container via class selector'" -ForegroundColor White
Write-Host "   ✅ 'Preview container found, updating...'" -ForegroundColor White
Write-Host "   ✅ 'Preview updated with URL:'" -ForegroundColor White
Write-Host "   ✅ 'Switched to preview tab'" -ForegroundColor White

Write-Host "`n⚠️  Error Messages to Watch For:" -ForegroundColor Yellow
Write-Host "   ❌ 'Preview container not available'" -ForegroundColor White
Write-Host "   ❌ 'Still no preview container found'" -ForegroundColor White
Write-Host "   ❌ 'Active tab: design' (should be 'preview')" -ForegroundColor White

Write-Host "`n🔍 Debug Steps:" -ForegroundColor Yellow
Write-Host "   1. Click '⚡ Force Preview Test' button" -ForegroundColor White
Write-Host "   2. Check console for detailed logs" -ForegroundColor White
Write-Host "   3. Look for 'FORCE TEST WORKS!' in preview" -ForegroundColor White
Write-Host "   4. If force test works, try other buttons" -ForegroundColor White
Write-Host "   5. If force test fails, check console errors" -ForegroundColor White

Write-Host "`n🎯 Expected Results:" -ForegroundColor Yellow
Write-Host "   🔧 Force test shows red background with 'FORCE TEST WORKS!'" -ForegroundColor White
Write-Host "   🔧 Console shows successful preview container detection" -ForegroundColor White
Write-Host "   🔧 Demo widgets display properly" -ForegroundColor White
Write-Host "   🔧 Preview tab shows content instead of placeholder" -ForegroundColor White
Write-Host "   🔧 No more 'Preview container not available' errors" -ForegroundColor White

Write-Host "`n⚠️  If Force Test Fails:" -ForegroundColor Yellow
Write-Host "   1. Check if modal is open (should be)" -ForegroundColor White
Write-Host "   2. Check if preview tab is active" -ForegroundColor White
Write-Host "   3. Check browser console for errors" -ForegroundColor White
Write-Host "   4. Try refreshing the page" -ForegroundColor White
Write-Host "   5. Check if Angular is fully loaded" -ForegroundColor White

Write-Host "`n🎯 Quick Access:" -ForegroundColor Yellow
Write-Host "   Just open: http://localhost:4200" -ForegroundColor White

Write-Host "`nPress Enter to exit..." -ForegroundColor Yellow
Read-Host 