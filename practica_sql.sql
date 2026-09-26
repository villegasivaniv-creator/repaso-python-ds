-- ============================================================
-- Práctica de SQL: Exploración inicial de datos
-- Tabla: ventas_tecnologia
-- Motor objetivo: SQLite / DuckDB
-- ============================================================

-- ------------------------------------------------------------
-- Paso 1: Configuración - Creación de la tabla y datos de ejemplo
-- ------------------------------------------------------------

DROP TABLE IF EXISTS ventas_tecnologia;

CREATE TABLE ventas_tecnologia (
    id_venta        INTEGER PRIMARY KEY,
    producto        TEXT,
    categoria       TEXT,
    precio_unitario REAL,
    cantidad        INTEGER,
    fecha           TEXT,
    pais            TEXT
);

INSERT INTO ventas_tecnologia
    (id_venta, producto, categoria, precio_unitario, cantidad, fecha, pais)
VALUES
    (1,  'Notebook Gamer',       'Computacion',  1500.00, 3,  '2024-01-05', 'Colombia'),
    (2,  'Mouse Inalambrico',    'Accesorios',     25.00, 20, '2024-01-06', 'Argentina'),
    (3,  'Monitor 27"',          'Computacion',   600.00, 5,  '2024-01-10', 'Colombia'),
    (4,  'Teclado Mecanico',     'Accesorios',    120.00, 10, '2024-01-12', 'Mexico'),
    (5,  'Auriculares Bluetooth','Audio',          80.00, 15, '2024-01-15', 'Colombia'),
    (6,  'Smartphone X',         NULL,            900.00, 4,  '2024-01-18', 'Argentina'),
    (7,  'Cargador Rapido',      'Accesorios',      35.00, 30, '2024-01-20', 'Mexico'),
    (8,  'Parlante Bluetooth',   'Audio',         150.00, 8,  '2024-01-22', 'Colombia'),
    (9,  'Tablet 10 pulgadas',   NULL,            700.00, 6,  '2024-01-25', 'Colombia'),
    (10, 'Notebook Ultraliviana','Computacion',  1800.00, 2,  '2024-01-28', 'Mexico');


-- ------------------------------------------------------------
-- Paso 2: Selección Simple
-- Pregunta de negocio: ¿Cuáles son todos los productos y su precio,
-- ordenados alfabéticamente por nombre?
-- ------------------------------------------------------------

SELECT
    producto,
    precio_unitario
FROM
    ventas_tecnologia
ORDER BY
    producto ASC;


-- ------------------------------------------------------------
-- Paso 3: Filtrado Crítico
-- Pregunta de negocio: ¿Qué ventas en Colombia superaron los $500
-- de precio unitario?
-- ------------------------------------------------------------

SELECT
    *
FROM
    ventas_tecnologia
WHERE
    pais = 'Colombia'
    AND precio_unitario > 500;


-- ------------------------------------------------------------
-- Paso 4: Búsqueda de Nulos
-- Pregunta de negocio: ¿Qué registros no tienen categoría cargada
-- (posible error de carga del equipo de ingeniería)?
-- ------------------------------------------------------------

SELECT
    *
FROM
    ventas_tecnologia
WHERE
    categoria IS NULL;


-- ------------------------------------------------------------
-- Paso 5: Análisis de Rendimiento (Agregación)
-- Pregunta de negocio: ¿Cuánto ingreso total generó cada categoría?
-- ------------------------------------------------------------

SELECT
    categoria,
    SUM(cantidad * precio_unitario) AS ingresos_totales
FROM
    ventas_tecnologia
GROUP BY
    categoria;


-- ------------------------------------------------------------
-- Paso 6: Filtro de Élite (HAVING)
-- Pregunta de negocio: ¿Qué categorías generaron más de $10.000
-- en ingresos totales?
-- Nota: no se puede filtrar por el alias "ingresos_totales" en el
-- WHERE porque el WHERE se ejecuta antes que el GROUP BY / SELECT;
-- por eso el filtro sobre el agregado va en HAVING.
-- ------------------------------------------------------------

SELECT
    categoria,
    SUM(cantidad * precio_unitario) AS ingresos_totales
FROM
    ventas_tecnologia
GROUP BY
    categoria
HAVING
    SUM(cantidad * precio_unitario) > 10000;
