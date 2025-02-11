-- 33. Obtener la raíz cuadrada de un elemento o de una lista usando map y lambda.
-- Nota: Puede utilizar la instrucción list? a fin de determinar si el elemento a
-- evaluar es una lista.

l :: [Double] = [1, 2, 3, 4, 9, 25, 49, 60, 81]

main :: IO()

main = do

    let r = map (\x -> sqrt(x)) l

    print r