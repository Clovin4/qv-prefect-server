FROM postgres:16

# Add a custom script that will run during container initialization
COPY init-db.sh /docker-entrypoint-initdb.d/

# Ensure the script has executable permissions
RUN chmod +x /docker-entrypoint-initdb.d/init-db.sh
