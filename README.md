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

Set up a PostgreSQL database. You can do this either manually or using Docker.

##### Option 1: Manual Setup

Run a PostgreSQL instance:

```bash
docker run -d   --name postgres   -e POSTGRES_PASSWORD=postgres   -p 5533:5432   postgres:latest
```

Then, access the database using `psql` and create the required table:

```sql
CREATE TABLE todo (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    done BOOLEAN NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    edited_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
```

##### Option 2: Using Docker

If using Docker Compose, build and run your containers:

```bash
docker-compose up --build
```

Then, access the PostgreSQL container:

```bash
docker exec -it <postgres_container_name> bash
```

Inside the container, create the required table using the same `CREATE TABLE` command as above.

#### Step 3: Prisma Migrations

Generate and run Prisma migrations to sync your database schema:

```bash
npx prisma migrate dev
```

### Running the Application

After setting up the database and completing the migrations, start the application:

```bash
bun start
```

## Additional Notes

- Ensure the `DATABASE_URL` in your environment matches the database setup.
- You can modify the database schema using the Prisma schema file and regenerate migrations as needed.
