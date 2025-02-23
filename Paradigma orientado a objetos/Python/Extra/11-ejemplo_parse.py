# Importamos el módulo 're' para trabajar con expresiones regulares
import re

# Definimos una lista de patrones para los tokens que queremos reconocer en la expresión
token_patrones = [
    ("OPERADOR", r"[+\-*/]"),  # Coincide con operadores aritméticos: +, -, *, /
    ("NUMERO", r"\d+"),        # Coincide con números enteros (uno o más dígitos)
    ("WHITESPACE", r"\s+")     # Coincide con espacios en blanco (para ignorarlos)
]

# Función para dividir la entrada en tokens
def tokenize(codigo_fuente):
    tokens = []  # Lista donde almacenaremos los tokens reconocidos
    codigo_fuente = codigo_fuente.strip()  # Eliminamos espacios en blanco iniciales y finales
    
    # Mientras quede código por procesar
    while codigo_fuente:
        matched = False  # Bandera para saber si encontramos un token válido

        # Recorremos los patrones de tokens definidos
        for tipo_token, patron in token_patrones:
            match = re.match(patron, codigo_fuente)  # Intentamos hacer coincidir un patrón al inicio de la cadena
            if match:
                valor = match.group(0)  # Obtenemos el valor coincidente
                tokens.append((tipo_token, valor))  # Añadimos el token a la lista
                codigo_fuente = codigo_fuente[len(valor):].lstrip()  # Eliminamos el token procesado y espacios en blanco
                matched = True  # Marcamos que encontramos un token válido
                break  # Salimos del bucle para empezar a buscar el siguiente token
        
        # Si no encontramos un token válido, lanzamos un error
        if not matched:
            raise ValueError("Caracter inválido en la entrada")
    
    return tokens  # Retornamos la lista de tokens

# Función para analizar la expresión y construir una estructura de datos representando la operación
def parseExp(tokens):
    pila = []  # Pila donde almacenaremos los números y operadores en formato de árbol
    
    # Recorremos cada token en la lista de tokens
    for tipo_token, valor in tokens:
        if tipo_token == "NUMERO":
            pila.append(int(valor))  # Convertimos el número en entero y lo agregamos a la pila
        elif tipo_token == "OPERADOR":
            if valor in ("+", "-", "*", "/"):  # Verificamos que sea un operador válido
                der = pila.pop()  # Sacamos el último número de la pila (operando derecho)
                izq = pila.pop()  # Sacamos el penúltimo número de la pila (operando izquierdo)
                pila.append((valor, izq, der))  # Guardamos la operación en la pila como una tupla (operador, izq, der)
            else:
                raise ValueError("Operador no reconocido")  # Error si el operador no es válido
        else:
            raise ValueError("Token no reconocido")  # Error si el token no es un número ni un operador
    
    # Al final, la pila debe contener exactamente una expresión válida
    if len(pila) != 1:
        raise ValueError("Expresión inválida")
    
    return pila[0]  # Retornamos la estructura de la expresión

# Función para evaluar la expresión representada como árbol de operaciones
def evaluarExp(expr):
    if isinstance(expr, int):  # Si la expresión es un número, simplemente lo retornamos
        return expr
    elif isinstance(expr, tuple):  # Si la expresión es una tupla (operación)
        operador, izq, der = expr  # Extraemos el operador y los operandos

        # Evaluamos según el operador
        if operador == "+":
            return evaluarExp(izq) + evaluarExp(der)  # Llamadas recursivas para evaluar los operandos y sumarlos
        elif operador == "*":
            return evaluarExp(izq) * evaluarExp(der)  # Multiplicamos los operandos evaluados
        else:
            raise ValueError("Operador no válido")  # Error si el operador no es soportado
    else:
        raise ValueError("Expresión inválida")  # Error si la estructura de la expresión es incorrecta

# Función principal del programa
def main():
    codigo_fuente = "2 3 + 4 *"  # Definimos una expresión en notación postfija (RPN)
    
    tokens = tokenize(codigo_fuente)  # Convertimos la cadena en una lista de tokens
    print(tokens)  # Mostramos los tokens generados

    parse_exp = parseExp(tokens)  # Analizamos la expresión y la convertimos en una estructura
    print(parse_exp)  # Mostramos la estructura de la expresión

    res = evaluarExp(parse_exp)  # Evaluamos la expresión
    print(res)  # Imprimimos el resultado final

# Ejecutamos la función principal
main()
