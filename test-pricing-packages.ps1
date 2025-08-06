Write-Host "💰 Testing Pricing Packages Widget" -ForegroundColor Green
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

Write-Host "`n💰 PRICING PACKAGES WIDGET READY!" -ForegroundColor Green
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "🌐 OPEN YOUR BROWSER AND GO TO:" -ForegroundColor Yellow
Write-Host "   http://localhost:4200" -ForegroundColor White
Write-Host "=====================================" -ForegroundColor Cyan

Write-Host "`n💰 Pricing Packages Features:" -ForegroundColor Yellow
Write-Host "   ✅ Three pricing tiers (Starter, Professional, Enterprise)" -ForegroundColor White
Write-Host "   ✅ Monthly/Yearly billing toggle with 20% savings" -ForegroundColor White
Write-Host "   ✅ Interactive pricing cards with hover effects" -ForegroundColor White
Write-Host "   ✅ 'Most Popular' badge on Professional plan" -ForegroundColor White
Write-Host "   ✅ Responsive design for mobile devices" -ForegroundColor White
Write-Host "   ✅ Beautiful gradient background" -ForegroundColor White
Write-Host "   ✅ Glassmorphism design effects" -ForegroundColor White
Write-Host "   ✅ Interactive buttons with click handlers" -ForegroundColor White

Write-Host "`n📋 How to Test the Pricing Packages Widget:" -ForegroundColor Yellow
Write-Host "   1. Open http://localhost:4200" -ForegroundColor White
Write-Host "   2. Click '💰 Pricing Packages' button on welcome page" -ForegroundColor White
Write-Host "   3. Or click '💰 Pricing Packages' button in modal" -ForegroundColor White
Write-Host "   4. Widget should load in preview tab" -ForegroundColor White
Write-Host "   5. Test the monthly/yearly toggle switch" -ForegroundColor White
Write-Host "   6. Test clicking on different plan buttons" -ForegroundColor White
Write-Host "   7. Test the contact sales link" -ForegroundColor White

Write-Host "`n🎯 Expected Results:" -ForegroundColor Yellow
Write-Host "   💰 Beautiful pricing widget with 3 plans displayed" -ForegroundColor White
Write-Host "   💰 Professional plan highlighted as 'Most Popular'" -ForegroundColor White
Write-Host "   💰 Monthly/Yearly toggle switches prices" -ForegroundColor White
Write-Host "   💰 Interactive buttons show alerts when clicked" -ForegroundColor White
Write-Host "   💰 Hover effects on pricing cards" -ForegroundColor White
Write-Host "   💰 Responsive design works on different screen sizes" -ForegroundColor White
Write-Host "   💰 Console shows interaction logs" -ForegroundColor White

Write-Host "`n🎯 Testing Steps:" -ForegroundColor Yellow
Write-Host "   1. Load the pricing packages widget" -ForegroundColor White
Write-Host "   2. Check that all 3 plans are visible" -ForegroundColor White
Write-Host "   3. Test the billing toggle (Monthly ↔ Yearly)" -ForegroundColor White
Write-Host "   4. Click 'Get Started' on Starter plan" -ForegroundColor White
Write-Host "   5. Click 'Get Started' on Professional plan" -ForegroundColor White
Write-Host "   6. Click 'Contact Sales' on Enterprise plan" -ForegroundColor White
Write-Host "   7. Click 'Contact our sales team' link" -ForegroundColor White
Write-Host "   8. Hover over pricing cards to see effects" -ForegroundColor White
Write-Host "   9. Check browser console for interaction logs" -ForegroundColor White

Write-Host "`n💰 Pricing Details:" -ForegroundColor Yellow
Write-Host "   Starter: $29/month ($23/yearly)" -ForegroundColor White
Write-Host "   Professional: $79/month ($63/yearly) - Most Popular" -ForegroundColor White
Write-Host "   Enterprise: $199/month ($159/yearly)" -ForegroundColor White
Write-Host "   Yearly plans save 20%" -ForegroundColor White

Write-Host "`n🎨 Design Features:" -ForegroundColor Yellow
Write-Host "   🎨 Beautiful gradient background" -ForegroundColor White
Write-Host "   🎨 Glassmorphism card effects" -ForegroundColor White
Write-Host "   🎨 Smooth hover animations" -ForegroundColor White
Write-Host "   🎨 Professional typography" -ForegroundColor White
Write-Host "   🎨 Responsive grid layout" -ForegroundColor White
Write-Host "   🎨 Interactive toggle switch" -ForegroundColor White
Write-Host "   🎨 Modern button styling" -ForegroundColor White

Write-Host "`n⚠️  If widget doesn't load properly:" -ForegroundColor Yellow
Write-Host "   1. Check browser console (F12) for errors" -ForegroundColor White
Write-Host "   2. Try refreshing the page" -ForegroundColor White
Write-Host "   3. Check if preview tab is active" -ForegroundColor White
Write-Host "   4. Verify that all content is visible" -ForegroundColor White
Write-Host "   5. Check if JavaScript functions are working" -ForegroundColor White

Write-Host "`n🎯 Quick Access:" -ForegroundColor Yellow
Write-Host "   Just open: http://localhost:4200" -ForegroundColor White

Write-Host "`nPress Enter to exit..." -ForegroundColor Yellow
Read-Host 