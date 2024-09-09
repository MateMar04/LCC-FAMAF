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
todaLaListaIgual (x : y : xs) = x == y && todaLaListaIgual (y : xs)

-- Ejercicio 4
maxMenorMin :: [Int] -> [Int] -> Bool
maxMenorMin [] [] = True
maxMenorMin [] _ = False
maxMenorMin _ [] = False
maxMenorMin [a] [b] = a < b
maxMenorMin (x : xs) (y : ys) = maximum xs < minimum ys

encontrarMultiplos :: Int -> (Int, Int)
encontrarMultiplos 0 = (0, 0)
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
sumaDePosicionesPares (x : _ : xs) = x + sumaDePosicionesPares xs

-- Ejercicio 7
paraTodo' :: [a] -> (a -> Bool) -> Bool
paraTodo' [] _ = True
paraTodo' (x : xs) f
  | f x == True = paraTodo' xs f
  | f x == False = False

existe' :: [a] -> (a -> Bool) -> Bool
existe' [] _ = False
existe' (x : xs) f
  | f x == True = True
  | f x == False = existe' xs f

sumatoria' :: [a] -> (a -> Int) -> Int
sumatoria' [] _ = 0
sumatoria' (x : xs) f = f x + sumatoria' xs f

productoria' :: [a] -> (a -> Int) -> Int
productoria' [] _ = 1
productoria' (x : xs) f = f x * productoria' xs f

-- Ejercicio 9
-- a
todosPares :: [Int] -> Bool
todosPares xs = paraTodo' xs esPar

esPar :: Int -> Bool
esPar x = mod x 2 == 0

-- b
hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo n ls = existe' ls (esDivisor n)

esDivisor :: Int -> Int -> Bool
esDivisor x y = mod x y == 0

-- c
sumaCuadrados :: Int -> Int
sumaCuadrados x = sumatoria' [0 .. x] (^ 2)

-- d
existeDivisor :: Int -> [Int] -> Bool
existeDivisor n ls = existe' ls (esDivisor n)

-- e
esPrimo :: Int -> Bool
esPrimo 0 = False
esPrimo 1 = False
esPrimo x = not (existeDivisor x [2 .. x - 1])

-- f
factorial' :: Int -> Int
factorial' x = productoria' [1 .. x] (* 1)

-- g
multiplicarPrimos :: [Int] -> Int
multiplicarPrimos xs = productoria' xs valorSiEsPrimo

valorSiEsPrimo :: Int -> Int
valorSiEsPrimo x = if esPrimo x then x else 1

-- h
esFib :: Int -> Bool
esFib x = existe' [0 .. x] (esIgualAFib x)

esIgualAFib :: Int -> Int -> Bool
esIgualAFib x y = fib y == x

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

-- i
todosFib :: [Int] -> Bool
todosFib xs = paraTodo' xs esFib

-- Ejercicio 10
-- a
duplica :: [Int] -> [Int]
duplica [] = []
duplica (x : xs) = x * 2 : duplica xs

-- b
duplica' :: [Int] -> [Int]
duplica' xs = map (* 2) xs

-- Ejercicio 11
-- a
buscarPrimos :: [Int] -> [Int]
buscarPrimos [] = []
buscarPrimos (x : xs)
  | esPrimo x = x : buscarPrimos xs
  | otherwise = buscarPrimos xs

-- b
buscarPrimos' :: [Int] -> [Int]
buscarPrimos' (x : xs) = filter esPrimo (x : xs)

-- 12
-- a
primerosIgualesA :: (Eq a) => a -> [a] -> [a]
primerosIgualesA _ [] = []
primerosIgualesA n (x : xs)
  | n == x = x : primerosIgualesA n xs
  | otherwise = []

-- b
primerosIgualesA' :: (Eq a) => a -> [a] -> [a]
primerosIgualesA' _ [] = []
primerosIgualesA' n (x : xs) = takeWhile (== n) (x : xs)

-- Ejercicio 13
-- a
primIguales :: (Eq a) => [a] -> [a]
primIguales [] = []
primIguales [x] = [x]
primIguales (x : y : xs)
  | x == y = x : primIguales (y : xs)
  | otherwise = [x]

-- b
primIguales' :: (Eq a) => [a] -> [a]
primIguales' [] = []
primIguales' (x : xs) = primerosIgualesA x (x : xs)

-- Ejercicio 14
cuantGen :: (b -> b -> b) -> b -> [a] -> (a -> b) -> b
-- (b -> b -> b) o z en la definicion es el operador binario
-- b o z es el elemento neutro del operador binario
-- [a] o (x:xs) en la def. es la lista de elementos
-- (a -> b) o t en la def. es la funcion que aplica el operator binario a un elemento de la lista
cuantGen _ z [] _ = z
cuantGen op z (x : xs) t = op (t x) (cuantGen op z xs t)

-- ejemplo: cuantGen (*) 1 [1, 2, 3, 4] (+1)
-- resultado: 120
-- multiplicacion de todos los elementos de la lista mas 1 (2*3*4*5)

-- Ejercicio 15
primQueCumplen :: [a] -> (a -> Bool) -> [a]
primQueCumplen [] _ = []
primQueCumplen (l : ls) p
  | p l = l : primQueCumplen ls p
  | otherwise = []

-- Ejercicio 16
--A es correcto
--B es incorrecto
--C es correcto
--D es correcto
--E es correcto
--F es correcto
--G es correcto
--H es correcto
--I es incorrecto

-- Ejercicio 17
-- a
-- Declaracion: f :: (a, b) -> b
-- Definicion: f (x, y) = y
--b
-- Declaracion: f :: (a, b) -> c
-- Definicion: f (x, y) = x + y
--c
-- Declaracion: f :: (a -> b) -> a -> b
-- Definicion g x = g x
--d
-- Declaracion: f :: (a -> b) -> [a] -> [b]
-- Definicion: g (x:xs) = g x : f xs

