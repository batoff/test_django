# This file is a template, and might need editing before it works on your project.
FROM python:3.7

# Edit with mysql-client, postgresql-client, sqlite3, etc. for your needs.
# Or delete entirely if not needed.
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        sqlite3 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /

COPY requirements.txt /
RUN pip install --no-cache-dir -r requirements.txt

COPY / /usr/src/app

# For Django
EXPOSE 8000
CMD ["python3", "/manage.py", "runserver", "0.0.0.0:8000"]

# For some other command
# CMD ["python", "app.py"]
