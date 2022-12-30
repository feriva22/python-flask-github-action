FROM python:3.8.16

WORKDIR /sample-app

COPY . /sample-app/

RUN pip install -r requirements.txt && \
    pip install -r requirements-server.txt

ENV LC_ALL="C.UTF-8"
ENV LANG="C.UTF-8"

EXPOSE 8000/tcp

CMD ["/bin/sh", "-c", "flask db upgrade && gunicorn app:app -b 0.0.0.0:8000"]
