# Proyecto de Administración de Bases de Datos

Este repositorio contiene el trabajo realizado por el equipo en el contexto del proyecto de administración de bases de datos. El objetivo principal es definir el modelo de la base de datos, obtener el modelo lógico y luego desplegar este modelo en Oracle. Además, se aplicarán medidas de seguridad y otras prácticas relevantes a medida que avance el proyecto.

## Equipo

El equipo de este proyecto está compuesto por:

- Rodrigo Carreira
- Ivan Iroslavov
- Juan de Dios

## Contenido del Repositorio

El repositorio está organizado de la siguiente manera:

- **/Modelo_Base_Datos**: Esta carpeta contiene una imagen del modelo relacional de nuestra base de datos.

- **/Scripts**: Aquí se encuentran los scripts utilizados para la creación y mantenimiento de la base de datos en Oracle.

- **/ValoresTablas**: Contiene documentos con los valores que insertaremos en las filas de nuestras tablas en la base de datos.

## Modelo de la Base de Datos

El modelo de la base de datos se encuentra definido en el archivo [modelo.sql](/Documentación/modelo.sql). Este archivo incluye la estructura de las tablas, relaciones y restricciones necesarias para la base de datos.

<img src="https://github.com/rorro6787/rorro6787/blob/main/Images/ModeloDatosv1.PNG"/>


## Despliegue en Oracle

Para desplegar el modelo de la base de datos en tu Oracle, sigue las siguientes instrucciones detalladas:
- **Paso 1:** ejecuta en "system" el script Scripts/system.sql
- **Paso 2:** guarda en la siguiente ruta de tu ordenador C:\app\alumnos\admin\orcl\dpdump, el archivo ValoresTablas/Ejercicios.csv
- **Paso 3:** ejecuta en "lifefit" el script Scripts/lifefit.sql

## Medidas de Seguridad

Se aplicarán medidas de seguridad adecuadas durante el proceso de desarrollo y despliegue de la base de datos para garantizar la integridad y confidencialidad de los datos. Más detalles se proporcionarán en documentos específicos en la carpeta de Documentación.

## Contribuciones

Este proyecto es un trabajo en curso y se aprecian las contribuciones de cualquier persona interesada. Si tienes sugerencias, ideas o deseas contribuir de alguna manera, no dudes en abrir un problema o enviar una solicitud de extracción.

## Licencia

Este proyecto se encuentra bajo la Licencia [MIT](LICENSE).


