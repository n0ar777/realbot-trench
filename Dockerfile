# Fly.io deployment for your Telegram bot
FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1     PYTHONUNBUFFERED=1

WORKDIR /app

# Install build deps (often unnecessary, but keeps wheels happy on slim images)
RUN apt-get update -y && apt-get install -y --no-install-recommends     ca-certificates curl &&     rm -rf /var/lib/apt/lists/*

# Python deps
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

# App code
COPY . /app

# Your bot listens on PORT (default 3000 in your code)
ENV PORT=3000

# Run the bot
CMD ["python", "bot.py"]
