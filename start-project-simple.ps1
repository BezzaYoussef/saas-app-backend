Write-Host "🚀 Starting Project - Simple Version" -ForegroundColor Green
Write-Host "=====================================" -ForegroundColor Cyan

# Step 1: Start Backend
Write-Host "`nStep 1: Starting Backend Server..." -ForegroundColor Yellow
try {
    Set-Location "saas-app-backend"
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "npm run start:dev" -WindowStyle Normal
    Write-Host "✅ Backend server starting on http://localhost:3000" -ForegroundColor Green
}
catch {
    Write-Host "❌ Failed to start backend server" -ForegroundColor Red
}

# Step 2: Start Frontend
Write-Host "`nStep 2: Starting Frontend Server..." -ForegroundColor Yellow
try {
    Set-Location "saas-app-frontend"
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "npm start" -WindowStyle Normal
    Write-Host "✅ Frontend server starting on http://localhost:4200" -ForegroundColor Green
}
catch {
    Write-Host "❌ Failed to start frontend server" -ForegroundColor Red
}

# Step 3: Wait and show URLs
Write-Host "`nStep 3: Waiting for servers to start..." -ForegroundColor Yellow
Start-Sleep -Seconds 30

Write-Host "`n🎉 PROJECT IS STARTING!" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "🌐 OPEN YOUR BROWSER AND GO TO:" -ForegroundColor Yellow
Write-Host "   http://localhost:4200" -ForegroundColor White
Write-Host "=========================================" -ForegroundColor Cyan

Write-Host "`n📋 Server URLs:" -ForegroundColor Yellow
Write-Host "   Frontend: http://localhost:4200" -ForegroundColor White
Write-Host "   Backend:  http://localhost:3000" -ForegroundColor White

Write-Host "`n🚀 What You'll See:" -ForegroundColor Yellow
Write-Host "   ✅ Welcome Page with Widget Builder Info" -ForegroundColor White
Write-Host "   ✅ Button to Open Widget Builder" -ForegroundColor White
Write-Host "   ✅ Server Information" -ForegroundColor White

Write-Host "`n⚠️  If the page doesn't load:" -ForegroundColor Yellow
Write-Host "   1. Wait 30-60 seconds for servers to start" -ForegroundColor White
Write-Host "   2. Check the terminal windows for any errors" -ForegroundColor White
Write-Host "   3. Make sure ports 3000 and 4200 are not in use" -ForegroundColor White

Write-Host "`n🎯 Quick Access:" -ForegroundColor Yellow
Write-Host "   Just open: http://localhost:4200" -ForegroundColor White

Write-Host "`nPress Enter to exit..." -ForegroundColor Yellow
Read-Host 