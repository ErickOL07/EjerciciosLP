# Importamos el módulo 're', que permite trabajar con expresiones regulares.
import re

# Definimos una lista llamada 'token_patrones' que contiene tuplas.
# Cada tupla tiene un nombre para el tipo de token y un patrón de expresión regular para identificarlo.
token_patrones = [
    ("OPERADOR", r"[+\-*/]"),  # Detecta operadores matemáticos: +, -, *, /
    ("NUMERO", r"\d+"),        # Detecta números enteros (uno o más dígitos seguidos).
    ("WHITESPACE", r"\s+")     # Detecta espacios en blanco (para ignorarlos más adelante).
]

# Definimos una función llamada 'tokenize' que recibe un texto como argumento.
# Esta función convierte el texto en una lista de tokens identificados según los patrones.
def tokenize(codigo_fuente):
    tokens = []  # Lista donde se almacenarán los tokens identificados.

    # Eliminamos espacios en blanco al inicio y final de la cadena antes de procesarla.
    codigo_fuente = codigo_fuente.strip()

    # Mientras haya caracteres en 'codigo_fuente', seguimos procesando la cadena.
    while codigo_fuente:
        matched = False  # Variable de control para saber si encontramos un token válido.

        # Recorremos cada tipo de token y su patrón correspondiente.
        for tipo_token, patron in token_patrones:
            # Intentamos hacer coincidir el patrón con el inicio de la cadena.
            match = re.match(patron, codigo_fuente)
            if match:  # Si encontramos una coincidencia:
                valor = match.group(0)  # Obtenemos el texto que coincidió con el patrón.
                tokens.append((tipo_token, valor))  # Guardamos el tipo de token y su valor en la lista de tokens.
                
                # Eliminamos el texto que coincidió en la cadena de entrada.
                # También eliminamos espacios en blanco al inicio para evitar procesarlos más adelante.
                codigo_fuente = codigo_fuente[len(valor):].lstrip()
                
                matched = True  # Marcamos que encontramos un token válido.
                break  # Salimos del bucle para volver a procesar desde el inicio de la cadena.

        # Si después de recorrer todos los patrones no encontramos ninguna coincidencia:
        if not matched:
            raise ValueError("Caracter inválido en la entrada")  # Lanzamos un error indicando que hay un carácter no reconocido.

    return tokens  # Retornamos la lista de tokens generada.

# Definimos la función 'main', que será el punto de entrada del programa.
def main():
    # Definimos una cadena de texto que representa una expresión matemática en notación postfija (RPN).
    codigo_fuente = "2 3 + 4*"  
    
    # Llamamos a la función 'tokenize' para analizar la cadena y extraer los tokens.
    tokens = tokenize(codigo_fuente)
    
    # Imprimimos la lista de tokens para ver el resultado del análisis léxico.
    print(tokens)

# Llamamos a la función 'main' para ejecutar el programa.
main()
