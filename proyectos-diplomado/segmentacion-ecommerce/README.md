# Segmentación de clientes de comercio electrónico

El ejercicio original organiza clientes según recencia, frecuencia y valor monetario (RFM). Esta adaptación calcula y puntúa las tres métricas con pedidos sintéticos.

## Ejecutar la consulta

Abre [segmentacion_rfm.sql](segmentacion_rfm.sql) en BigQuery y ejecútala como GoogleSQL. Los pedidos de ejemplo están dentro de la consulta y cada fila representa un pedido.

- **Recencia:** días entre la última compra y el 1 de abril de 2024.
- **Frecuencia:** número de pedidos distintos hasta la fecha de corte.
- **Valor monetario:** suma de los importes hasta esa fecha.

El cliente `C01` debe devolver **2 días, 2 pedidos y 300.00**. El pedido del 2 de abril debe quedar fuera del cálculo de `C04`, cuyo valor es **120.00**. Los puntajes van del 1 al 4 y se desempata por identificador para que el ejemplo sea reproducible. En una aplicación real, convendría acordar cómo tratar los empates y qué reglas convierten los puntajes en segmentos de negocio.
