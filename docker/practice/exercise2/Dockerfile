FROM python:3.9-slim AS builder

ENV VIRTUALENV=/opt/venv

RUN python3 -m venv $VIRTUALENV

ENV PATH="$VIRTUALENV/bin:$PATH"

COPY requirements.txt /tmp

RUN pip install --no-cache-dir -r /tmp/requirements.txt


FROM python:3.9-slim

COPY --from=builder /opt/venv /opt/venv

WORKDIR /app

COPY app.py .

CMD ["/opt/venv/bin/python3", "app.py"]
