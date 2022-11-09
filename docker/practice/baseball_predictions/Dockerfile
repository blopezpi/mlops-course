FROM python:3.9-slim as builder

WORKDIR /app

# Send stream output to the terminal 
ENV PYTHONUNBUFFERED 1

RUN python -m venv /opt/venv

ENV PATH="/opt/venv/bin:$PATH"

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

FROM python:3.9-slim

COPY --from=builder /opt/venv /opt/venv

WORKDIR /app

ENV PATH="/opt/venv/bin:$PATH"

COPY . .

ENTRYPOINT ["python", "cli.py"]

CMD ["--weight", "100"]
