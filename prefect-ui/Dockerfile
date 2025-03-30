FROM prefecthq/prefect:3-latest

# Install asyncpg and psycopg2
RUN apt-get update && apt-get install -y libpq-dev curl \
    && pip install asyncpg psycopg2-binary \
    && apt-get clean