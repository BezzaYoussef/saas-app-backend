Write-Host "🔗 Testing Backend Integration" -ForegroundColor Green
Write-Host "=============================" -ForegroundColor Cyan

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

Write-Host "`n🔗 BACKEND INTEGRATION READY!" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "🌐 OPEN YOUR BROWSER AND GO TO:" -ForegroundColor Yellow
Write-Host "   http://localhost:4200" -ForegroundColor White
Write-Host "=========================================" -ForegroundColor Cyan

Write-Host "`n📋 How to Test Backend Integration:" -ForegroundColor Yellow
Write-Host "   1. Click '🎨 Open Widget Builder' button" -ForegroundColor White
Write-Host "   2. Click '💰 Load Pricing Example' button" -ForegroundColor White
Write-Host "   3. Click '💾 Save Widget' button" -ForegroundColor White
Write-Host "   4. Check console for save confirmation" -ForegroundColor White
Write-Host "   5. Click '📥 Load from DB' button" -ForegroundColor White
Write-Host "   6. Click '📊 Widget Stats' button" -ForegroundColor White

Write-Host "`n🚀 Backend Integration Features:" -ForegroundColor Yellow
Write-Host "   ✅ Save widgets to MongoDB database" -ForegroundColor White
Write-Host "   ✅ Load widgets from database" -ForegroundColor White
Write-Host "   ✅ Get widget statistics" -ForegroundColor White
Write-Host "   ✅ Data validation" -ForegroundColor White
Write-Host "   ✅ Error handling" -ForegroundColor White
Write-Host "   ✅ Real-time preview updates" -ForegroundColor White

Write-Host "`n💡 Backend API Endpoints:" -ForegroundColor Yellow
Write-Host "   POST /api/widgets - Save new widget" -ForegroundColor White
Write-Host "   GET /api/widgets - Get all widgets" -ForegroundColor White
Write-Host "   GET /api/widgets/stats - Get widget statistics" -ForegroundColor White
Write-Host "   PUT /api/widgets/:id - Update widget" -ForegroundColor White
Write-Host "   DELETE /api/widgets/:id - Delete widget" -ForegroundColor White

Write-Host "`n📊 Expected Results:" -ForegroundColor Yellow
Write-Host "   💾 Save: Should show success message with widget ID" -ForegroundColor White
Write-Host "   📥 Load: Should load widget from database" -ForegroundColor White
Write-Host "   📊 Stats: Should show widget statistics" -ForegroundColor White
Write-Host "   👁️ Preview: Should update when loading from DB" -ForegroundColor White

Write-Host "`n⚠️  If it doesn't work:" -ForegroundColor Yellow
Write-Host "   1. Make sure backend is running on http://localhost:3000" -ForegroundColor White
Write-Host "   2. Check browser console (F12) for errors" -ForegroundColor White
Write-Host "   3. Check backend console for API errors" -ForegroundColor White
Write-Host "   4. Make sure MongoDB is running on port 27018" -ForegroundColor White

Write-Host "`n🎯 Quick Access:" -ForegroundColor Yellow
Write-Host "   Frontend: http://localhost:4200" -ForegroundColor White
Write-Host "   Backend API: http://localhost:3000" -ForegroundColor White

Write-Host "`nPress Enter to exit..." -ForegroundColor Yellow
Read-Host 