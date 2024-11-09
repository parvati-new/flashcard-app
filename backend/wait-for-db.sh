# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code into the container
COPY . .

# Install the MySQL client
RUN apt-get update && apt-get install -y default-mysql-client

# Expose port 5000 for the Flask app
EXPOSE 5000

# Make the wait script executable
RUN chmod +x wait-for-db.sh

# Run the application using the wait script
CMD ["./wait-for-db.sh", "db", "gunicorn", "-b", "0.0.0.0:5000", "app:app"]
