-- 45. Modifique su programa de la exponenciación usando recursividad y currying.

curryPower :: Int -> (Int -> Int)
curryPower = \exponente -> \base ->
    if exponente == 0
        then 1
        else base * (curryPower (exponente - 1) base)
    

main :: IO()

main = do

    putStrLn "Ingrese la base:"
    input <- getLine
    let b = read input::Int

    putStrLn "Ingrese el exponente:"
    input <- getLine
    let e = read input::Int

    let r = ((curryPower e) b)

    putStrLn $ ""++show b ++ "^"++show e ++ " = "++show r