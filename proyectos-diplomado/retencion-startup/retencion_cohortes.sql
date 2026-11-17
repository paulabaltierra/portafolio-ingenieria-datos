-- GoogleSQL. Actividad sintética; el mes de la primera actividad define la cohorte.
WITH actividad AS (
  SELECT 'C01' AS cliente_id, DATE '2024-01-04' AS fecha_evento
  UNION ALL SELECT 'C01', DATE '2024-02-02'
  UNION ALL SELECT 'C01', DATE '2024-02-15'
  UNION ALL SELECT 'C02', DATE '2024-01-09'
  UNION ALL SELECT 'C03', DATE '2024-02-04'
),
periodo AS (
  SELECT DATE_TRUNC(MAX(fecha_evento), MONTH) AS ultimo_mes FROM actividad
),
actividad_mensual AS (
  SELECT DISTINCT cliente_id, DATE_TRUNC(fecha_evento, MONTH) AS mes
  FROM actividad
),
clientes AS (
  SELECT cliente_id, MIN(mes) AS mes_cohorte
  FROM actividad_mensual
  GROUP BY cliente_id
),
cohortes AS (
  SELECT mes_cohorte, COUNT(*) AS clientes_iniciales
  FROM clientes
  GROUP BY mes_cohorte
),
activos AS (
  SELECT c.mes_cohorte, a.mes, COUNT(*) AS clientes_activos
  FROM actividad_mensual AS a
  JOIN clientes AS c USING (cliente_id)
  GROUP BY c.mes_cohorte, a.mes
)
SELECT
  c.mes_cohorte,
  DATE_DIFF(mes_observado, c.mes_cohorte, MONTH) AS meses_desde_primera_actividad,
  c.clientes_iniciales,
  COALESCE(a.clientes_activos, 0) AS clientes_activos,
  SAFE_DIVIDE(COALESCE(a.clientes_activos, 0), c.clientes_iniciales) AS tasa_retencion
FROM cohortes AS c
CROSS JOIN periodo AS p
CROSS JOIN UNNEST(GENERATE_DATE_ARRAY(c.mes_cohorte, p.ultimo_mes, INTERVAL 1 MONTH)) AS mes_observado
LEFT JOIN activos AS a ON a.mes_cohorte = c.mes_cohorte AND a.mes = mes_observado
ORDER BY c.mes_cohorte, mes_observado;
