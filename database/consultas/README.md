# Consultas

Ejecutar después de instalar el esquema y los datos de prueba (`../instalar.sql`).

| Archivo | Qué demuestra |
|---|---|
| `01_actualizaciones.sql` | `UPDATE` de precios y direcciones de mercados |
| `02_eliminaciones.sql` | `INSERT` + `DELETE` de registros ingresados por error |
| `03_listados_join.sql` | Consultas de 0 a 8 `JOIN`, incluida la trazabilidad de pedidos |
| `04_agrupaciones_kpis.sql` | `GROUP BY`, `HAVING` y agregaciones: productores, ventas y productos por territorio |
| `05_vista_ventas.sql` | Vista `vista_ventas_productor` y tres formas de usarla |
| `06_consultas_parametrizadas.sql` | `PREPARE` / `EXECUTE` con tres parámetros |
| `07_pruebas_acid.sql` | Atomicidad, consistencia, aislamiento y durabilidad. **Los 3 errores de la sección de consistencia son esperados**: prueban que las restricciones rechazan datos inválidos |
| `08_jsonb_nosql.sql` | Datos semiestructurados: inserción, extracción y actualización de `JSONB` |

Ejecuta `08_jsonb_nosql.sql` una sola vez: inserta el apiario 201 con llave fija.
