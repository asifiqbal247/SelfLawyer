FROM python:3.10-slim
RUN apt-get update && apt-get install -y build-essential python3-dev && rm -rf /var/lib/apt/lists/*
WORKDIR /app

# Create data directory
RUN mkdir -p /app/legal_db

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Explicitly copy source files
COPY main.py .
COPY rag_system.py .
COPY templates.py .

CMD ["python", "main.py"]
