-- 32. Adicionar tres a cada elemento de una lista de número usando map y lambda.

l :: [Int] = [1, 2, 3, 4, 5]

main :: IO()

main = do

    let s = map (\x -> x + 3) l

    print s