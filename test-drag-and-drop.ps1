Write-Host "🎯 Testing Drag and Drop Functionality" -ForegroundColor Green
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

Write-Host "`n🎯 DRAG AND DROP READY!" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "🌐 OPEN YOUR BROWSER AND GO TO:" -ForegroundColor Yellow
Write-Host "   http://localhost:4200" -ForegroundColor White
Write-Host "=========================================" -ForegroundColor Cyan

Write-Host "`n📋 How to Test Drag and Drop:" -ForegroundColor Yellow
Write-Host "   1. Click '🎨 Open Widget Builder' button" -ForegroundColor White
Write-Host "   2. You'll see a '🎯 Drag Elements' panel on the left" -ForegroundColor White
Write-Host "   3. Try dragging elements from the panel to the editor" -ForegroundColor White
Write-Host "   4. Switch to '👁️ Preview' tab and drag elements there too" -ForegroundColor White
Write-Host "   5. Check the '💻 Code' tab to see the generated HTML/CSS/JS" -ForegroundColor White

Write-Host "`n🎯 Available Drag Elements:" -ForegroundColor Yellow
Write-Host "   🟦 Button - Interactive button with hover effects" -ForegroundColor White
Write-Host "   📝 Text - Simple text paragraph" -ForegroundColor White
Write-Host "   🖼️ Image - Placeholder image with styling" -ForegroundColor White
Write-Host "   📦 Container - Div container with background" -ForegroundColor White
Write-Host "   📋 Heading - H2 heading element" -ForegroundColor White
Write-Host "   🃏 Card - Card component with title and content" -ForegroundColor White
Write-Host "   📄 Form - Form with input and submit button" -ForegroundColor White

Write-Host "`n🚀 Drag and Drop Features:" -ForegroundColor Yellow
Write-Host "   ✅ Visual feedback during drag operations" -ForegroundColor White
Write-Host "   ✅ Drop zones highlight when dragging over" -ForegroundColor White
Write-Host "   ✅ Elements can be dropped in both editor and preview" -ForegroundColor White
Write-Host "   ✅ Automatic CSS and JS generation for each element" -ForegroundColor White
Write-Host "   ✅ Real-time preview updates" -ForegroundColor White
Write-Host "   ✅ Code view shows generated HTML/CSS/JS" -ForegroundColor White
Write-Host "   ✅ Responsive design for mobile devices" -ForegroundColor White

Write-Host "`n💡 Testing Tips:" -ForegroundColor Yellow
Write-Host "   1. Start with simple elements like 'Text' or 'Button'" -ForegroundColor White
Write-Host "   2. Try dragging multiple elements to build a widget" -ForegroundColor White
Write-Host "   3. Check the '💻 Code' tab to see generated code" -ForegroundColor White
Write-Host "   4. Use '👁️ Preview' tab to see the final result" -ForegroundColor White
Write-Host "   5. Try the '💰 Load Pricing Example' to see a complex widget" -ForegroundColor White

Write-Host "`n🎯 Expected Results:" -ForegroundColor Yellow
Write-Host "   🎯 Drag elements should have visual feedback" -ForegroundColor White
Write-Host "   🎯 Drop zones should highlight when dragging over" -ForegroundColor White
Write-Host "   🎯 Elements should appear in editor/preview after dropping" -ForegroundColor White
Write-Host "   🎯 Code should be generated in the Code tab" -ForegroundColor White
Write-Host "   🎯 Preview should update with new elements" -ForegroundColor White
Write-Host "   🎯 Interactive elements (buttons, forms) should work" -ForegroundColor White

Write-Host "`n⚠️  If drag and drop doesn't work:" -ForegroundColor Yellow
Write-Host "   1. Make sure you're on the '🎨 Design' tab" -ForegroundColor White
Write-Host "   2. Check browser console (F12) for errors" -ForegroundColor White
Write-Host "   3. Try refreshing the page" -ForegroundColor White
Write-Host "   4. Make sure you're dragging from the left panel" -ForegroundColor White
Write-Host "   5. Try dropping in the editor area (dashed border)" -ForegroundColor White

Write-Host "`n🎯 Quick Access:" -ForegroundColor Yellow
Write-Host "   Just open: http://localhost:4200" -ForegroundColor White

Write-Host "`nPress Enter to exit..." -ForegroundColor Yellow
Read-Host 