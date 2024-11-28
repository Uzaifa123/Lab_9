# Stage 1: Build
FROM python:3.10-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

# Stage 2: Run
FROM python:3.10-slim
WORKDIR /app
COPY --from=builder /app /app
CMD ["python", "main.py"]
