Write-Host "💰 Testing Pricing Widget Example" -ForegroundColor Green
Write-Host "=================================" -ForegroundColor Cyan

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

Write-Host "`n💰 PRICING WIDGET EXAMPLE READY!" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "🌐 OPEN YOUR BROWSER AND GO TO:" -ForegroundColor Yellow
Write-Host "   http://localhost:4200" -ForegroundColor White
Write-Host "=========================================" -ForegroundColor Cyan

Write-Host "`n📋 How to Test the Pricing Widget:" -ForegroundColor Yellow
Write-Host "   1. Click '🎨 Open Widget Builder' button" -ForegroundColor White
Write-Host "   2. Click '💰 Load Pricing Example' button" -ForegroundColor White
Write-Host "   3. Switch to 'Code' tab to see the pricing code" -ForegroundColor White
Write-Host "   4. Switch to 'Preview' tab to see the pricing widget" -ForegroundColor White
Write-Host "   5. Test the pricing buttons and interactions" -ForegroundColor White

Write-Host "`n🚀 Pricing Widget Features:" -ForegroundColor Yellow
Write-Host "   ✅ 3 Pricing Plans: Starter, Professional, Enterprise" -ForegroundColor White
Write-Host "   ✅ Beautiful gradient background" -ForegroundColor White
Write-Host "   ✅ Hover effects and animations" -ForegroundColor White
Write-Host "   ✅ Responsive design (mobile-friendly)" -ForegroundColor White
Write-Host "   ✅ Interactive buttons with loading states" -ForegroundColor White
Write-Host "   ✅ Font Awesome icons" -ForegroundColor White
Write-Host "   ✅ 'Most Popular' badge on Professional plan" -ForegroundColor White
Write-Host "   ✅ Analytics tracking integration" -ForegroundColor White

Write-Host "`n💡 Pricing Plans Included:" -ForegroundColor Yellow
Write-Host "   💰 Starter: $29/month - 5 Projects, 10GB Storage" -ForegroundColor White
Write-Host "   💰 Professional: $79/month - 25 Projects, 100GB Storage" -ForegroundColor White
Write-Host "   💰 Enterprise: $199/month - Unlimited Projects, 1TB Storage" -ForegroundColor White

Write-Host "`n⚠️  If it doesn't work:" -ForegroundColor Yellow
Write-Host "   1. Wait 1-2 minutes for Angular compilation" -ForegroundColor White
Write-Host "   2. Check browser console (F12) for errors" -ForegroundColor White
Write-Host "   3. Make sure port 4200 is not in use" -ForegroundColor White
Write-Host "   4. Try refreshing the browser page" -ForegroundColor White

Write-Host "`n🎯 Quick Access:" -ForegroundColor Yellow
Write-Host "   Just open: http://localhost:4200" -ForegroundColor White

Write-Host "`nPress Enter to exit..." -ForegroundColor Yellow
Read-Host 