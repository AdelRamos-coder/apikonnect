-- Instalación completa de API-KONNECT (sin Docker)
-- Desde la carpeta database/, conectado a una base vacía:
--   createdb apikonnect
--   psql -d apikonnect -f instalar.sql
-- En pgAdmin: abre y ejecuta 01_esquema.sql y luego 02_datos_prueba.sql.

\set ON_ERROR_STOP on
\echo '1/2 Creando esquema (33 tablas)...'
\i 01_esquema.sql
\echo '2/2 Cargando datos de prueba...'
\i 02_datos_prueba.sql
\echo 'Listo. Prueba: psql -d apikonnect -f demo_pitch.sql'
