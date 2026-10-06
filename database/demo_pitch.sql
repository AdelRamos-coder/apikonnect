-- =====================================================================
--  API-KONNECT · Demo en vivo para el pitch
--  Ejecutar después de 01_esquema.sql y 02_datos_prueba.sql
--  Cada bloque responde una pregunta de negocio en una sola consulta.
--  Nota: los datos son de prueba (simulados) para validar el modelo.
-- =====================================================================


-- 1. LA RED EN NÚMEROS ------------------------------------------------
--    "¿Qué tamaño tiene la red que modelamos?"

SELECT
    (SELECT COUNT(*) FROM apicultor)                           AS apicultores,
    (SELECT COUNT(*) FROM apiario)                             AS apiarios,
    (SELECT COUNT(*) FROM consumidor)                          AS consumidores,
    (SELECT COUNT(*) FROM pedido)                              AS pedidos,
    (SELECT COUNT(DISTINCT id_departamento) FROM municipio)    AS departamentos,
    (SELECT COUNT(*) FROM municipio)                           AS municipios,
    (SELECT TO_CHAR(SUM(cantidad * precio_unitario), 'FM$999,999,999,999')
       FROM detalle_pedido)                                    AS ventas_totales_cop;


-- 2. TRAZABILIDAD: DEL FRASCO A LA COLMENA ----------------------------
--    "Un consumidor de Medellín compró miel. ¿Quién la produjo, en qué apiario,
--     en qué municipio y de qué cosecha salió?"

SELECT
    p.id_pedido,
    cons.nombre          AS consumidor,
    pr.tipo_producto     AS producto,
    l.id_lote            AS lote,
    c.fecha              AS fecha_cosecha,
    api.ubicacion        AS apiario,
    mu.nombre            AS municipio_apiario,
    a.nombre             AS apicultor
FROM pedido p
JOIN consumidor     cons ON cons.id_consumidor = p.id_consumidor
JOIN detalle_pedido dp   ON dp.id_pedido       = p.id_pedido
JOIN producto       pr   ON pr.id_producto     = dp.id_producto
JOIN lote           l    ON l.id_lote          = dp.id_lote
JOIN cosecha        c    ON c.id_cosecha       = l.id_cosecha
JOIN apiario        api  ON api.id_apiario     = c.id_apiario
JOIN municipio      mu   ON mu.id_municipio    = api.id_municipio
JOIN apicultor      a    ON a.id_apicultor     = api.id_apicultor
WHERE p.id_pedido = 57;   -- miel comprada en Medellín, de un apiario en Santa Elena


-- 3. SALUD DE LA COLMENA: ALERTAS IoT ACTIVAS -------------------------
--    "¿Qué colmenas necesitan atención hoy y a quién llamamos?"

SELECT
    al.tipo_alerta,
    al.mensaje,
    m.temperatura,
    m.humedad,
    api.ubicacion  AS apiario,
    a.nombre       AS apicultor,
    a.telefono
FROM alerta al
JOIN medicion_ambiental m   ON m.id_medicion  = al.id_medicion
JOIN apiario            api ON api.id_apiario = m.id_apiario
JOIN apicultor          a   ON a.id_apicultor = api.id_apicultor
WHERE al.estado = 'activa'
ORDER BY al.fecha DESC;


-- 4. ECONOMÍA RURAL: VENTAS POR DEPARTAMENTO --------------------------
--    "¿Dónde se mueve el dinero de la red?"

SELECT
    d.nombre                                   AS departamento,
    COUNT(DISTINCT a.id_apicultor)             AS productores,
    COUNT(DISTINCT p.id_pedido)                AS pedidos,
    TO_CHAR(SUM(dp.cantidad * dp.precio_unitario), 'FM$9,999,999,999') AS ventas_cop
FROM departamento d
JOIN municipio      m  ON m.id_departamento = d.id_departamento
JOIN apicultor      a  ON a.id_municipio    = m.id_municipio
JOIN apiario        ap ON ap.id_apicultor   = a.id_apicultor
JOIN cosecha        c  ON c.id_apiario      = ap.id_apiario
JOIN lote           l  ON l.id_cosecha      = c.id_cosecha
JOIN detalle_pedido dp ON dp.id_lote        = l.id_lote
JOIN pedido         p  ON p.id_pedido       = dp.id_pedido
GROUP BY d.nombre
ORDER BY SUM(dp.cantidad * dp.precio_unitario) DESC;


-- 5. MÁS ALLÁ DE LA MIEL: DIVERSIFICACIÓN DE PRODUCTOS ----------------
--    "¿Qué productos de la colmena generan más valor?"

SELECT
    pr.tipo_producto                                   AS producto,
    pr.unidad,
    SUM(dp.cantidad)                                   AS unidades_vendidas,
    TO_CHAR(SUM(dp.cantidad * dp.precio_unitario), 'FM$9,999,999,999') AS ventas_cop
FROM producto pr
JOIN detalle_pedido dp ON dp.id_producto = pr.id_producto
GROUP BY pr.id_producto, pr.tipo_producto, pr.unidad
ORDER BY SUM(dp.cantidad * dp.precio_unitario) DESC;


-- 6. LISTOS PARA IoT / BIG DATA: DATOS SEMIESTRUCTURADOS (JSONB) ------
--    "Las mediciones y la geolocalización no caben en columnas fijas."

SELECT
    id_apiario,
    ubicacion,
    ubicacion_geografica -> 'coordenadas' ->> 'latitud'  AS latitud,
    ubicacion_geografica -> 'coordenadas' ->> 'longitud' AS longitud,
    ubicacion_geografica ->> 'altitud_msnm'              AS altitud_msnm
FROM apiario
WHERE ubicacion_geografica IS NOT NULL
LIMIT 5;


-- 7. CONFIABILIDAD: LA BASE SE DEFIENDE SOLA --------------------------
--    "¿Qué pasa si alguien intenta meter un precio negativo?"
--    (Debe fallar: restricción CHECK precio >= 0)

UPDATE producto SET precio = -500 WHERE id_producto = 100;
