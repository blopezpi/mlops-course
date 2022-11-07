FROM tiangolo/uvicorn-gunicorn-fastapi:python3.9-slim 

ENV PORT=8000

# Set working directory
WORKDIR /app

# Copy files
COPY requirements.txt /tmp

RUN pip install --no-cache-dir -r /tmp/requirements.txt

COPY ./src .
