    -- 34. Realice una función que calcule el factorial de un número usando lambda.

    fact :: Int->Int

    fact = \x -> if x == 0
                then 1
                else x * fact (x - 1)


    main :: IO()

    main = do

        putStrLn "Ingrese un número:"
        input <- getLine
        let n = read input::Int

        let r = fact n

        print r