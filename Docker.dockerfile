# Usar una imagen base con Python y Java (para Spark)
FROM openjdk:11

# Instalar Python y otras dependencias necesarias
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Establecer Python3 como predeterminado
RUN ln -s /usr/bin/python3 /usr/bin/python

# Copiar los archivos del proyecto al contenedor
WORKDIR /app
COPY . .

# Instalar dependencias de Python
RUN pip3 install --no-cache-dir \
    flask \
    pytest \
    pyspark \
    delta-spark

# Exponer el puerto de Flask
EXPOSE 5000

# Comando para ejecutar la aplicación
CMD ["python", "app.py"]
