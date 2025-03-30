FROM python:3.12-slim

RUN apt-get update && apt-get install -y libpq-dev python3-dev \
&& pip install psycopg2-binary

# Install python package
COPY requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt