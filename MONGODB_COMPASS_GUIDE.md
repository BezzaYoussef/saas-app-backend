# MongoDB Compass Setup Guide

## 🎯 **What is MongoDB Compass?**
MongoDB Compass is a GUI (Graphical User Interface) for MongoDB that makes it easy to:
- Browse and edit your data
- Create and modify databases
- Monitor database performance
- Run queries and aggregations

## 📥 **Installation Options**

### Option 1: Automatic Installation
```powershell
powershell -ExecutionPolicy Bypass -File install-mongodb-compass.ps1
```

### Option 2: Manual Installation
1. Go to: https://www.mongodb.com/try/download/compass
2. Download MongoDB Compass
3. Run the installer

## 🔗 **Connecting to Your Database**

### Connection Details:
- **Connection String**: `mongodb://localhost:27018`
- **Database Name**: `saas_db`
- **Port**: 27018 (custom port to avoid conflicts)

### Steps to Connect:
1. **Open MongoDB Compass**
2. **Click "New Connection"**
3. **Enter Connection String**: `mongodb://localhost:27018`
4. **Click "Connect"**
5. **Create Database**: 
   - Click "Create Database"
   - Database Name: `saas_db`
   - Collection Name: `users` (or any collection)

## 🗄️ **Database Structure**

Your SaaS application uses these collections:
- `users` - User accounts
- `saasApplications` - Application data
- `saasSubscribers` - Subscription data
- `saasPlans` - Pricing plans
- `saasPayments` - Payment records

## 🚀 **Starting Your Application**

### 1. Start MongoDB (if not running):
```powershell
powershell -ExecutionPolicy Bypass -File start-mongodb-simple.ps1
```

### 2. Start Backend:
```powershell
cd saas-app-backend
npm run start:dev
```

### 3. Start Frontend:
```powershell
cd saas-app-frontend
npm start
```

## 🔍 **Using Compass to Monitor Your App**

### View Collections:
1. Connect to `mongodb://localhost:27018`
2. Select `saas_db` database
3. Browse collections to see your data

### Monitor Real-time:
- Watch collections update as your app runs
- Use the query interface to test data
- Export/Import data as needed

## 🛠️ **Troubleshooting**

### If Connection Fails:
1. Make sure MongoDB is running on port 27018
2. Check if port 27018 is not blocked by firewall
3. Try restarting MongoDB

### If Compass Can't Find MongoDB:
1. Verify MongoDB is installed
2. Check if MongoDB service is running
3. Try connecting to `mongodb://127.0.0.1:27018`

## 📊 **Useful Compass Features**

- **Schema Analysis**: Understand your data structure
- **Indexes**: Optimize query performance
- **Aggregations**: Complex data analysis
- **Explain Plans**: Query optimization
- **Real-time Monitoring**: Watch database activity

## 🎯 **Next Steps**

1. Install MongoDB Compass
2. Start MongoDB on port 27018
3. Connect Compass to your database
4. Start your backend application
5. Monitor data in real-time through Compass 