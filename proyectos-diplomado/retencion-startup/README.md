# Retención de clientes de una startup tecnológica

El ejercicio original incluye reportes mensuales y trimestrales. La adaptación de portafolio calcula la **retención mensual por cohorte** con eventos sintéticos para que el resultado se pueda comprobar.

## Ejecutar la consulta

Abre [retencion_cohortes.sql](retencion_cohortes.sql) en el editor de BigQuery y ejecútala como GoogleSQL. Los eventos de ejemplo están dentro de la consulta.

La cohorte se define por el mes de la primera actividad observada. Se cuenta cada cliente una vez por mes, aunque tenga varios eventos. La tasa divide los clientes que tuvieron actividad en el mes observado entre el tamaño inicial de su cohorte.

| Cohorte | Mes transcurrido | Clientes iniciales | Clientes activos | Tasa |
| --- | ---: | ---: | ---: | ---: |
| Enero 2024 | 0 | 2 | 2 | 100 % |
| Enero 2024 | 1 | 2 | 1 | 50 % |
| Febrero 2024 | 0 | 1 | 1 | 100 % |

El ejemplo mide actividad observada durante el periodo cubierto por los datos. Para medir retención desde el alta, se necesitaría una fecha de alta independiente.
