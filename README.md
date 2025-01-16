# Fut-API

Fut-API is a robust backend service for soccer enthusiasts, inspired by platforms like Futbin and Fut.gg. It provides endpoints to access player stats, manage squads, and track market data for Ultimate Team players in EAFC 25. This project is built with Golang, PostgreSQL, and Redis, leveraging Google Cloud Platform (GCP) for deployment.

---

## Features

### Core Features

- **Player Database**: Access comprehensive player stats, including ratings, positions, and attributes.
- **Market Data**: Track real-time or updated player prices.
- **Squad Builder**: Build and save squads, calculate chemistry, and analyze squad performance.
- **Search and Filters**: Search players by attributes, nationality, league, and more.
- **Authentication**: Secure JWT-based user authentication for personal features.

### Additional Features

- **Real-Time Updates**: WebSocket support for live market price notifications.
- **Caching**: Redis integration for faster access to frequently used data.

---

## Tech Stack

### Backend

- **Language**: [Go (Golang)](https://golang.org/)
- **Routing**: [Gorilla Mux](https://github.com/gorilla/mux)
- **ORM**: [GORM](https://gorm.io/)
- **Authentication**: [JWT](https://github.com/golang-jwt/jwt)

### Database

- **Primary**: PostgreSQL for structured data (e.g., player stats, squads).
- **Caching**: Redis for real-time performance.

### Deployment

- **Platform**: Google Cloud Platform (GCP)
- **Containerization**: Docker and Kubernetes (optional).
- **CI/CD**: GitHub Actions.

---

## API Endpoints

### Player Data

- `GET /players`: Fetch a list of players with filters.
- `GET /players/{id}`: Get detailed information about a specific player.

### Market Data

- `GET /market/price/{player_id}`: Retrieve market price for a player.
- `POST /market/update`: Update player prices (admin access).

### Squad Builder

- `POST /squads`: Create a new squad.
- `GET /squads/{id}`: Fetch a specific squad by ID.

### User Authentication

- `POST /auth/register`: Register a new user.
- `POST /auth/login`: User login to retrieve JWT token.

### User Data

- `GET /user/squads`: Retrieve saved squads for the logged-in user.

---

## Installation and Setup

### Prerequisites

- **Go**: Installed on your local machine.
- **Docker**: For containerization.
- **PostgreSQL**: Database setup locally or via Docker.
- **Redis**: For caching (local or Docker).

### Steps

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/fut-api.git
   cd fut-api
   ```
2. Install dependencies:
   ```bash
   go mod tidy
   ```
3. Set up environment variables:
   Create a `.env` file with the following:
   ```env
   DB_HOST=localhost
   DB_PORT=5432
   DB_USER=youruser
   DB_PASSWORD=yourpassword
   DB_NAME=futdb
   REDIS_HOST=localhost
   REDIS_PORT=6379
   JWT_SECRET=yourjwtsecret
   ```
4. Run PostgreSQL and Redis using Docker:
   ```bash
   docker-compose up -d
   ```
5. Start the server:
   ```bash
   go run main.go
   ```
6. Access the API at `http://localhost:8080`.

---

## Database Schema

### Player Table

```sql
CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    rating INT,
    position VARCHAR(5),
    nationality VARCHAR(50),
    league VARCHAR(100),
    pace INT,
    shooting INT,
    passing INT,
    dribbling INT,
    defense INT,
    physical INT
);
```

### Prices Table

```sql
CREATE TABLE prices (
    id SERIAL PRIMARY KEY,
    player_id INT REFERENCES players(id),
    price INT,
    updated_at TIMESTAMP
);
```

### Squad Table

```sql
CREATE TABLE squads (
    id SERIAL PRIMARY KEY,
    user_id INT,
    squad_name VARCHAR(100),
    players JSONB,
    chemistry INT
);
```

---

## Roadmap

1. Build core endpoints for player data and squads.
2. Integrate data sources (e.g., APIs, scraping tools).
3. Optimize database and API performance.
4. Add WebSocket for real-time price updates.
5. Deploy to GCP with CI/CD pipelines.
6. Expand features like leaderboards and player comparisons.

---

## Contributing

1. Fork the repository.
2. Create a feature branch: `git checkout -b feature/your-feature-name`
3. Commit changes: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin feature/your-feature-name`
5. Open a pull request.

---

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

---

## Contact

For questions or suggestions, please reach out at [bruno96dantas@gmail.com].
