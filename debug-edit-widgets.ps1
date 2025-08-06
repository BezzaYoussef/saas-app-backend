Write-Host "🐛 Debugging Widget Edit Functionality" -ForegroundColor Red
Write-Host "=====================================" -ForegroundColor Cyan

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

Write-Host "`n🐛 DEBUG WIDGET EDIT FUNCTIONALITY" -ForegroundColor Red
Write-Host "=================================" -ForegroundColor Cyan
Write-Host "🌐 OPEN YOUR BROWSER AND GO TO:" -ForegroundColor Yellow
Write-Host "   http://localhost:4200" -ForegroundColor White
Write-Host "=================================" -ForegroundColor Cyan

Write-Host "`n🐛 Debug Steps:" -ForegroundColor Red
Write-Host "==============" -ForegroundColor Cyan

Write-Host "`nStep 1: Create Test Widgets" -ForegroundColor Green
Write-Host "   1. Open http://localhost:4200" -ForegroundColor White
Write-Host "   2. Click '🚀 Launch Widget Builder'" -ForegroundColor White
Write-Host "   3. Drag a component to canvas" -ForegroundColor White
Write-Host "   4. Set widget name: 'Test Widget 1'" -ForegroundColor White
Write-Host "   5. Click 'Save Widget'" -ForegroundColor White
Write-Host "   6. Repeat for 'Test Widget 2'" -ForegroundColor White

Write-Host "`nStep 2: Debug Edit Functionality" -ForegroundColor Green
Write-Host "   1. Go to 'Database' tab" -ForegroundColor White
Write-Host "   2. Click 'Debug Edit' button" -ForegroundColor White
Write-Host "   3. Check browser console (F12) for logs" -ForegroundColor White
Write-Host "   4. Verify edit mode indicator appears" -ForegroundColor White
Write-Host "   5. Check if widget data loads into editor" -ForegroundColor White

Write-Host "`nStep 3: Test Manual Edit" -ForegroundColor Green
Write-Host "   1. Click the 'Edit' button (pencil icon) on a widget card" -ForegroundColor White
Write-Host "   2. Check console for 'Editing widget:' log" -ForegroundColor White
Write-Host "   3. Verify widget data is loaded" -ForegroundColor White
Write-Host "   4. Check if edit mode indicator shows" -ForegroundColor White
Write-Host "   5. Verify 'Update Widget' and 'Cancel' buttons appear" -ForegroundColor White

Write-Host "`nStep 4: Test Edit Mode" -ForegroundColor Green
Write-Host "   1. Modify the widget content in the editor" -ForegroundColor White
Write-Host "   2. Click 'Update Widget' button" -ForegroundColor White
Write-Host "   3. Check console for 'Updating widget:' log" -ForegroundColor White
Write-Host "   4. Verify changes are saved" -ForegroundColor White
Write-Host "   5. Check if edit mode is exited" -ForegroundColor White

Write-Host "`n🎯 Expected Console Logs:" -ForegroundColor Yellow
Write-Host "=======================" -ForegroundColor Cyan
Write-Host "   ✅ 'Editing widget: [widget object]'" -ForegroundColor White
Write-Host "   ✅ 'Loaded widget data: [data object]'" -ForegroundColor White
Write-Host "   ✅ 'Updating widget: [id]'" -ForegroundColor White
Write-Host "   ✅ 'Widget updated successfully'" -ForegroundColor White

Write-Host "`n🎯 Expected UI Changes:" -ForegroundColor Yellow
Write-Host "=====================" -ForegroundColor Cyan
Write-Host "   ✅ Orange edit mode indicator in header" -ForegroundColor White
Write-Host "   ✅ 'Editing: [Widget Name]' display" -ForegroundColor White
Write-Host "   ✅ 'Update Widget' button (green)" -ForegroundColor White
Write-Host "   ✅ 'Cancel' button (gray)" -ForegroundColor White
Write-Host "   ✅ Widget data loaded into editor" -ForegroundColor White
Write-Host "   ✅ Preview updated with widget content" -ForegroundColor White

Write-Host "`n⚠️  Common Issues:" -ForegroundColor Yellow
Write-Host "================" -ForegroundColor Cyan

Write-Host "`n❌ If edit button doesn't respond:" -ForegroundColor Red
Write-Host "   1. Check browser console for JavaScript errors" -ForegroundColor White
Write-Host "   2. Verify button click event is firing" -ForegroundColor White
Write-Host "   3. Check if widget object has required properties" -ForegroundColor White
Write-Host "   4. Verify editWidget method is being called" -ForegroundColor White

Write-Host "`n❌ If widget data doesn't load:" -ForegroundColor Red
Write-Host "   1. Check if widget object has html, css, js properties" -ForegroundColor White
Write-Host "   2. Verify currentHtml, currentCss, currentJs are set" -ForegroundColor White
Write-Host "   3. Check if updateEditorContent() is called" -ForegroundColor White
Write-Host "   4. Verify activeTab is set to 'design'" -ForegroundColor White

Write-Host "`n❌ If edit mode indicator doesn't show:" -ForegroundColor Red
Write-Host "   1. Check if isEditing is set to true" -ForegroundColor White
Write-Host "   2. Verify editingWidget is set" -ForegroundColor White
Write-Host "   3. Check if edit mode indicator HTML is present" -ForegroundColor White
Write-Host "   4. Verify CSS styles are applied" -ForegroundColor White

Write-Host "`n❌ If update doesn't work:" -ForegroundColor Red
Write-Host "   1. Check if editingWidget.id exists" -ForegroundColor White
Write-Host "   2. Verify backend update endpoint is working" -ForegroundColor White
Write-Host "   3. Check network tab for API calls" -ForegroundColor White
Write-Host "   4. Verify widget data is properly formatted" -ForegroundColor White

Write-Host "`n🐛 Debug Commands:" -ForegroundColor Red
Write-Host "=================" -ForegroundColor Cyan
Write-Host "   - Open browser console (F12)" -ForegroundColor White
Write-Host "   - Type: console.log('Widgets:', window.angularComponentRef?.widgets)" -ForegroundColor White
Write-Host "   - Type: console.log('Is Editing:', window.angularComponentRef?.isEditing)" -ForegroundColor White
Write-Host "   - Type: console.log('Editing Widget:', window.angularComponentRef?.editingWidget)" -ForegroundColor White

Write-Host "`nPress Enter to exit..." -ForegroundColor Yellow
Read-Host 