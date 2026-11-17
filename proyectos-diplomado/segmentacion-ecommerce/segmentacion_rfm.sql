-- GoogleSQL. Pedidos sintéticos, una fila por pedido y fecha de corte fija.
WITH parametros AS (
  SELECT DATE '2024-04-01' AS fecha_corte
),
pedidos AS (
  SELECT 'C01' AS cliente_id, 'P001' AS pedido_id, DATE '2024-03-30' AS fecha_compra, NUMERIC '100.00' AS monto
  UNION ALL SELECT 'C01', 'P002', DATE '2024-03-15', NUMERIC '200.00'
  UNION ALL SELECT 'C02', 'P003', DATE '2024-03-20', NUMERIC '50.00'
  UNION ALL SELECT 'C03', 'P004', DATE '2024-02-12', NUMERIC '85.00'
  UNION ALL SELECT 'C04', 'P005', DATE '2024-01-16', NUMERIC '120.00'
  UNION ALL SELECT 'C04', 'P006', DATE '2024-04-02', NUMERIC '500.00'
),
metricas AS (
  SELECT
    cliente_id,
    DATE_DIFF(fecha_corte, MAX(fecha_compra), DAY) AS recencia_dias,
    COUNT(DISTINCT pedido_id) AS frecuencia_pedidos,
    SUM(monto) AS valor_monetario
  FROM pedidos
  CROSS JOIN parametros
  WHERE fecha_compra <= fecha_corte
  GROUP BY cliente_id, fecha_corte
)
SELECT
  *,
  NTILE(4) OVER (ORDER BY recencia_dias DESC, cliente_id) AS puntaje_recencia,
  NTILE(4) OVER (ORDER BY frecuencia_pedidos, cliente_id) AS puntaje_frecuencia,
  NTILE(4) OVER (ORDER BY valor_monetario, cliente_id) AS puntaje_valor
FROM metricas
ORDER BY cliente_id;
