Write-Host "🔧 Testing Modal Fix" -ForegroundColor Green
Write-Host "==================" -ForegroundColor Cyan

Write-Host "`nStep 1: Checking if services are running..." -ForegroundColor Yellow

# Check if frontend is running
$frontendStatus = netstat -ano | findstr :4200
if ($frontendStatus) {
    Write-Host "   ✅ Frontend: Running on port 4200" -ForegroundColor Green
} else {
    Write-Host "   ❌ Frontend: Not running" -ForegroundColor Red
    Write-Host "   Starting frontend..." -ForegroundColor Yellow
    Set-Location "saas-app-frontend"
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "npm start" -WindowStyle Normal
    Start-Sleep -Seconds 15
}

Write-Host "`nStep 2: Instructions to test the modal fix..." -ForegroundColor Yellow
Write-Host "=============================================" -ForegroundColor Cyan

Write-Host "`n🎯 Test Modal Fixes:" -ForegroundColor Yellow
Write-Host "===================" -ForegroundColor Cyan
Write-Host "   1. Open http://localhost:4200" -ForegroundColor White
Write-Host "   2. Click 'Launch Widget Builder'" -ForegroundColor White
Write-Host "   3. Check if modal is NOT blurry" -ForegroundColor White
Write-Host "   4. Click anywhere inside the modal - should NOT close" -ForegroundColor White
Write-Host "   5. Only the X button should close the modal" -ForegroundColor White

Write-Host "`n🔧 What was fixed:" -ForegroundColor Yellow
Write-Host "==================" -ForegroundColor Cyan
Write-Host "   1. Removed backdrop-filter: blur() - no more blurriness" -ForegroundColor White
Write-Host "   2. Added event.stopPropagation() to prevent modal closing" -ForegroundColor White
Write-Host "   3. Reduced backdrop opacity for better visibility" -ForegroundColor White
Write-Host "   4. Added pointer-events: auto to modal content" -ForegroundColor White

Write-Host "`n🌐 Open your browser and test:" -ForegroundColor Yellow
Write-Host "   http://localhost:4200" -ForegroundColor White

Write-Host "`n🎯 Expected Results:" -ForegroundColor Yellow
Write-Host "===================" -ForegroundColor Cyan
Write-Host "   ✅ Modal should be clear and not blurry" -ForegroundColor Green
Write-Host "   ✅ Clicking inside modal should NOT close it" -ForegroundColor Green
Write-Host "   ✅ Only X button should close the modal" -ForegroundColor Green
Write-Host "   ✅ All buttons inside modal should work normally" -ForegroundColor Green

Write-Host "`nPress Enter to exit..." -ForegroundColor Yellow
Read-Host 