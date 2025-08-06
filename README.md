# SaaS Application Backend

A comprehensive SaaS (Software as a Service) backend built with NestJS, featuring user management, subscription handling, payment processing, and widget management.

## 🚀 Features

- **User Management**: Customer registration, authentication, and role-based access control
- **Subscription Management**: Plan management, subscription handling, and billing cycles
- **Payment Processing**: PayPal integration for secure payment processing
- **Workspace Management**: Multi-tenant workspace configuration and management
- **Widget System**: Dynamic widget builder and management system
- **API Security**: JWT authentication and role-based guards
- **Database Integration**: MongoDB with Mongoose ODM
- **Environment Configuration**: Multi-environment support (development, integration, production)

## 🛠️ Tech Stack

- **Framework**: NestJS (Node.js)
- **Language**: TypeScript
- **Database**: MongoDB with Mongoose
- **Authentication**: JWT
- **Payment**: PayPal API
- **Testing**: Jest
- **Code Quality**: ESLint, Prettier, Husky

## 📋 Prerequisites

- Node.js (v16 or higher)
- MongoDB
- PayPal Developer Account (for payment features)

## 🚀 Quick Start

### 1. Installation

```bash
npm install
```

### 2. Environment Setup

Copy the environment files and configure them:

```bash
cp src/common/envs/.env.example src/common/envs/.env
```

Update the environment variables in `src/common/envs/.env`:
- Database connection string
- JWT secret
- PayPal credentials
- Other application-specific settings

### 3. Database Setup

Ensure MongoDB is running and accessible. The application will automatically create the necessary collections.

### 4. Running the Application

```bash
# Development mode
npm run start:dev

# Production mode
npm run start:prod

# Watch mode
npm run start:watch
```

### 5. Testing

```bash
# Unit tests
npm run test

# E2E tests
npm run test:e2e

# Test coverage
npm run test:cov
```

## 📁 Project Structure

```
src/
├── controllers/          # API controllers
├── data/                # Data layer (models, repositories)
├── services/            # Business logic services
├── common/              # Shared utilities and configurations
├── application-context/ # Application context management
└── main.ts             # Application entry point
```

## 🔧 Configuration

### Environment Variables

- `MONGODB_URI`: MongoDB connection string
- `JWT_SECRET`: Secret key for JWT tokens
- `PAYPAL_CLIENT_ID`: PayPal client ID
- `PAYPAL_CLIENT_SECRET`: PayPal client secret
- `PORT`: Application port (default: 3000)

### Database Models

- **User**: Customer and admin user management
- **SaasApplication**: Application configurations
- **SaasSubscription**: Subscription management
- **SaasPayment**: Payment processing
- **SaasWorkspace**: Workspace configurations
- **Widget**: Widget system management

## 🔐 API Security

The application implements:
- JWT-based authentication
- Role-based access control
- Request validation
- CORS configuration
- Rate limiting (configurable)

## 💳 Payment Integration

PayPal integration is included for:
- Payment initialization
- Payment completion
- Payment history tracking
- Subscription billing

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

For support and questions:
- Create an issue in the repository
- Check the documentation in the `/docs` folder
- Review the PowerShell scripts for common setup scenarios

## 🔄 Development Scripts

The project includes various PowerShell scripts for:
- MongoDB setup and management
- Frontend integration testing
- Widget builder testing
- Project status monitoring
- Quick fixes and debugging

---

Built with ❤️ using NestJS
