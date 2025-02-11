-- 41. Implementar el algoritmo de búsqueda binaria.
-- Nota: Utilice let para asignar valores a los índices del extremo izquierdo,
-- medio y derecho.

-- Función de búsqueda binaria (devuelve el índice del elemento si lo encuentra, -1 si no está)
busquedaBinaria :: [Int] -> Int -> Int
busquedaBinaria lista objetivo = aux lista objetivo 0 (length lista - 1)

-- Función auxiliar para la recursión
aux :: [Int] -> Int -> Int -> Int -> Int
aux lista objetivo izq der
    | izq > der = -1  -- Caso base: No encontrado
    | otherwise =
        let mid = (izq + der) `div` 2  -- Calculamos el índice medio
            valorMedio = lista !! mid  -- Obtenemos el valor en la posición media
        in if valorMedio == objetivo
            then mid  -- Si encontramos el número, retornamos su índice
            else if valorMedio < objetivo
                then aux lista objetivo (mid + 1) der  -- Buscar en la mitad derecha
                else aux lista objetivo izq (mid - 1)  -- Buscar en la mitad izquierda

main :: IO()

main = do
    -- Lista ordenada para la búsqueda binaria
    let lista = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]

    putStrLn "Lista ordenada:"
    print lista

    putStrLn "Ingrese el número a buscar:"
    input <- getLine
    let objetivo = read input :: Int  -- Convertimos la entrada a Int

    -- Llamamos a la búsqueda binaria
    let indice = busquedaBinaria lista objetivo

    -- Mostramos el resultado
    if indice == -1
        then putStrLn "Elemento no encontrado en la lista."
        else putStrLn $ "Elemento encontrado en el índice: " ++ show indice
