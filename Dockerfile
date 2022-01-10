# Para saber en que lenguaje esta basado
FROM python:3.9-alpine

# Quien mantiene el proyecto (Opcional)
LABEL Adrian Perez

# Variable de entorno
ENV PYTHONUNBUFFERED 1

# Dependencias
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# Directorio para tener nuestra app
RUN mkdir /app
WORKDIR /app
COPY ./app /app

# Crear usuario para runnear la app (seguridad)
RUN adduser -D user
USER user

