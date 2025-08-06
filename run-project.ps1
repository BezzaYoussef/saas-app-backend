Write-Host "Starting SaaS Application Setup..." -ForegroundColor Green

Write-Host "`nStep 1: Installing Backend Dependencies..." -ForegroundColor Yellow
Set-Location "saas-app-backend"
npm install --ignore-scripts
if ($LASTEXITCODE -ne 0) {
    Write-Host "Failed to install backend dependencies" -ForegroundColor Red
    Read-Host "Press Enter to continue"
    exit 1
}

Write-Host "`nStep 2: Installing Frontend Dependencies..." -ForegroundColor Yellow
Set-Location "..\saas-app-frontend"
npm install --ignore-scripts
if ($LASTEXITCODE -ne 0) {
    Write-Host "Failed to install frontend dependencies" -ForegroundColor Red
    Read-Host "Press Enter to continue"
    exit 1
}

Write-Host "`nStep 3: MongoDB Setup..." -ForegroundColor Yellow
Write-Host "Note: Make sure MongoDB is installed and running on port 27017" -ForegroundColor Cyan
Write-Host "You can download MongoDB from: https://www.mongodb.com/try/download/community" -ForegroundColor Cyan

Write-Host "`nStep 4: Starting Backend Server..." -ForegroundColor Yellow
Set-Location "..\saas-app-backend"
Start-Process powershell -ArgumentList "-NoExit", "-Command", "npm run start:dev" -WindowStyle Normal

Write-Host "`nStep 5: Starting Frontend Server..." -ForegroundColor Yellow
Set-Location "..\saas-app-frontend"
Start-Process powershell -ArgumentList "-NoExit", "-Command", "npm start" -WindowStyle Normal

Write-Host "`nProject is starting up!" -ForegroundColor Green
Write-Host "Backend will be available at: http://localhost:3000" -ForegroundColor Cyan
Write-Host "Frontend will be available at: http://localhost:4200" -ForegroundColor Cyan
Write-Host "`nPress Enter to exit this setup script..." -ForegroundColor Yellow
Read-Host 