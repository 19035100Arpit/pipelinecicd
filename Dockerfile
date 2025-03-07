FROM python:3.10-slim

WORKDIR /app

# Install required system dependencies
# Create a virtual environment
RUN python -m venv /app/user_venv

# Use the virtual environment
ENV PATH="/app/user_venv/bin:$PATH"

# Copy dependency file first for better caching
COPY requirements.txt /app/requirements.txt

# Install dependencies
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY . /app

# Expose the application port
EXPOSE 8765

# Run your Python script
CMD ["python", "app.py"]
