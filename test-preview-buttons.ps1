Write-Host "🎯 Testing Preview Buttons" -ForegroundColor Green
Write-Host "=========================" -ForegroundColor Cyan

Write-Host "`nStep 1: Starting Frontend..." -ForegroundColor Yellow
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

Write-Host "`n🎯 PREVIEW BUTTONS READY!" -ForegroundColor Green
Write-Host "=========================" -ForegroundColor Cyan
Write-Host "🌐 OPEN YOUR BROWSER AND GO TO:" -ForegroundColor Yellow
Write-Host "   http://localhost:4200" -ForegroundColor White
Write-Host "=========================" -ForegroundColor Cyan

Write-Host "`n🎯 Preview Button Features:" -ForegroundColor Yellow
Write-Host "=========================" -ForegroundColor Cyan
Write-Host "   ✅ Desktop button - Full width preview" -ForegroundColor White
Write-Host "   ✅ Tablet button - 768px width with tablet frame" -ForegroundColor White
Write-Host "   ✅ Mobile button - 375px width with phone frame" -ForegroundColor White
Write-Host "   ✅ Active state highlighting" -ForegroundColor White
Write-Host "   ✅ Smooth transitions" -ForegroundColor White
Write-Host "   ✅ Real-time preview updates" -ForegroundColor White

Write-Host "`n📋 How to Test Preview Buttons:" -ForegroundColor Yellow
Write-Host "=================================" -ForegroundColor Cyan

Write-Host "`nStep 1: Load Content" -ForegroundColor Green
Write-Host "   1. Open http://localhost:4200" -ForegroundColor White
Write-Host "   2. Click '🚀 Launch Widget Builder'" -ForegroundColor White
Write-Host "   3. Drag a component to canvas (or use demo buttons)" -ForegroundColor White
Write-Host "   4. Switch to 'Preview' tab" -ForegroundColor White

Write-Host "`nStep 2: Test Preview Buttons" -ForegroundColor Green
Write-Host "   1. Click 'Desktop' button" -ForegroundColor White
Write-Host "      - Should show full-width preview" -ForegroundColor White
Write-Host "      - Button should be highlighted" -ForegroundColor White
Write-Host "   2. Click 'Tablet' button" -ForegroundColor White
Write-Host "      - Should show 768px width with tablet frame" -ForegroundColor White
Write-Host "      - Should have tablet-like border" -ForegroundColor White
Write-Host "   3. Click 'Mobile' button" -ForegroundColor White
Write-Host "      - Should show 375px width with phone frame" -ForegroundColor White
Write-Host "      - Should have phone-like border" -ForegroundColor White

Write-Host "`nStep 3: Test Interactions" -ForegroundColor Green
Write-Host "   1. Click buttons multiple times" -ForegroundColor White
Write-Host "   2. Verify only one button is active at a time" -ForegroundColor White
Write-Host "   3. Check console for mode change logs" -ForegroundColor White
Write-Host "   4. Test with different content" -ForegroundColor White

Write-Host "`n🎯 Expected Results:" -ForegroundColor Yellow
Write-Host "===================" -ForegroundColor Cyan

Write-Host "`n✅ Desktop Mode:" -ForegroundColor Green
Write-Host "   - Full-width preview container" -ForegroundColor White
Write-Host "   - No special borders or frames" -ForegroundColor White
Write-Host "   - Content fills entire preview area" -ForegroundColor White

Write-Host "`n✅ Tablet Mode:" -ForegroundColor Green
Write-Host "   - 768px max-width preview" -ForegroundColor White
Write-Host "   - Dark border around preview" -ForegroundColor White
Write-Host "   - Rounded corners like a tablet" -ForegroundColor White
Write-Host "   - Centered in preview area" -ForegroundColor White

Write-Host "`n✅ Mobile Mode:" -ForegroundColor Green
Write-Host "   - 375px max-width preview" -ForegroundColor White
Write-Host "   - Dark border around preview" -ForegroundColor White
Write-Host "   - Rounded corners like a phone" -ForegroundColor White
Write-Host "   - Centered in preview area" -ForegroundColor White

Write-Host "`n🎯 Button States:" -ForegroundColor Yellow
Write-Host "=================" -ForegroundColor Cyan
Write-Host "   ✅ Inactive: White background, gray text" -ForegroundColor White
Write-Host "   ✅ Hover: Light gray background" -ForegroundColor White
Write-Host "   ✅ Active: Blue background, white text" -ForegroundColor White
Write-Host "   ✅ Only one button active at a time" -ForegroundColor White

Write-Host "`n🎯 Console Logs:" -ForegroundColor Yellow
Write-Host "===============" -ForegroundColor Cyan
Write-Host "   ✅ 'Setting preview mode: desktop'" -ForegroundColor White
Write-Host "   ✅ 'Setting preview mode: tablet'" -ForegroundColor White
Write-Host "   ✅ 'Setting preview mode: mobile'" -ForegroundColor White
Write-Host "   ✅ 'Preview mode set to Desktop/Tablet/Mobile'" -ForegroundColor White

Write-Host "`n⚠️  Troubleshooting:" -ForegroundColor Yellow
Write-Host "==================" -ForegroundColor Cyan

Write-Host "`n❌ If buttons don't respond:" -ForegroundColor Red
Write-Host "   1. Check browser console (F12) for errors" -ForegroundColor White
Write-Host "   2. Make sure you're in the Preview tab" -ForegroundColor White
Write-Host "   3. Try refreshing the page" -ForegroundColor White
Write-Host "   4. Check if content is loaded in preview" -ForegroundColor White

Write-Host "`n❌ If preview doesn't change:" -ForegroundColor Red
Write-Host "   1. Check if preview container exists" -ForegroundColor White
Write-Host "   2. Verify CSS classes are being applied" -ForegroundColor White
Write-Host "   3. Check console for 'Preview container not found'" -ForegroundColor White

Write-Host "`n❌ If buttons don't highlight:" -ForegroundColor Red
Write-Host "   1. Check if event handlers are working" -ForegroundColor White
Write-Host "   2. Verify CSS classes are being toggled" -ForegroundColor White
Write-Host "   3. Check for JavaScript errors" -ForegroundColor White

Write-Host "`n🎯 Quick Test:" -ForegroundColor Yellow
Write-Host "==============" -ForegroundColor Cyan
Write-Host "   1. Open http://localhost:4200" -ForegroundColor White
Write-Host "   2. Launch Widget Builder" -ForegroundColor White
Write-Host "   3. Click '💰 Pricing Packages' button" -ForegroundColor White
Write-Host "   4. Switch to Preview tab" -ForegroundColor White
Write-Host "   5. Test Desktop, Tablet, Mobile buttons" -ForegroundColor White

Write-Host "`nPress Enter to exit..." -ForegroundColor Yellow
Read-Host 