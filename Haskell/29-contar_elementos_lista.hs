-- 29. Contar los elementos de una lista usando recursividad simple y tail recursión.

l :: [Int]
l = [1, 2, 3, 4, 5]

c1 :: [Int]->Int->Int
c1 (x:xs) c
    |   null xs = c
    |   otherwise = c1 xs (c + 1)


contarL :: [Int]->Int
contarL c = c1 l 1

main :: IO()

main = do
    
    putStrLn $ "La lista "++show l ++ " tiene "++show (contarL l) ++ " elementos."