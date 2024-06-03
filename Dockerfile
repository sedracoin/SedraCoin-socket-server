# Use Python 3.10 Alpine as the base image
FROM python:3.10-alpine

# Set environment variables to prevent Python from writing .pyc files to disk
# and to ensure stdout and stderr are directly forwarded to the terminal.
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install system dependencies needed for building certain Python packages
RUN apk update && apk add --no-cache gcc musl-dev libffi-dev openssl-dev cargo

# Install netcat for network utilities
RUN apk add --no-cache netcat-openbsd

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file into the container
COPY requirements.txt ./

# Install the Python dependencies
RUN pip install -r requirements.txt

# After dependencies are installed, copy the rest of your application's code
COPY . .

# Specify the command to run your app using Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8001"]
