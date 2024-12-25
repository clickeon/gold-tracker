# Use Python 3.11 slim image to match Cloud Run configuration
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy requirements file
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY . .

# Set environment variables
ENV PORT=8080
ENV PYTHON_ENV=production
ENV GOOGLE_CLOUD_PROJECT=crypto-canyon-426117-i3
ENV GOOGLE_CLOUD_REGION=us-central1

# Make port 8080 available to the world outside this container
EXPOSE ${PORT}

# Run the application with gunicorn
CMD exec gunicorn --bind :${PORT} --workers 1 --threads 8 --timeout 0 app:app
