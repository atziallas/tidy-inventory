FROM python:3.8.2-alpine3.11

RUN apk add --no-cache libxml2-dev libxslt-dev libc-dev g++ freetype-dev jpeg-dev gcc jpeg-dev zlib-dev libpq fontconfig
RUN apk add --no-cache --virtual .build-deps \
    python3-dev \
    musl-dev \
    postgresql-dev \
    build-base \
    linux-headers \
    && pip install --no-cache-dir psycopg2 psycopg2-binary Pillow\
    && apk del --no-cache .build-deps

COPY ./src/fonts /usr/share/fonts
#RUN fc-cache -f
RUN mkdir /code
WORKDIR /code
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY ./src .
RUN chmod +x start.sh

