
# Flashcard App

A simple and engaging flashcard app for students to help them learn new concepts. This app allows users to create, filter, and shuffle flashcards by category. It's designed to be user-friendly with a responsive design, making it accessible on desktop, tablet, and mobile devices.

## Features

- **Add Flashcards**: Users can add questions, answers, and categories for each flashcard.
- **Category Filter**: Flashcards can be filtered by category (e.g., Geography, Mathematics).
- **Shuffle Flashcards**: Users can shuffle the flashcards to randomize the order.
- **Responsive Design**: Optimized for desktop, tablet, and mobile devices.
- **Pagination**: Easily navigate through flashcards in pages.

## Technologies Used

### Frontend
- React
- CSS 
- Docker (for containerization)

### Backend
- Flask (Python)
- MySQL (Database)
- Docker (for containerization)

### Deployment
- Docker Compose for container orchestration

## Prerequisites

- **Node.js**: Required to run the React app.
- **Python 3.x**: Required to run the Flask API.
- **Docker & Docker Compose**: Required for containerization.

## Installation

### 1. Clone the repository

```bash
git clone https://github.com/your-username/flashcard-app.git
cd flashcard-app
```

### 2. Setup Backend (Flask + MySQL)

- Create a `.env` file in the `backend` folder and add the following environment variables:

```
env
# MySQL database settings
MYSQL_ROOT_PASSWORD=root_password
MYSQL_DATABASE=flashcards_db
MYSQL_USER=flashcard_user
MYSQL_PASSWORD=your_password
DB_HOST=db

# Backend settings
BACKEND_PORT=5001

# Frontend API URL
REACT_APP_API_URL=http://localhost:5001

```

- Run the backend using Docker Compose:

```bash
docker-compose up --build
```

This command will build and start the backend API, along with a MySQL container.

### 3. Setup Frontend (React)

- Navigate to the `frontend` folder and install dependencies:

```bash
cd frontend
npm install
```

- Start the frontend:

```bash
npm start
```

Your React app will be accessible at `http://localhost:3000`.

### 4. Accessing the App

Once both frontend and backend containers are running, you can access the app:

- **Frontend (React)**: `http://localhost:3000`
- **Backend (Flask API)**: `http://localhost:5001`

## Usage

- **Create Flashcards**:
  - Navigate to the form and fill in the question, answer, and select the category. Click on "Add Flashcard" to submit.
  
- **Filter Flashcards**:
  - Use the "Filter by Category" dropdown to filter flashcards by category.
  
- **Shuffle Flashcards**:
  - Check the "Shuffle Flashcards" option to randomize the order of displayed flashcards.
  
- **Pagination**:
  - Use the pagination controls to navigate through pages of flashcards.

- **backend/**: Contains the Flask API and Docker configuration for the backend.
- **frontend/**: Contains the React app with all UI components and configuration files.
- **docker-compose.yml**: Defines and runs multi-container Docker applications, including frontend, backend, and database.

## Docker

This app uses Docker Compose to manage both the frontend, backend, and MySQL database containers. The `docker-compose.yml` file defines the services for the containers and how they interact.

- To start all containers at once:

  ```bash
  docker-compose up --build
  ```

  This will:
  - Build and start the frontend React app.
  - Build and start the backend Flask API.
  - Build and start the MySQL container.

- To stop the containers:

  ```bash
  docker-compose down
  ```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
