"""
Práctica de repaso de Python básico para Data Science.
Cubre: variables y tipos de datos, bucles + condicionales,
diccionarios y funciones (modularización).
"""

# ==========================================================
# Tarea 1: Definición de Variables
# ==========================================================

# Variables con distintos tipos de datos básicos
nombre_producto: str = "Auriculares Bluetooth"
precio: float = 15499.90
stock: int = 23
tiene_descuento: bool = True

# Frase resumen usando f-strings
print(f"El producto '{nombre_producto}' cuesta ${precio:.2f}, "
      f"hay {stock} unidades en stock y "
      f"{'sí' if tiene_descuento else 'no'} tiene descuento disponible.")

print("-" * 60)

# ==========================================================
# Tarea 2: Lógica de Negocio (Bucle + Condicional)
# ==========================================================

# Lista de precios de ejemplo
precios = [45.0, 120.5, 99.99, 250.0, 80.0]

# Recorremos la lista y clasificamos cada precio
for p in precios:
    if p > 100:
        categoria = "Caro"
    else:
        categoria = "Económico"
    print(f"Precio ${p:.2f} -> {categoria}")

print("-" * 60)

# ==========================================================
# Tarea 3: Estructura de Datos Compleja
# ==========================================================

# Diccionario que representa un almacén: producto -> stock
almacen = {
    "Auriculares Bluetooth": 23,
    "Teclado Mecánico": 10,
    "Mouse Inalámbrico": 35,
}

# Agregamos un nuevo producto al diccionario
almacen["Monitor 24 pulgadas"] = 8

# Consultamos el stock de un producto específico
producto_consultado = "Teclado Mecánico"
print(f"Stock de '{producto_consultado}': {almacen[producto_consultado]} unidades")

print("-" * 60)

# ==========================================================
# Tarea 4: Modularización con Funciones
# ==========================================================

def resumen_estadistico(numeros: list) -> dict:
    """
    Recibe una lista de números y devuelve un diccionario
    con la suma total, el promedio y la cantidad de elementos.
    """
    suma_total = sum(numeros)
    cantidad = len(numeros)
    promedio = suma_total / cantidad if cantidad > 0 else 0

    return {
        "suma_total": suma_total,
        "promedio": promedio,
        "cantidad": cantidad,
    }


# Llamamos a la función con una lista de ejemplo
lista_ejemplo = [10, 25, 30, 45, 60]
resultado = resumen_estadistico(lista_ejemplo)

print(f"Resumen estadístico de {lista_ejemplo}:")
print(resultado)
