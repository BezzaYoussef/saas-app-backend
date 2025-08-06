# 🔧 Quick Fix for Port Conflict

## **❌ The Problem:**
```
Error: listen EADDRINUSE: address already in use :::3000
```

## **✅ The Solution:**

### **Step 1: Kill All Node Processes**
Open PowerShell and run:
```powershell
taskkill /F /IM node.exe
```

### **Step 2: Start MongoDB**
```powershell
# Create data directory
if (!(Test-Path "C:\data\db")) {
    New-Item -ItemType Directory -Path "C:\data\db" -Force
}

# Start MongoDB
Start-Process -FilePath "C:\Program Files\MongoDB\Server\8.0\bin\mongod.exe" -ArgumentList "--port", "27018", "--dbpath", "C:\data\db" -WindowStyle Hidden
```

### **Step 3: Start Backend**
```powershell
cd saas-app-backend
npm start
```

### **Step 4: Start Frontend (in new terminal)**
```powershell
cd saas-app-frontend
npm start
```

## **🎯 Expected Results:**
- **MongoDB**: Running on port 27018
- **Backend**: Running on port 3000
- **Frontend**: Running on port 4200

## **🌐 Access the Application:**
Open browser and go to: `http://localhost:4200`

## **🔧 If Still Having Issues:**
1. **Check if ports are free:**
   ```powershell
   netstat -ano | findstr ":3000\|:4200\|:27018"
   ```

2. **Kill specific processes:**
   ```powershell
   # Find process ID
   netstat -ano | findstr :3000
   
   # Kill by PID (replace XXXX with actual PID)
   taskkill /PID XXXX /F
   ```

3. **Restart everything:**
   ```powershell
   # Kill all Node processes
   taskkill /F /IM node.exe
   
   # Wait 5 seconds
   Start-Sleep -Seconds 5
   
   # Start services one by one
   ```

## **✅ Success Indicators:**
- No "EADDRINUSE" errors
- All three services running
- Can access `http://localhost:4200`
- Widget builder opens without errors 