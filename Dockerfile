# Base image with Python installed
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container
COPY . .

# Install any Python dependencies (each participant can provide their own requirements.txt)
RUN pip install --no-cache-dir -r requirements.txt

# Default command to run when container starts
CMD ["python", "evaluation_script.py", "input.txt", "output.txt"]
