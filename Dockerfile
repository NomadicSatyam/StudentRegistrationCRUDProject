# Use an official Python runtime as a parent image
FROM python:3.10

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the local requirements.txt to the container
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the local code into the container at the working directory
COPY . .

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Define environment variable to avoid buffering issues
ENV PYTHONUNBUFFERED 1

# Copy initialization script to the container
COPY init.sh /usr/src/app/init.sh

# Run the initialization script during container startup
CMD ["/bin/bash", "/usr/src/app/init.sh"]



