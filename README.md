Here’s the updated **README.md** with the Docker-specific details highlighted:

---

# Todo App with Ruby on Rails and Vue.js

## Overview
This is a full-stack task management application built using **Ruby on Rails** for the backend and **Vue.js** for the frontend. The application allows users to register, log in, and manage their tasks efficiently.

## Features

### Authentication
- User signup and login functionality with secure password hashing.
- JWT-based authentication to protect API routes.

### Task Management
- Add, edit, and delete tasks.
- Mark tasks as pending, in-progress, or completed.
- View a list of all tasks.

### Dockerized Environment
- Fully dockerized setup for development and deployment.
- Containers for the backend, frontend, and PostgreSQL database.

## Technologies Used
- **Ruby on Rails**: Backend API.
- **Vue.js**: Frontend framework.
- **PostgreSQL**: Database.
- **Docker**: Containerization.

## Getting Started

### Prerequisites
Ensure the following tools are installed:
- Docker
- Docker Compose

### Setup

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd <repository-name>
   ```

2. Build and run the Docker containers:
   ```bash
   docker compose up --build
   ```

3. Apply database migrations:
   ```bash
   docker compose exec backend rails db:migrate
   ```

4. Open the frontend application in your browser:
   ```
   http://localhost:8080
   ```

5. The backend API is available at:
   ```
   http://localhost:3000
   ```

### Docker Details
- The backend service is built using **Ruby on Rails** and runs on port `3000`.
- The frontend service is built using **Vue.js** and runs on port `8080`.
- The database service uses **PostgreSQL** and is exposed on port `5434` for host access.

#### Docker Compose Services
- `backend`: Ruby on Rails backend server.
- `frontend`: Vue.js frontend server.
- `db`: PostgreSQL database server.

### Stopping the Application
To stop all running containers:
```bash
docker compose down
```

To stop and remove all containers, networks, and volumes (optional):
```bash
docker compose down -v
```

---

## Project Structure
```
.
├── backend
│   ├── app
│   ├── config
│   ├── db
│   └── ...
├── frontend
│   ├── src
│   ├── public
│   └── ...
├── docker-compose.yml
└── README.md
```

---

Happy birthday / Merry christmas / Happy new year 