# Use an official Python image as a base
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libsndfile1 \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Copy the requirements list
COPY requirements.txt .

# Install the dependencies
RUN pip install --upgrade pip \
    && pip install -r requirements.txt \
    -f https://download.pytorch.org/whl/torch_stable.html

# Copy the rest of the application code
COPY . .

# Expose port 3000 for the Flask app
EXPOSE 3000

# Set the entry point for the Flask application
CMD ["python", "webApp.py"]
