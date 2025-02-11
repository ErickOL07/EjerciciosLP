-- 46. Convertir el programa anterior a Haskell.

module Main where

-- Definir la función 'curryPowerRecursive' que reciba un exponente 'p'
-- y retorne una función que eleve un número 'x' a la potencia 'p'.
curryPowerRecursive :: Integer -> Integer -> Integer
curryPowerRecursive p x = expRec p
  where
    -- Establecer el caso base: si el exponente es 0, retornar 1.
    expRec 0 = 1
    -- Calcular recursivamente: multiplicar 'x' por 'expRec (n - 1)' para n > 0.
    expRec n = x * expRec (n - 1)

-- Definir la función 'square' utilizando 'curryPowerRecursive' con el exponente 2.
square :: Integer -> Integer
square = curryPowerRecursive 2

-- Definir la función principal 'main' para mostrar el resultado en la consola.
main :: IO ()
main = do
  -- Imprimir el resultado de elevar 3 al cuadrado utilizando 'square'.
  -- Se espera que se muestre 9, ya que 3^2 = 9.
  print (square 3)