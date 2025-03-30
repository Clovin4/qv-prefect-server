#!/bin/bash
set -e

# Wait for PostgreSQL to start
until pg_isready -h "$POSTGRES_HOST" -U "$POSTGRES_USER"; do
  echo "Waiting for PostgreSQL to be ready..."
  sleep 2
done

# Function to check if a database exists
database_exists() {
  psql -h "$POSTGRES_HOST" -U "$POSTGRES_USER" -lqt | cut -d \| -f 1 | grep -qw "$1"
}

# Create mlflowdb if it does not exist
if database_exists "mlflowdb"; then
  echo "Database mlflowdb already exists."
else
  echo "Creating database mlflowdb..."
  psql -h "$POSTGRES_HOST" -U "$POSTGRES_USER" -c "CREATE DATABASE mlflowdb;"
fi

# Create prefectdb if it does not exist
if database_exists "prefectdb"; then
  echo "Database prefectdb already exists."
else
  echo "Creating database prefectdb..."
  psql -h "$POSTGRES_HOST" -U "$POSTGRES_USER" -c "CREATE DATABASE prefectdb;"
fi

echo "Schemas created successfully."