map' _ [] = []                      -- Caso base: si la lista está vacía, devuelve []
map' f (x:xs) = f x : map' f xs     -- Aplica f a x y llama recursivamente con xs

cuadrado x = x^2                     -- Función que eleva un número al cuadrado

main :: IO ()
main = print $ map' cuadrado [1,2,3,4]  -- Aplica `cuadrado` a cada elemento de la lista