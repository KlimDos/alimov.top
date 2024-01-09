# Use a specific Python version
FROM python:3.8-slim-buster

LABEL maintainer="Sasha Alimov <klimdos@gmail.com>"

WORKDIR /

# Only copy necessary files to reduce build context #TBD
COPY src/ src/

# Create and activate a virtual environment
RUN python -m venv venv && \
    . venv/bin/activate && \
    pip install --upgrade pip && \
    pip install -r src/requirements.txt

# Remove build dependencies
RUN apt-get update && \
    apt-get remove -y build-essential && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

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
ENTRYPOINT ["/venv/bin/gunicorn", "-c", "gunicorn.conf.py", "src.app:app"]
