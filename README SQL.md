# Repaso de SQL - Exploración de una sola tabla

## Descripción

Práctica de extracción y manipulación de datos con SQL sobre una sola
tabla (`ventas_tecnologia`), simulando el proceso de exploración inicial
que un Data Scientist realiza antes de modelar.

El archivo principal es `practica_sql.sql`, compatible con **SQLite** y
**DuckDB**, e incluye:

1. **Configuración**: creación de la tabla `ventas_tecnologia` y carga de
   datos de ejemplo (10 filas, incluyendo 2 registros con `categoria`
   en `NULL` a propósito).
2. **Selección simple**: productos y precios ordenados alfabéticamente.
3. **Filtrado crítico**: ventas en Colombia con `precio_unitario > 500`.
4. **Búsqueda de nulos**: registros sin `categoria` cargada.
5. **Agregación**: ingresos totales (`cantidad * precio_unitario`) por
   categoría, usando el alias `ingresos_totales`.
6. **HAVING**: categorías con más de $10.000 en ingresos totales.

Cada consulta está precedida por un comentario que explica la pregunta
de negocio que resuelve, y las palabras clave de SQL están en mayúsculas.

## Cómo ejecutarlo

**Con SQLite (línea de comandos):**

```bash
sqlite3 :memory: < practica_sql.sql
```

**Con Python (módulo `sqlite3`, sin dependencias externas):**

```python
import sqlite3

con = sqlite3.connect(":memory:")
cur = con.cursor()
with open("practica_sql.sql") as f:
    cur.executescript(f.read())
```

**Con DuckDB:**

```python
import duckdb

con = duckdb.connect()
con.execute(open("practica_sql.sql").read())
```

## Notas sobre errores comunes

- **WHERE vs HAVING**: el filtro por `ingresos_totales > 10000` (paso 6)
  usa `HAVING` porque es un filtro sobre un valor agregado (`SUM`).
- **GROUP BY**: como se selecciona `categoria` (columna real) junto con
  `SUM(...)` (columna agregada), `categoria` está incluida en el
  `GROUP BY`.
- **Alias en WHERE**: no se usa el alias `ingresos_totales` dentro de un
  `WHERE`, ya que el `WHERE` se ejecuta antes de que exista ese alias.

## Estructura del repositorio

```
.
├── practica_sql.sql   # Tabla + 5 consultas comentadas
└── README.md          # Este archivo
```
