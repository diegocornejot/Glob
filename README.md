# Desafío de Ingeniería de Datos - Globant

## Descripción
Este proyecto corresponde al Desafío de Ingeniería de Datos de Globant, en el cual se implementó una API REST para la migración de datos entre bases de datos SQL a partir de archivos CSV. Además, se desarrollaron consultas SQL para extraer métricas relevantes sobre empleados contratados y se incluyeron pruebas automatizadas y contenedorización con Docker.

## Tecnologías utilizadas
- **Python** (Flask, PySpark, PyTest)
- **SQL** (Delta Tables)
- **Docker** (para contenedorización)
- **Azure Storage** (para almacenamiento de archivos CSV)

## Funcionalidades principales
### API REST
Se desarrolló una API que:
1. Recibe datos históricos desde archivos CSV.
2. Sube estos archivos a la nueva base de datos SQL.
3. Inserta registros en lotes (entre 1 y 1000 filas por solicitud).

### Endpoints
- `/api/metrics/employees_hired`: Devuelve el número de empleados contratados en 2021 dividido por trimestres y ordenado alfabéticamente por departamento y puesto de trabajo.
- `/api/metrics/top_hired_departments_2021`: Lista los departamentos que contrataron más empleados que la media de contrataciones en 2021, ordenados de mayor a menor.

### SQL para Métricas
Se crearon consultas SQL en PySpark para obtener información sobre contrataciones en el año 2021.

### Pruebas automatizadas
Se implementaron pruebas unitarias con **PyTest** para validar:
- Subida de archivos.
- Recuperación de datos de contrataciones.
- Validación de endpoints incorrectos.
- Verificación de estructura y contenido de las respuestas JSON.

### Contenedorización con Docker
Se creó un **Dockerfile** que:
1. Instala dependencias necesarias (Python, Spark, Java, etc.).
2. Configura Spark con Hadoop.
3. Copia el código fuente y las dependencias.
4. Expone el puerto 5000 para la API Flask.

## Instrucciones para ejecutar
### 1. Construcción y ejecución del contenedor Docker
```sh
# Construir la imagen
docker build -t globant-data-challenge .

# Ejecutar el contenedor
docker run -p 5000:5000 globant-data-challenge
```

### 2. Uso de la API
Para probar los endpoints, puedes usar herramientas como **Postman** o **cURL**:
```sh
curl -X GET http://localhost:5000/api/metrics/employees_hired
```
```sh
curl -X GET http://localhost:5000/api/metrics/top_hired_departments_2021
```

## Consideraciones adicionales
- Se utilizó almacenamiento en **Azure Storage** para la lectura de archivos CSV.
- Se recomendó una arquitectura escalable para la solución.
- Se optimizaron consultas con PySpark para mejorar el rendimiento.

## Conclusión
Este proyecto proporciona una solución escalable para la migración de datos desde archivos CSV a una base de datos SQL, facilitando el análisis de contrataciones mediante endpoints REST. Además, se aseguró la calidad del código con pruebas automatizadas y se contenedorizó la aplicación para facilitar su despliegue en cualquier entorno.

