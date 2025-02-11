-- 39. Implemente la función filter de los lenguajes funcionales a fin de que de una
-- lista se filtren los números pares.

l :: [Int] = [1,2,3,4,5,6,7,8,9,10]

main :: IO ()

main = do

    putStrLn "Lista original:"
    print l
    putStrLn "Números pares filtrados:"
    print (filter even l)