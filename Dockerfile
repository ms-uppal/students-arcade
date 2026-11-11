# Start from a small official Python image.
FROM python:3.12-slim

# Prevent Python from creating buffered output in the container.
ENV PYTHONUNBUFFERED=1

# Use a dedicated directory inside the image.
WORKDIR /app

# Copy dependency metadata first if the project has it.
COPY requirements.txt* ./

# Install dependencies only when requirements.txt exists.
RUN if [ -f requirements.txt ]; then pip install --no-cache-dir -r requirements.txt; fi

# Copy the Arcade launcher and plugins into the image.
COPY main.py ./
COPY plugins ./plugins

# Start the existing Arcade launcher when the container runs.
CMD ["python", "main.py"]
# CMD ["python", "missing.py"]
