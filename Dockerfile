# Use official Python slim image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Copy requirements and install uv
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all project files
COPY . .

# Expose port (Render provides $PORT at runtime)
EXPOSE 8000

# Start FastAPI server. Use shell form so $PORT is expanded by the shell.
# In Render set the environment variable PORT (Render sets it automatically).
# Don't use --reload in production.
CMD uvicorn app.main:app --host 0.0.0.0 --port ${PORT:-8000}
