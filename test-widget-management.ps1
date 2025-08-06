Write-Host "🎯 Testing Widget Management (Edit & Delete)" -ForegroundColor Green
Write-Host "===========================================" -ForegroundColor Cyan

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

Write-Host "`n🎯 WIDGET MANAGEMENT READY!" -ForegroundColor Green
Write-Host "===========================" -ForegroundColor Cyan
Write-Host "🌐 OPEN YOUR BROWSER AND GO TO:" -ForegroundColor Yellow
Write-Host "   http://localhost:4200" -ForegroundColor White
Write-Host "===========================" -ForegroundColor Cyan

Write-Host "`n🎯 Widget Management Features:" -ForegroundColor Yellow
Write-Host "=============================" -ForegroundColor Cyan
Write-Host "   ✅ Edit Widget - Load widget into editor" -ForegroundColor White
Write-Host "   ✅ Delete Widget - Remove widget from database" -ForegroundColor White
Write-Host "   ✅ Update Widget - Save changes to existing widget" -ForegroundColor White
Write-Host "   ✅ Cancel Edit - Discard changes and exit edit mode" -ForegroundColor White
Write-Host "   ✅ Widget Cards - Visual display of saved widgets" -ForegroundColor White
Write-Host "   ✅ Edit Mode Indicator - Shows when editing" -ForegroundColor White

Write-Host "`n📋 How to Test Widget Management:" -ForegroundColor Yellow
Write-Host "=================================" -ForegroundColor Cyan

Write-Host "`nStep 1: Create Test Widgets" -ForegroundColor Green
Write-Host "   1. Open http://localhost:4200" -ForegroundColor White
Write-Host "   2. Click '🚀 Launch Widget Builder'" -ForegroundColor White
Write-Host "   3. Drag a component to canvas (e.g., Button)" -ForegroundColor White
Write-Host "   4. Set widget name: 'Test Widget 1'" -ForegroundColor White
Write-Host "   5. Click 'Save Widget'" -ForegroundColor White
Write-Host "   6. Repeat for 'Test Widget 2' with different content" -ForegroundColor White

Write-Host "`nStep 2: Test Edit Functionality" -ForegroundColor Green
Write-Host "   1. Go to 'Database' tab" -ForegroundColor White
Write-Host "   2. Click the 'Edit' button (pencil icon) on a widget" -ForegroundColor White
Write-Host "   3. Verify edit mode indicator appears" -ForegroundColor White
Write-Host "   4. Verify widget data loads into editor" -ForegroundColor White
Write-Host "   5. Modify the widget content" -ForegroundColor White
Write-Host "   6. Click 'Update Widget' to save changes" -ForegroundColor White
Write-Host "   7. Verify changes are saved" -ForegroundColor White

Write-Host "`nStep 3: Test Cancel Edit" -ForegroundColor Green
Write-Host "   1. Click 'Edit' on another widget" -ForegroundColor White
Write-Host "   2. Make some changes to the content" -ForegroundColor White
Write-Host "   3. Click 'Cancel' button" -ForegroundColor White
Write-Host "   4. Verify changes are discarded" -ForegroundColor White
Write-Host "   5. Verify edit mode is exited" -ForegroundColor White

Write-Host "`nStep 4: Test Delete Functionality" -ForegroundColor Green
Write-Host "   1. Go to 'Database' tab" -ForegroundColor White
Write-Host "   2. Click the 'Delete' button (trash icon) on a widget" -ForegroundColor White
Write-Host "   3. Confirm deletion in the dialog" -ForegroundColor White
Write-Host "   4. Verify widget is removed from the list" -ForegroundColor White
Write-Host "   5. Verify widget is deleted from database" -ForegroundColor White

Write-Host "`n🎯 Expected Results:" -ForegroundColor Yellow
Write-Host "===================" -ForegroundColor Cyan

Write-Host "`n✅ Edit Widget:" -ForegroundColor Green
Write-Host "   - Edit button loads widget into editor" -ForegroundColor White
Write-Host "   - Edit mode indicator shows 'Editing: [Widget Name]'" -ForegroundColor White
Write-Host "   - Widget name, category, HTML, CSS, JS are loaded" -ForegroundColor White
Write-Host "   - 'Update Widget' and 'Cancel' buttons appear" -ForegroundColor White
Write-Host "   - Changes are saved when 'Update Widget' is clicked" -ForegroundColor White

Write-Host "`n✅ Delete Widget:" -ForegroundColor Green
Write-Host "   - Delete button shows confirmation dialog" -ForegroundColor White
Write-Host "   - Widget is removed from the list after confirmation" -ForegroundColor White
Write-Host "   - Widget is deleted from the database" -ForegroundColor White
Write-Host "   - Success message is shown" -ForegroundColor White

Write-Host "`n✅ Widget Cards:" -ForegroundColor Green
Write-Host "   - Each widget displays in a card format" -ForegroundColor White
Write-Host "   - Widget name, category, status, and creation date shown" -ForegroundColor White
Write-Host "   - Preview of widget content is displayed" -ForegroundColor White
Write-Host "   - Edit and Delete buttons are accessible" -ForegroundColor White

Write-Host "`n✅ Edit Mode UI:" -ForegroundColor Green
Write-Host "   - Orange edit mode indicator in header" -ForegroundColor White
Write-Host "   - 'Update Widget' button (green)" -ForegroundColor White
Write-Host "   - 'Cancel' button (gray)" -ForegroundColor White
Write-Host "   - Normal save/clear buttons hidden during edit" -ForegroundColor White

Write-Host "`n🎯 Console Logs:" -ForegroundColor Yellow
Write-Host "===============" -ForegroundColor Cyan
Write-Host "   ✅ 'Editing widget: [name]'" -ForegroundColor White
Write-Host "   ✅ 'Updating widget: [id]'" -ForegroundColor White
Write-Host "   ✅ 'Widget updated successfully'" -ForegroundColor White
Write-Host "   ✅ 'Deleting widget: [id]'" -ForegroundColor White
Write-Host "   ✅ 'Widget deleted successfully'" -ForegroundColor White
Write-Host "   ✅ 'Canceling edit mode'" -ForegroundColor White

Write-Host "`n⚠️  Troubleshooting:" -ForegroundColor Yellow
Write-Host "==================" -ForegroundColor Cyan

Write-Host "`n❌ If edit doesn't work:" -ForegroundColor Red
Write-Host "   1. Check browser console (F12) for errors" -ForegroundColor White
Write-Host "   2. Verify backend is running on port 3000" -ForegroundColor White
Write-Host "   3. Check if widget data is properly loaded" -ForegroundColor White
Write-Host "   4. Verify edit mode indicator appears" -ForegroundColor White

Write-Host "`n❌ If delete doesn't work:" -ForegroundColor Red
Write-Host "   1. Check browser console for network errors" -ForegroundColor White
Write-Host "   2. Verify confirmation dialog appears" -ForegroundColor White
Write-Host "   3. Check if widget is actually removed from list" -ForegroundColor White
Write-Host "   4. Verify backend delete endpoint is working" -ForegroundColor White

Write-Host "`n❌ If widget cards don't show:" -ForegroundColor Red
Write-Host "   1. Check if widgets are saved to database" -ForegroundColor White
Write-Host "   2. Verify 'Load Widgets' button works" -ForegroundColor White
Write-Host "   3. Check network tab for API calls" -ForegroundColor White
Write-Host "   4. Verify backend is returning widget data" -ForegroundColor White

Write-Host "`n🎯 Quick Test Sequence:" -ForegroundColor Yellow
Write-Host "=======================" -ForegroundColor Cyan
Write-Host "   1. Create 2-3 test widgets with different names" -ForegroundColor White
Write-Host "   2. Test edit on first widget - modify content and save" -ForegroundColor White
Write-Host "   3. Test cancel edit on second widget - make changes and cancel" -ForegroundColor White
Write-Host "   4. Test delete on third widget - confirm deletion" -ForegroundColor White
Write-Host "   5. Verify all operations work correctly" -ForegroundColor White

Write-Host "`nPress Enter to exit..." -ForegroundColor Yellow
Read-Host 