# Quick Start Guide

## Prerequisites
1. **MongoDB** - You need to install MongoDB first
2. **Node.js** - Should already be installed

## Step 1: Install MongoDB
Download and install MongoDB Community Server from: https://www.mongodb.com/try/download/community

## Step 2: Start MongoDB
After installation, MongoDB should start automatically as a Windows service.

## Step 3: Start Backend
Open a new PowerShell window and run:
```powershell
cd saas-app-backend
npm run start:dev
```

## Step 4: Start Frontend
Open another PowerShell window and run:
```powershell
cd saas-app-frontend
npm start
```

## Step 5: Access the Application
- Backend API: http://localhost:3000
- Frontend App: http://localhost:4200

## Alternative: Use the Batch Files
You can also run the provided batch files:
- `run-project.bat` - Runs everything automatically
- `start-backend.ps1` - Starts only the backend
- `start-frontend.ps1` - Starts only the frontend

## Troubleshooting

### If MongoDB is not running:
1. Open Services (services.msc)
2. Find "MongoDB" service
3. Start it if it's not running

### If ports are in use:
- Backend port 3000: Change in `src/main.ts`
- Frontend port 4200: Change in `angular.json`

### If you get permission errors:
Run PowerShell as Administrator

## Project Structure
- `saas-app-backend/` - NestJS API server
- `saas-app-frontend/` - Angular web application
- Database: MongoDB (port 27017) 