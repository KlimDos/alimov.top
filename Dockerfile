
FROM python:slim-buster
LABEL maintainer="Sasha Alimov klimdos@gmail.com"
WORKDIR /
COPY src/ src/
RUN pip install -r src/requirements.txt
EXPOSE 5000
ARG FLASK_RUN_PORT=5000
ENV FLASK_RUN_PORT=${FLASK_RUN_PORT} 
ARG ARTEFACT_VERSION
ENV ARTEFACT_VERSION=${ARTEFACT_VERSION}
ENTRYPOINT ["gunicorn", "-b", "0.0.0.0:5000", "src.app:app"]
