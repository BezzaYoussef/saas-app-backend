Write-Host "🔄 Restarting Frontend with Clean Compilation..." -ForegroundColor Green

# Navigate to frontend directory
Set-Location "saas-app-frontend"

# Clear Angular cache
Write-Host "Clearing Angular cache..." -ForegroundColor Yellow
if (Test-Path ".angular") {
    Remove-Item ".angular" -Recurse -Force
}

# Clear node_modules cache
Write-Host "Clearing npm cache..." -ForegroundColor Yellow
npm cache clean --force

# Reinstall dependencies
Write-Host "Reinstalling dependencies..." -ForegroundColor Yellow
npm install --ignore-scripts

# Start Angular with clean compilation
Write-Host "Starting Angular development server..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "npm start" -WindowStyle Normal

# Wait a moment
Start-Sleep -Seconds 10

Write-Host "`n🎉 FRONTEND IS RESTARTING!" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "🌐 OPEN YOUR BROWSER AND GO TO:" -ForegroundColor Yellow
Write-Host "   http://localhost:4200" -ForegroundColor White
Write-Host "=========================================" -ForegroundColor Cyan

Write-Host "`n📋 What you'll see:" -ForegroundColor Yellow
Write-Host "   ✅ Widget Builder Interface" -ForegroundColor White
Write-Host "   ✅ Design Tab (VvvebJs Editor)" -ForegroundColor White
Write-Host "   ✅ Preview Tab (Real-time Preview)" -ForegroundColor White
Write-Host "   ✅ Code Tab (HTML/CSS/JS Editing)" -ForegroundColor White
Write-Host "   ✅ Component Library" -ForegroundColor White

Write-Host "`n⚠️  If the page doesn't load:" -ForegroundColor Yellow
Write-Host "   1. Wait 30-60 seconds for Angular to compile" -ForegroundColor White
Write-Host "   2. Check the terminal window for any errors" -ForegroundColor White
Write-Host "   3. Make sure port 4200 is not in use" -ForegroundColor White

Write-Host "`n🎯 Quick Access:" -ForegroundColor Yellow
Write-Host "   Just open: http://localhost:4200" -ForegroundColor White

Write-Host "`nPress Enter to exit..." -ForegroundColor Yellow
Read-Host 