# Use a specific Python version
FROM python:3.9-alpine

LABEL maintainer="Sasha Alimov <klimdos@gmail.com>"

WORKDIR /app

# Only copy necessary files to reduce build context
COPY src/ src/

# Create and activate a virtual environment
RUN python -m venv venv && \
    source venv/bin/activate && \
    pip install --upgrade pip && \
    pip install -r src/requirements.txt

# Remove unnecessary build dependencies
RUN apk del build-base libffi-dev

# Set Python to run in optimized mode
ENV PYTHONOPTIMIZE=2

# Expose the specified port
EXPOSE 5000

# Set environment variables
ARG FLASK_RUN_PORT=5000
ARG ARTEFACT_VERSION
ENV FLASK_RUN_PORT=${FLASK_RUN_PORT} \
    ARTEFACT_VERSION=${ARTEFACT_VERSION}

# Copy gunicorn configuration file
COPY gunicorn.conf.py .

# Set the entry point for the application
CMD ["/app/venv/bin/gunicorn", "-c", "gunicorn.conf.py", "src.app:app"]
