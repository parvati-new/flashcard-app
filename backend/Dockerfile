# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install the MySQL client
RUN apt-get update && apt-get install -y default-mysql-client

# Copy the rest of the code into the container
COPY . .

# Expose port 5000 for the Flask app
ENV PORT=${BACKEND_PORT} 

EXPOSE $PORT

# Make wait-for-db.sh executable
RUN chmod +x wait-for-db.sh

# Run the application
CMD ["./wait-for-db.sh", "db:3306", "--", "gunicorn", "-b", "0.0.0.0:5000", "app:app"]
