# Project Template - PostgreSQL, Docker, Prisma, and Bun

This README outlines the setup process for a basic project using PostgreSQL, Docker, Prisma, and Bun.

## Local Setup

### Prerequisites

- Ensure you have [Bun](https://bun.sh/) and [Docker](https://www.docker.com/) installed on your machine.

### Installation & Setup

#### Step 1: Install Dependencies

Run the following command to install project dependencies:

```bash
bun install
```

#### Step 2: Database Setup

##### Option 1: Local

Run a PostgreSQL instance:

```bash
docker run -d \
  --name dev \
  -e POSTGRES_PASSWORD=postgres \
  -p 5534:5432 \
  postgres:latest

```

Then, access the database using `psql` and create the required table:

```
 docker exec -it dev  psql -U postgres
```

```sql
-- Enable uuid-ossp extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE todo (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    done BOOLEAN NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    edited_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
```

##### Option 2: Using Docker

```bash
docker-compose up --build
```

Then, access the PostgreSQL container:

```bash
 docker exec -it postgresql_docker_prisma_db_1  psql -U postgres

```

Follow the same steps as above

#### Run the migrations

```
bunx prisma migrate dev
```

### Running the Application

After setting up the database and completing the migrations, start the application:

```bash
bun run dev
```

## Additional Notes

- Ensure the `DATABASE_URL` in your environment matches the database setup.
- You can modify the database schema using the Prisma schema file and regenerate migrations as needed.

curl -X POST http://localhost:8080/todo \
-H "Content-Type: application/json" \
-d '{"name": "Buy groceries", "done": false}'
