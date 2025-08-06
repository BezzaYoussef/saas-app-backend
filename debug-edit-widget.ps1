Write-Host "🔍 Debugging Edit Widget Issue" -ForegroundColor Green
Write-Host "=============================" -ForegroundColor Cyan

Write-Host "`n🎯 Quick Test Steps:" -ForegroundColor Yellow
Write-Host "===================" -ForegroundColor Cyan

Write-Host "`nStep 1: Start Services" -ForegroundColor Green
Write-Host "   1. Open PowerShell as Administrator" -ForegroundColor White
Write-Host "   2. Navigate to saas-app-backend" -ForegroundColor White
Write-Host "   3. Run: npm start" -ForegroundColor White
Write-Host "   4. Open new PowerShell window" -ForegroundColor White
Write-Host "   5. Navigate to saas-app-frontend" -ForegroundColor White
Write-Host "   6. Run: npm start" -ForegroundColor White

Write-Host "`nStep 2: Test Edit Widget" -ForegroundColor Green
Write-Host "   1. Open http://localhost:4200" -ForegroundColor White
Write-Host "   2. Click 'Launch Widget Builder'" -ForegroundColor White
Write-Host "   3. Create a test widget with name and content" -ForegroundColor White
Write-Host "   4. Save the widget" -ForegroundColor White
Write-Host "   5. Go to Database tab" -ForegroundColor White
Write-Host "   6. Click Edit button on a widget" -ForegroundColor White

Write-Host "`nStep 3: Check Console" -ForegroundColor Green
Write-Host "   1. Open browser Developer Tools (F12)" -ForegroundColor White
Write-Host "   2. Go to Console tab" -ForegroundColor White
Write-Host "   3. Look for debug messages starting with '==='" -ForegroundColor White
Write-Host "   4. Check for any error messages" -ForegroundColor White

Write-Host "`n🎯 Common Issues & Solutions:" -ForegroundColor Yellow
Write-Host "=============================" -ForegroundColor Cyan

Write-Host "`n❌ Issue: 'Invalid widget data' error" -ForegroundColor Red
Write-Host "   Solution: Check if backend is running on port 3000" -ForegroundColor White
Write-Host "   Solution: Check if MongoDB is running on port 27018" -ForegroundColor White
Write-Host "   Solution: Verify widget has valid ID and data" -ForegroundColor White

Write-Host "`n❌ Issue: Edit button doesn't respond" -ForegroundColor Red
Write-Host "   Solution: Check browser console for JavaScript errors" -ForegroundColor White
Write-Host "   Solution: Verify widget object structure" -ForegroundColor White
Write-Host "   Solution: Try refreshing the page" -ForegroundColor White

Write-Host "`n❌ Issue: Widget data doesn't load" -ForegroundColor Red
Write-Host "   Solution: Check if widget has html/css/js properties" -ForegroundColor White
Write-Host "   Solution: Verify backend API is returning correct data" -ForegroundColor White
Write-Host "   Solution: Check network tab for failed requests" -ForegroundColor White

Write-Host "`n🎯 Debug Commands:" -ForegroundColor Yellow
Write-Host "=================" -ForegroundColor Cyan

Write-Host "`nIn Browser Console (F12):" -ForegroundColor Green
Write-Host "   console.log('Testing edit widget')" -ForegroundColor White
Write-Host "   console.log('Widgets:', widgets)" -ForegroundColor White
Write-Host "   console.log('Editing widget:', editingWidget)" -ForegroundColor White

Write-Host "`nCheck Backend Status:" -ForegroundColor Green
Write-Host "   curl http://localhost:3000/api/widgets" -ForegroundColor White
Write-Host "   netstat -ano | findstr :3000" -ForegroundColor White

Write-Host "`nCheck MongoDB Status:" -ForegroundColor Green
Write-Host "   netstat -ano | findstr :27018" -ForegroundColor White
Write-Host "   mongosh --port 27018" -ForegroundColor White

Write-Host "`nPress Enter to exit..." -ForegroundColor Yellow
Read-Host 