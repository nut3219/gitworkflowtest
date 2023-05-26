# Use an official Python runtime as the base image
FROM python:3.11

# Set the working directory in the container
WORKDIR /app

# Install Poetry
RUN pip install poetry

# Copy the poetry.lock and pyproject.toml files
COPY pyproject.toml poetry.lock /app/

# Install project dependencies
RUN poetry config virtualenvs.create false && poetry install --no-interaction --no-ansi

# Copy the rest of the application code
COPY . /app

# Expose the port that FastAPI will run on
EXPOSE 8000

# Start the FastAPI server
CMD ["poetry", "run", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
