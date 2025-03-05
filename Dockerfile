# Use the official Python image as the base image
FROM python:3.10-slim

# Set the working directory to /app
WORKDIR /app

# Copy the pyproject.toml and README.md files to the container
COPY pyproject.toml README.md /app/

# Install Poetry and project dependencies
RUN pip install poetry && poetry install

# Copy the rest of the application code to the container
COPY . /app

# Expose port 7860
EXPOSE 7860

# Set the default command to run the application
CMD ["poetry", "run", "python", "app.py"]
