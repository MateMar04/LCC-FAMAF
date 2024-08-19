module Practico1 where

-- Practico 1 solo laboratorio

-- Ejercicio 1
esCero :: Int -> Bool
esCero 0 = True
esCero _ = False

esCero' :: Int -> Bool
esCero' n = n == 0

esPositivo :: Int -> Bool
esPositivo x
  | x > 0 = True
  | x <= 0 = False

esVocal :: Char -> Bool
esVocal x
  | x == 'a' || x == 'e' || x == 'i' || x == 'o' || x == 'u' = True
  | otherwise = False

valorAbsoluto :: Int -> Int
valorAbsoluto x
  | x >= 0 = x
  | x < 0 = (-x)

-- Ejercicio 2
paraTodo :: [Bool] -> Bool
paraTodo [] = True
paraTodo (x : xs)
  | x == True = paraTodo xs
  | x /= True = False

sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x : xs) = x + sumatoria xs

productoria :: [Int] -> Int
productoria [] = 1
productoria (x : xs) = (x * productoria xs)

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)

promedio :: [Int] -> Int
promedio [] = 0
promedio (x : xs) = sumatoria (x : xs) `div` length (x : xs)

-- Ejercicio 3

-- Variable Libre: xs, tipo: Lista
-- Variable Ligada: i, tipo: Int
todosMayoresACero :: [Int] -> Bool
todosMayoresACero [] = True
todosMayoresACero (x : xs)
  | x > 0 = todosMayoresACero xs
  | otherwise = False

-- Variable Libre: xs, tipo: Lista
-- Variable Ligada: i, tipo: Int
existeEnLista :: [Int] -> Int -> Bool
existeEnLista [] _ = False
existeEnLista (x : xs) n
  | x /= n = existeEnLista xs n
  | x == n = True

-- Variable Libre: xs, tipo: Lista
-- Variable Ligada: i, tipo: Int
todaLaListaIgual :: [Int] -> Bool
todaLaListaIgual [] = True
todaLaListaIgual [_] = True
todaLaListaIgual (x : y : xs) = x == y && todaLaListaIgual (y:xs)

-- Ejercicio 4
maxMenorMin :: [Int] -> [Int] -> Bool
maxMenorMin [] [] = True
maxMenorMin [] _ = False
maxMenorMin _ [] = False
maxMenorMin [a] [b] = a < b
maxMenorMin (x:xs) (y:ys) = maximum xs < minimum ys

encontrarMultiplos :: Int -> (Int, Int)
encontrarMultiplos 0 = (0,0)
encontrarMultiplos 0 = (1,1)
encontrarMultiplos n = undefined

-- Ejercicio 5
todosTrue :: [Bool] -> Bool
todosTrue [] = True
todosTrue (x : xs)
  | x == True = todosTrue xs
  | x /= True = False

-- Ejercicio 6
elMasGrande :: [Int] -> Int
elMasGrande [] = 0
elMasGrande [n] = n
elMasGrande (x : xs) = max x (elMasGrande xs)

productoDeElementosPares :: [Int] -> Int
productoDeElementosPares [] = 1
productoDeElementosPares (x : xs)
  | x `mod` 2 == 0 = x * productoDeElementosPares xs
  | x `mod` 2 /= 0 = productoDeElementosPares xs

sumaDePosicionesPares :: [Int] -> Int
sumaDePosicionesPares [] = 0
sumaDePosicionesPares (x:_:xs) = x + sumaDePosicionesPares xs


