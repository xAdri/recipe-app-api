# Para saber en que lenguaje esta basado
FROM python:3.7-alpine

# Quien mantiene el proyecto (Opcional)
LABEL Adrian Perez

# Variable de entorno
ENV PYTHONUNBUFFERED 1

# Dependencias
COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
      gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps

# Directorio para tener nuestra app
RUN mkdir /app
WORKDIR /app
COPY ./app /app

# Crear usuario para runnear la app (seguridad)
RUN adduser -D user
USER user

