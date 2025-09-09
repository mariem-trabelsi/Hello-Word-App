# Use official Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy only requirements first (for caching)
COPY requirements.txt .

# Install dependencies
RUN pip install --upgrade pip && \
    pip install -r requirements.txt && \
    pip install pytest flake8

# Copy the rest of the code
COPY . .

# Default command to run tests
CMD ["pytest"]
