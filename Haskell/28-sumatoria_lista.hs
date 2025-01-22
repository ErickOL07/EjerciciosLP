-- 28. Implemente una función que calcule la sumatoria de los números que se
-- encuentran en una lista.

l :: [Int]
l = [1, 2, 3, 4, 5]

sL :: [Int]->Int->Int
sL (x:xs) s
    |   null xs = s
    |   otherwise = sL xs (x+s)

sumatoriaL :: [Int]->Int
sumatoriaL l = sL l 0

main :: IO()

main = do

    putStrLn $ "La sumatoria de la lista "++show l ++ " es: "++show (sumatoriaL l)