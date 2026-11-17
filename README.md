# Portafolio de ingeniería de datos y automatización

Proyectos en Python, SQL, PostgreSQL, Azure y Power BI. Las demos muestran cómo integro y valido datos operativos, automatizo tareas repetitivas y preparo modelos para análisis. El portafolio también incluye mi trabajo final de maestría y casos del diplomado.

## Proyectos de ingeniería de datos y automatización

| Proyecto | Qué demuestra | Tecnologías |
| --- | --- | --- |
| [Ingesta para auditoría de cortes](https://github.com/paulabaltierra/ingesta-auditoria-cortes) | Demo de ingesta diaria con seis fuentes ficticias de archivos. Procesa los CSV disponibles, normaliza los movimientos y usa una clave por fuente y fecha operativa, con parte opcional, y un hash SHA-256 para reconocer archivos ya cargados y detectar modificaciones posteriores. Primera versión comprobada en PostgreSQL local y pendiente de publicar. | Python, PostgreSQL, SQL |
| [Servicios técnicos](https://github.com/paulabaltierra/dashboard--serviciosTecnicos) | Réplica en Azure de un caso de mantenimiento. Transforma órdenes de servicio con PySpark y construye tablas de hechos y dimensiones para medir los SLA de respuesta y reparación e identificar fallas recurrentes. | Azure Data Lake, Synapse, PySpark, Power BI |
| [Asistencia de RH](https://github.com/paulabaltierra/dashboard--asistencia) | Réplica en Azure de un caso de control de asistencia. Los notebooks preparan dimensiones, procesan registros de checador y calculan la jornada esperada a partir de calendarios y turnos. El modelo permite revisar retardos, ausencias y cumplimiento de horarios. | Azure Data Lake, Synapse, PySpark, Power BI |
| [Proyección de consumo](https://github.com/paulabaltierra/dashboadr--proyeccion--proteina) | Réplica en desarrollo para estimar el consumo de proteína con datos ficticios de ventas y compras de cinco restaurantes durante 2020. Incluye archivos de muestra, un modelo semántico y un reporte. Queda pendiente desarrollar los notebooks de ingesta y transformación. | Azure Data Lake, Power BI |

## Trabajo final de maestría

[Morosidad y antigüedad de clientes](https://github.com/paulabaltierra/morosidad-antiguedad-clientes) analiza la relación entre antigüedad, actividad de compra y riesgo de morosidad. El flujo reproducible usa datos sintéticos, segmentación Pareto 80/20, correlación point-biserial y una prueba de permutación para evaluar segmentos de cartera. Trabajo final de la Maestría en Ciencia de Datos para Negocios, concluida en octubre de 2026.

## Casos del diplomado

| Caso | Qué analiza | Tecnologías |
| --- | --- | --- |
| [Retención de clientes de una startup](proyectos-diplomado/retencion-startup/README.md) | Consulta autocontenida con eventos sintéticos para calcular la retención mensual por cohorte. | SQL, BigQuery |
| [Segmentación de clientes de comercio electrónico](proyectos-diplomado/segmentacion-ecommerce/README.md) | Consulta autocontenida de recencia, frecuencia y valor monetario (RFM) con fecha de corte fija. | SQL, BigQuery |
| [Análisis de COVID-19](proyectos-diplomado/analisis-covid/README.md) | Explora tendencias temporales y geográficas en datos públicos. | SQL, BigQuery |
| [Retención en telecomunicaciones](proyectos-diplomado/telecom-powerbi/README.md) | Examina la pérdida de clientes y presenta sus indicadores en un reporte interactivo. | Power BI, DAX, Excel |

## Datos de ejemplo

Las réplicas en Azure se inspiran en problemas que trabajé en contextos laborales y usan datos de demostración. El proyecto de morosidad usa datos sintéticos. Las adaptaciones de retención y RFM incluyen datos sintéticos dentro de las consultas.
