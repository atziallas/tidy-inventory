FROM python:3.13.1-alpine3.21

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
RUN mkdir /code
WORKDIR /code
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY ./src .
RUN mkdir /logs
EXPOSE 80
CMD ["./wait.sh", "python", "-m", "gunicorn", "-c", "/code/gunicorn/config.py", "tidy.asgi:application"]

