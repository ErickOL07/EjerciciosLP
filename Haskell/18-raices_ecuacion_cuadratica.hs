-- 18. Desarrollar el problema de encontrar las raíces de una ecuación cuadrática
-- del tipo 𝑎𝑥^2 + 𝑏𝑥 + 𝑐 = 0, donde a,b,c son los coeficientes. Recordar la
-- fórmula de ecuaciones cuadráticas:
-- 𝑥 = (−𝑏 ± √(𝑏^2 − 4𝑎𝑐))/2a

values :: x->x->(x,x)
values a b = (a,b)

cuad :: Double->Double->Double->(Double,Double)
cuad a b c
    |   (b^2 - 4*a*c) < 0 = error "No hay raíces reales."
    |   otherwise = values (((-b) + sqrt((b^2) - 4*a*c))/2*a) (((-b) - sqrt((b^2) - 4*a*c))/2*a)

main :: IO()

main = do

    putStrLn "Ingrese los coeficientes a, b, c de la ecuación a*x^2 + b*x + c = 0:"
    input <- getLine
    let a = read input::Double
    input <- getLine
    let b = read input::Double
    input <- getLine
    let c = read input::Double
    
    let (r1, r2) = cuad a b c
    putStrLn $ "Las raíces de la ecuación son:\n"++show r1 ++ "\n"++show r2