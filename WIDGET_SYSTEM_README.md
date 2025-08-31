# Widget System Documentation

## Overview

This is a comprehensive SaaS widget builder system that allows users to create, manage, and embed custom widgets. The system consists of a NestJS backend API and an Angular frontend with a drag-and-drop widget builder interface.

## Architecture

### Backend (NestJS)

- **Port**: 3002
- **Database**: MongoDB
- **Framework**: NestJS with TypeScript
- **Features**: RESTful API, CRUD operations, widget management

### Frontend (Angular)

- **Port**: 4200
- **Framework**: Angular 15
- **Features**: Drag-and-drop builder, responsive design, real-time preview

## Features

### Widget Builder

- 🎨 **Drag-and-Drop Interface**: Visual component builder
- 📱 **Responsive Design**: Mobile, tablet, and desktop previews
- 🎯 **Component Library**: 40+ pre-built components
- 💾 **Real-time Save**: Auto-save and manual save functionality
- 👁️ **Live Preview**: Instant preview of widget changes
- 📝 **Code Editor**: HTML, CSS, and JavaScript editing
- 🔄 **Undo/Redo**: Full history management
- 📤 **Export/Import**: Project file management

### Widget Management

- 📊 **Dashboard**: Centralized widget management
- 🔍 **Search & Filter**: Find widgets by name, category, or description
- 📁 **Categories**: Organize widgets (general, pricing, contact, newsletter)
- ⚡ **Status Toggle**: Activate/deactivate widgets
- 📋 **Duplicate**: Clone existing widgets
- 🗑️ **Delete**: Remove unwanted widgets

### API Features

- 🔐 **CRUD Operations**: Create, read, update, delete widgets
- 📈 **Statistics**: Widget usage analytics
- 🔍 **Search**: Full-text search across widgets
- 📂 **Category Filtering**: Filter by widget category
- 🔄 **Status Management**: Toggle widget active status
- 📋 **Duplication**: Clone widgets with new IDs

## Quick Start

### Prerequisites

- Node.js (v16 or higher)
- npm (v8 or higher)
- MongoDB (v5 or higher)

### Installation

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd saas-app-backend
   ```

2. **Install dependencies**

   ```bash
   # Backend dependencies
   cd saas-app-backend
   npm install

   # Frontend dependencies
   cd ../saas-app-frontend
   npm install
   ```

3. **Start MongoDB**

   ```bash
   # Create data directory
   mkdir -p C:\data\db

   # Start MongoDB
   mongod --dbpath C:\data\db --port 27017
   ```

4. **Start the application**

   ```bash
   # Start backend (in saas-app-backend directory)
   npm run start:dev

   # Start frontend (in saas-app-frontend directory)
   npm start
   ```

5. **Access the application**
   - Frontend: http://localhost:4200
   - Backend API: http://localhost:3002
   - API Documentation: http://localhost:3002/api/widgets

## API Endpoints

### Widget Management

| Method | Endpoint                     | Description          |
| ------ | ---------------------------- | -------------------- |
| GET    | `/api/widgets`               | Get all widgets      |
| POST   | `/api/widgets`               | Create a new widget  |
| GET    | `/api/widgets/:id`           | Get widget by ID     |
| PUT    | `/api/widgets/:id`           | Update widget        |
| DELETE | `/api/widgets/:id`           | Delete widget        |
| PATCH  | `/api/widgets/:id/status`    | Toggle widget status |
| POST   | `/api/widgets/:id/duplicate` | Duplicate widget     |

### Widget Analytics

| Method | Endpoint                          | Description             |
| ------ | --------------------------------- | ----------------------- |
| GET    | `/api/widgets/stats`              | Get widget statistics   |
| GET    | `/api/widgets/active`             | Get active widgets only |
| GET    | `/api/widgets/category/:category` | Get widgets by category |
| GET    | `/api/widgets/search?q=:query`    | Search widgets          |

### Widget Embedding

| Method | Endpoint                      | Description           |
| ------ | ----------------------------- | --------------------- |
| GET    | `/api/widgets/:id/embed`      | Get widget embed HTML |
| GET    | `/api/widgets/:id/embed-code` | Get widget embed code |

## Widget Data Model

```typescript
interface Widget {
  _id?: string;
  name: string; // Widget name (required)
  description?: string; // Widget description
  category: string; // Category (general, pricing, contact, newsletter)
  isActive: boolean; // Active status
  html: string; // HTML content (required)
  css: string; // CSS styles
  js: string; // JavaScript code
  createdBy?: string; // Creator ID
  updatedBy?: string; // Last updater ID
  createdAt: Date; // Creation timestamp
  updatedAt: Date; // Last update timestamp
}
```

## Component Library

### Basic Elements (20 components)

- Button, Input, Textarea, Checkbox, Radio
- Select, Switch, Slider, Progress Bar, Badge
- Tooltip, Modal, Tabs, Accordion, Alert
- Card, Avatar, Dropdown, Pagination, Breadcrumb

### Reusable Components (20 components)

- Pricing Table, Testimonial Card, Product Card
- Hero Banner, Feature Grid, FAQ Section
- Contact Form, Stats Counter, Timeline
- Steps Progress, Login Form, Register Form
- Profile Card, Team Member Card, Notification Toast
- Sidebar Navigation, Footer, CTA Section
- Gallery Grid, Blog Post Preview

## Usage Examples

### Creating a Widget via API

```bash
curl -X POST http://localhost:3002/api/widgets \
  -H "Content-Type: application/json" \
  -d '{
    "name": "My Widget",
    "description": "A custom widget",
    "category": "general",
    "isActive": true,
    "html": "<div>Hello World</div>",
    "css": "div { color: blue; }",
    "js": "console.log(\"Widget loaded\");"
  }'
```

### Embedding a Widget

```html
<!-- Direct embed -->
<iframe
  src="http://localhost:3002/api/widgets/WIDGET_ID/embed"
  width="100%"
  height="600"
  frameborder="0">
</iframe>

<!-- Or use the embed code endpoint -->
<script>
  fetch('http://localhost:3002/api/widgets/WIDGET_ID/embed-code')
    .then((response) => response.json())
    .then((data) => {
      document.getElementById('widget-container').innerHTML = data.data.iframeCode;
    });
</script>
```

## Testing

### Run Complete System Test

```bash
# In saas-app-backend directory
.\test-widget-system.ps1
```

### Test API Endpoints

```bash
# In saas-app-backend directory
.\test-api.ps1
```

### Manual Testing Checklist

1. **Basic Navigation**

   - [ ] Home page loads
   - [ ] Sign up/Sign in pages work
   - [ ] Dashboard loads
   - [ ] Widget Builder accessible

2. **Widget Builder**

   - [ ] Components panel loads
   - [ ] Drag and drop works
   - [ ] Properties panel opens
   - [ ] Preview tab works
   - [ ] Code tab shows HTML/CSS/JS

3. **Save Functionality**

   - [ ] Widget saves to database
   - [ ] Success message appears
   - [ ] Widget appears in dashboard
   - [ ] Edit existing widgets works

4. **Responsive Design**
   - [ ] Desktop layout (1200px+)
   - [ ] Tablet layout (768px-1024px)
   - [ ] Mobile layout (<768px)
   - [ ] Touch-friendly interactions

## Troubleshooting

### Common Issues

#### Backend Not Starting

```bash
# Check MongoDB connection
Test-NetConnection localhost -Port 27017

# Check environment variables
cat src/common/envs/development.env

# Check dependencies
npm install
```

#### Frontend Not Connecting

```bash
# Check backend is running
curl http://localhost:3002/api/widgets

# Check CORS settings
# Verify API URLs in widget-builder.service.ts
```

#### Save Functionality Fails

```bash
# Check browser console for errors
# Verify backend is accessible
# Check MongoDB connection
# Try refreshing the page
```

### Debug Commands

```bash
# Test backend API
curl http://localhost:3002/api/widgets

# Test database connection
Test-NetConnection localhost -Port 27017

# Check running processes
netstat -ano | findstr :3002
netstat -ano | findstr :4200
netstat -ano | findstr :27017
```

## Development

### Project Structure

```
saas-app-backend/
├── src/
│   ├── controllers/
│   │   └── widget/
│   │       ├── widget.controller.ts
│   │       └── widget.controller.module.ts
│   ├── services/
│   │   └── widget/
│   │       ├── widget.service.ts
│   │       └── widget.module.ts
│   ├── data/
│   │   ├── models/
│   │   │   └── widget/
│   │   │       └── widget.model.ts
│   │   └── widget/
│   │       ├── repository/
│   │       │   └── widget.repository.ts
│   │       └── widget.data.module.ts
│   └── main.ts

saas-app-frontend/
├── src/app/
│   ├── @features/
│   │   ├── widget-builder/
│   │   │   ├── components/
│   │   │   │   └── widget-builder.component.ts
│   │   │   ├── services/
│   │   │   │   └── widget-builder.service.ts
│   │   │   └── widget-builder.module.ts
│   │   └── dashboard/
│   │       ├── dashboard.component.ts
│   │       └── dashboard.component.html
│   └── app.module.ts
```

### Adding New Components

1. **Add to Component Library**

   ```typescript
   // In widget-builder.component.ts
   basicElements.push({
     type: 'new-component',
     name: 'New Component',
     icon: '🆕',
     category: 'basic',
   });
   ```

2. **Add HTML Template**

   ```typescript
   private getComponentHtml(type: string): string {
     const templates = {
       'new-component': '<div class="new-component" data-component-id="{{id}}">{{text}}</div>'
     };
     return templates[type] || '<div>Default</div>';
   }
   ```

3. **Add Default Properties**
   ```typescript
   private getDefaultProperties(type: string): any {
     switch (type) {
       case 'new-component':
         return { ...baseProps, text: 'New Component Text' };
     }
   }
   ```

## Deployment

### Environment Configuration

```bash
# Development
NODE_ENV=development
DATABASE_URL=mongodb://localhost:27017/saas_db

# Production
NODE_ENV=production
DATABASE_URL=mongodb://production-host:27017/saas_db
```

### Build Commands

```bash
# Backend
npm run build
npm run start:prod

# Frontend
ng build --prod
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## License

This project is licensed under the MIT License.

## Support

For support and questions:

- Create an issue in the repository
- Check the troubleshooting section
- Review the API documentation
- Test with the provided test scripts
