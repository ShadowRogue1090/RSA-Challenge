FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy your challenge script
COPY bob.py .

# Optional: install netcat (useful for debugging or piping)
RUN apt-get update && apt-get install -y netcat-openbsd && rm -rf /var/lib/apt/lists/*

# Expose the port Bob listens on
EXPOSE 9001

# Run the python script
CMD ["python", "bob.py"]
