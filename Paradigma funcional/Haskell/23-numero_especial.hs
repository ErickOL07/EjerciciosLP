-- 23. Existen algunos números que si elevamos cada uno de sus dígitos a la potencia
-- de su ubicación y sumamos sus resultados nos devuelve el mismo número.
-- Por ejemplo, si ingresamos 135 la sumatoria de la potencia de sus dígitos
-- sería la siguiente 1
-- 1 + 3
-- 2 + 5
-- 3 = 1 + 9 + 125 = 135, realizar un programa
-- que devuelva verdadero si se cumple esta propiedad y falso en caso contrario.

digitos :: Int->Int->Int
digitos n c
    |   n == 0 && c /= 0 = c
    |   n == 0 && c == 0 = 1
    |   otherwise = digitos (n `quot` 10) (c+1)

e1 :: Int->Int->Int->Int
e1 n d s
    |   n == 0 = s
    |   otherwise = e1 (n `quot` 10) ((digitos n 0)-1) (s + (n `rem` 10)^(digitos n 0))

especial :: Int->String
especial n
    |   e1 n 0 0 == n = "Verdadero"
    |   otherwise = "Falso"

main :: IO()

main = do

    putStrLn "Ingrese un número:"
    input <- getLine
    let n = read input::Int

    putStrLn (especial n)