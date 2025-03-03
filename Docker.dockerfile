FROM openjdk:11

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    curl \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Definir variables de entorno para Spark
ENV SPARK_VERSION=3.2.1
ENV HADOOP_VERSION=3.2
ENV SPARK_HOME=/opt/spark
ENV PATH="$SPARK_HOME/bin:$PATH"

# Descargar e instalar Spark
RUN curl -fsSL https://downloads.apache.org/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop$HADOOP_VERSION.tgz \
    | tar -xz -C /opt/ && \
    mv /opt/spark-$SPARK_VERSION-bin-hadoop$HADOOP_VERSION $SPARK_HOME

# Copiar archivos de la aplicación
WORKDIR /app 
COPY . /app

# Instalar dependencias de Python
RUN pip3 install --no-cache-dir -r requirements.txt

# Exponer el puerto de Flask
EXPOSE 5000

# Ejecutar la aplicación
CMD ["python3", "app.py"]
