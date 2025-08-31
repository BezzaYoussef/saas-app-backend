# SaaS Application Setup Guide

This guide will help you set up and run the complete SaaS application with MongoDB, NestJS backend, and Angular frontend.

## Prerequisites

1. **Node.js** (v16 or higher)
2. **MongoDB** (v5.0 or higher)
3. **Git** (for cloning the repository)

## Step 1: Install MongoDB

### Option A: Install MongoDB Community Edition

1. Download MongoDB Community Server from: https://www.mongodb.com/try/download/community
2. Run the installer and follow the installation wizard
3. Make sure to install MongoDB Compass (GUI tool) if prompted

### Option B: Use Docker (Recommended)

If you have Docker installed, you can run MongoDB in a container:

```bash
docker run -d --name mongodb -p 27017:27017 mongo:latest
```

### Option C: Use MongoDB Atlas (Cloud)

1. Go to https://www.mongodb.com/atlas
2. Create a free account and cluster
3. Get your connection string

## Step 2: Verify MongoDB Installation

After installation, verify MongoDB is running:

```bash
# Check if MongoDB is running
mongod --version

# Start MongoDB service (if not running)
# Windows: MongoDB should start automatically as a service
# Linux/Mac: sudo systemctl start mongod
```

## Step 3: Set Up Backend

1. Navigate to the backend directory:

```bash
cd saas-app-backend
```

2. Install dependencies:

```bash
npm install
```

3. Configure environment:

   - The development environment is already configured to use `mongodb://192.168.0.187:27017/saas_db`
   - If you're using localhost, update the DATABASE_URL in `src/common/envs/development.env`:

   ```
   DATABASE_URL=mongodb://localhost:27017/saas_db
   ```

4. Start the backend:

```bash
npm run start:dev
```

The backend will run on `http://localhost:3000`

## Step 4: Set Up Frontend

1. Navigate to the frontend directory:

```bash
cd saas-app-frontend
```

2. Install dependencies:

```bash
npm install
```

3. Start the frontend:

```bash
npm start
```

The frontend will run on `http://localhost:4200`

## Step 5: Verify Everything is Working

1. **Backend**: Visit `http://localhost:3000` - you should see the NestJS welcome page
2. **Frontend**: Visit `http://localhost:4200` - you should see the Angular application
3. **Database**: MongoDB should be running on port 27017

## Troubleshooting

### Disk Space Issues

If you encounter disk space issues during npm install:

1. Clear npm cache: `npm cache clean --force`
2. Delete node_modules and package-lock.json
3. Run `npm install` again

### MongoDB Connection Issues

1. Make sure MongoDB is running
2. Check if the port 27017 is available
3. Verify the connection string in the environment file

### Port Conflicts

- Backend default port: 3000
- Frontend default port: 4200
- MongoDB default port: 27017

If any port is in use, you can change it in the respective configuration files.

## Development Commands

### Backend

```bash
# Development mode
npm run start:dev

# Production mode
npm run start:prod

# Debug mode
npm run start:debug
```

### Frontend

```bash
# Development server
npm start

# Build for production
npm run build
```

## Project Structure

```
saas-app-backend/
├── src/
│   ├── controllers/     # API controllers
│   ├── services/        # Business logic
│   ├── data/           # Database models and repositories
│   └── common/         # Configuration and utilities
└── package.json

saas-app-frontend/
├── src/
│   ├── app/
│   │   ├── @features/  # Feature modules
│   │   ├── @shared/    # Shared components
│   │   └── @store/     # State management
│   └── assets/
└── package.json
```

## Next Steps

1. Explore the API endpoints in the backend
2. Check the Angular components in the frontend
3. Review the database models and relationships
4. Test the signup and authentication flows
