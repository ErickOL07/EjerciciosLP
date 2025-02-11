-- 38. Implemente la función map usando lambda y aplíquela a una programa que
-- eleve al cuadrado los elementos de una lista.

l :: [Int] = [1, 2, 3, 4, 5]

main :: IO()

main = do

    let s = map (\x -> x^2) l

    print s