
FROM python:slim-buster
LABEL maintainer="Sasha Alimov klimdos@gmail.com"
WORKDIR /
COPY src/ src/
RUN pip install -r src/requirements.txt
EXPOSE 5000
ARG FLASK_RUN_PORT=5000
ENV FLASK_RUN_PORT=${FLASK_RUN_PORT} 
ENTRYPOINT ["python"]
CMD [ "src/app.py" ]
