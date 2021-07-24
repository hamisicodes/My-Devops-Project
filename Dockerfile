FROM python:3

RUN apt-get update \
    && apt-get -y upgrade \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
    && apt-get install -y \
    curl \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash devops

ADD app /app/

ADD entrypoint.sh /app/

RUN chown -R devops:devops /app \
    && chmod +x /app/entrypoint.sh

USER devops

ENV FLASK_APP=flaskr

ENV ENVIRONMENT=dev

RUN pip3 install flask

WORKDIR /app
# ENTRYPOINT ["/bin/sh", "-c"]

CMD ["/app/entrypoint.sh"]