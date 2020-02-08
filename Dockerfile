# This python3 setup was copied from - https://github.com/Docker-Hub-frolvlad/docker-alpine-python3/blob/master/Dockerfile

FROM alpine:3.11

# This hack is widely applied to avoid python printing issues in docker containers.
# See: https://github.com/Docker-Hub-frolvlad/docker-alpine-python3/pull/13
ENV PYTHONUNBUFFERED=1

RUN echo "**** install Python ****" && \
    apk add --no-cache python3 && \
    if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi && \
    \
    echo "**** install pip ****" && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --no-cache --upgrade pip setuptools wheel && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi

COPY ./requirements.txt app/requirements.txt
COPY app /app
WORKDIR /app

RUN pip3 install -r requirements.txt

EXPOSE  5000
CMD ["python3", "app.py"]
