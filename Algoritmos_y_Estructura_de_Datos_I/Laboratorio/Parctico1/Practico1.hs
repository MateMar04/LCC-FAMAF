module Practico1 where

-- Practico 1 solo laboratorio

-- Ejercicio 1
-- 1
-- Consigna: verifica si un entero es igual a 0.
esCero :: Int -> Bool
esCero 0 = True
esCero _ = False

esCero' :: Int -> Bool
esCero' n = n == 0

-- 2
-- Consigna: verifica si un entero es estrictamente mayor a 0.
esPositivo :: Int -> Bool
esPositivo x
  | x > 0 = True
  | x <= 0 = False

-- 3
-- Consigna: verifica si un caracter es una vocal en min ́uscula.
esVocal :: Char -> Bool
esVocal x
  | x == 'a' || x == 'e' || x == 'i' || x == 'o' || x == 'u' = True
  | otherwise = False

-- 4
-- Consigna: devuelve el valor absoluto de un entero ingresado.
valorAbsoluto :: Int -> Int
valorAbsoluto x
  | x >= 0 = x
  | x < 0 = (-x)

-- Ejercicio 2
-- a
-- Consigna: verifica que todos los elementos de una lista sean True.
paraTodo :: [Bool] -> Bool
paraTodo [] = True
paraTodo (x : xs)
  | x == True = paraTodo xs
  | x /= True = False

-- b
-- Consigna: calcula la suma de todos los elementos de una lista de enteros.
sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x : xs) = x + sumatoria xs

-- c
-- Consigna: que calcula el producto de todos los elementos de la lista de enteros.
productoria :: [Int] -> Int
productoria [] = 1
productoria (x : xs) = (x * productoria xs)

-- d
-- Consigna: toma un numero n y calcula n!
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- e
-- Consigna: Utiliz ́a la funcion sumatoria para definir, promedio :: [Int] -> Int, que toma una lista de numeros no vacia y calcula el valor promedio (truncado, usando division entera).
promedio :: [Int] -> Int
promedio [] = 0
promedio (x : xs) = sumatoria (x : xs) `div` length (x : xs)

-- Ejercicio 3

-- a
-- Consigna: verifica si todos los elementos de una lista son mayores a cero.
-- Variable Libre: xs, tipo: Lista
-- Variable Ligada: i, tipo: Int
todosMayoresACero :: [Int] -> Bool
todosMayoresACero [] = True
todosMayoresACero (x : xs)
  | x > 0 = todosMayoresACero xs
  | otherwise = False

-- b
-- Consigna: verifica si un elemento pertenece a una lista.
-- Variable Libre: xs, tipo: Lista
-- Variable Ligada: i, tipo: Int
existeEnLista :: [Int] -> Int -> Bool
existeEnLista [] _ = False
existeEnLista (x : xs) n
  | x /= n = existeEnLista xs n
  | x == n = True

-- d
-- Consigna: verifica si todos los elementos de una lista son iguales.
-- Variable Libre: xs, tipo: Lista
-- Variable Ligada: i, tipo: Int
todaLaListaIgual :: [Int] -> Bool
todaLaListaIgual [] = True
todaLaListaIgual [_] = True
todaLaListaIgual (x : y : xs) = x == y && todaLaListaIgual (y : xs)

-- Ejercicio 4
-- a
-- Ya hecho anteriormente (productoria)
-- b
-- Ya hecho anteroirmente (promedio)

-- c
-- Consigna: verifica si el maximo de la primera lista es menor que el minimo de la segunda.
-- ⟨Max i : 0 ≤ i < #xs : xs.i ⟩ < ⟨Min i : 0 ≤ i < #ys : ys.i ⟩
maxMenorMin :: [Int] -> [Int] -> Bool
maxMenorMin [] [] = True
maxMenorMin [] _ = False
maxMenorMin _ [] = False
maxMenorMin [a] [b] = a < b
maxMenorMin (x : xs) (y : ys) = maximum xs < minimum ys

-- d
-- Consigna: verifica si un numero n es multiplo de otros dos mayores a dos pero menores a n.
-- ⟨ ∃ i, j : (2 ≤ i < n) ∧ (2 ≤ j < n) : i ∗ j = n ⟩
existenMultiplos :: Int -> Bool
existenMultiplos n
  | n < 4 = False
  | otherwise = existePar 2
  where
    existePar i
      | i >= n = False
      | let j = n `div` i in j >= 2 && i * j == n = True
      | otherwise = existePar (i + 1)

-- Ejercicio 5
-- Consigna: verifica que todos los elementos de una lista son True
-- todos.xs ≡ ⟨ ∀ i : 0 ≤ i < #xs : xs.i ⟩

todosTrue :: [Bool] -> Bool
todosTrue [] = True
todosTrue (x : xs)
  | x == True = todosTrue xs
  | x /= True = False

-- Ejercicio 6
-- b
-- Consigna: n es el elemento m ́as grande de xs.
elMasGrande :: [Int] -> Int
elMasGrande [] = 0
elMasGrande [n] = n
elMasGrande (x : xs) = max x (elMasGrande xs)

-- c
-- Consigna: El producto de los elementos pares de xs.
productoDeElementosPares :: [Int] -> Int
productoDeElementosPares [] = 1
productoDeElementosPares (x : xs)
  | x `mod` 2 == 0 = x * productoDeElementosPares xs
  | x `mod` 2 /= 0 = productoDeElementosPares xs

-- d
-- Consigna: La suma de los elementos en posici ́on par de xs.
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
-- Consigna: verifica si todos los elementos de una lista son pares.
todosPares :: [Int] -> Bool
todosPares xs = paraTodo' xs esPar

esPar :: Int -> Bool
esPar x = mod x 2 == 0

-- b
-- Consigna: verifica si existe algun numero dentro del segundo parametro quesea multiplo del primer parametro.
hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo n ls = existe' ls (esDivisor n)

esDivisor :: Int -> Int -> Bool
esDivisor x y = mod x y == 0

-- c
-- Consigna: dado un n ́umero no negativo n, calcula la suma de los primeros n cuadrados, es decir ⟨Sum i : 0 ≤ i < n : i⟩
sumaCuadrados :: Int -> Int
sumaCuadrados x = sumatoria' [0 .. x] (^ 2)

-- d
-- Consigna: que dado en entero n y una lista ls, devuelve True si y solo si, existe alg ́un elemento en ls que divida a n
existeDivisor :: Int -> [Int] -> Bool
existeDivisor n ls = existe' ls (esDivisor n)

-- e
-- Consigna: que dado un enteron, devuelve True si y solo si n es primo.
esPrimo :: Int -> Bool
esPrimo 0 = False
esPrimo 1 = False
esPrimo x = not (existeDivisor x [2 .. x - 1])

-- f
-- Consigna: definir factorial sin usar recursion.
factorial' :: Int -> Int
factorial' x = productoria' [1 .. x] (* 1)

-- g
-- Consigna: calcula el producto de todos los numeros primos de una lista.

multiplicarPrimos :: [Int] -> Int
multiplicarPrimos xs = productoria' xs valorSiEsPrimo

valorSiEsPrimo :: Int -> Int
valorSiEsPrimo x = if esPrimo x then x else 1

-- h
-- Consigna: que dado un entero n, devuelve True si y s ́olo si n est ́a en la sucesion de Fibonacci.
esFib :: Int -> Bool
esFib x = existe' [0 .. x] (esIgualAFib x)

esIgualAFib :: Int -> Int -> Bool
esIgualAFib x y = fib y == x

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

-- i
-- Consigna: dada una lista xs de enteros, devuelva si todos los elementos de la lista pertenecen (o no) a la sucesion de Fibonacci.
todosFib :: [Int] -> Bool
todosFib xs = paraTodo' xs esFib

-- Ejercicio 10
-- Consigna: Programa una funcion que dada una lista de numeros xs, devuelve la lista que resulta de duplicar cada valor de xs.

-- a
-- Consigna: Definila usando recursion.
duplica :: [Int] -> [Int]
duplica [] = []
duplica (x : xs) = x * 2 : duplica xs

-- b
-- Consigna: Definila usando map.
duplica' :: [Int] -> [Int]
duplica' xs = map (* 2) xs

-- Ejercicio 11
-- Consigna: Programa una funcion que dada una lista de numeros xs, calcula una lista que tiene como elementos aquellos numeros de xs que son primos.

-- a
-- Consigna: Definila usando recursion.
buscarPrimos :: [Int] -> [Int]
buscarPrimos [] = []
buscarPrimos (x : xs)
  | esPrimo x = x : buscarPrimos xs
  | otherwise = buscarPrimos xs

-- b
-- Consigna: Definila usando filter.
buscarPrimos' :: [Int] -> [Int]
buscarPrimos' (x : xs) = filter esPrimo (x : xs)

-- 12
-- Consigna: La funcion primIgualesA toma un valor y una lista, y calcula el tramo inicial m ́as largo de la lista cuyos elementos son iguales a ese valor.

-- a
-- Consigna: Definila usando recursion.
primerosIgualesA :: (Eq a) => a -> [a] -> [a]
primerosIgualesA _ [] = []
primerosIgualesA n (x : xs)
  | n == x = x : primerosIgualesA n xs
  | otherwise = []

-- b
-- Consigna: Definila usando takeWhile.
primerosIgualesA' :: (Eq a) => a -> [a] -> [a]
primerosIgualesA' _ [] = []
primerosIgualesA' n (x : xs) = takeWhile (== n) (x : xs)

-- Ejercicio 13
-- Consigna: La funcion primIguales toma una lista y devuelve el mayor tramo inicial de la lista cuyos elementos son todos iguales entre si.

-- a
-- Consigna: Definila usando recursion.
primIguales :: (Eq a) => [a] -> [a]
primIguales [] = []
primIguales [x] = [x]
primIguales (x : y : xs)
  | x == y = x : primIguales (y : xs)
  | otherwise = [x]

-- b
-- Consinga: Usa cualquier version de primIgualesA para programar primIguales. Esta permitido dividir en casos, pero no usar recursion.
primIguales' :: (Eq a) => [a] -> [a]
primIguales' [] = []
primIguales' (x : xs) = primerosIgualesA x (x : xs)

-- Ejercicio 14
-- Consigna: Reescribi todas las funciones del laboratorio 7 utilizando el cuantificador generalizado (sin usar induccion y en una linea por funcion).
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
-- Consigna: Defin i una funci on primeros que cumplen, tal que, dada una lista ls y un predicado p, devuelve el tramo inicial de ls que cumple p.
primQueCumplen :: [a] -> (a -> Bool) -> [a]
primQueCumplen [] _ = []
primQueCumplen (l : ls) p
  | p l = l : primQueCumplen ls p
  | otherwise = []

-- Ejercicio 16
-- A es correcto
-- B es incorrecto
-- C es correcto
-- D es correcto
-- E es correcto
-- F es correcto
-- G es correcto
-- H es correcto
-- I es incorrecto

-- Ejercicio 17
-- a
-- Declaracion: f :: (a, b) -> b
-- Definicion: f (x, y) = y
-- b
-- Declaracion: f :: (a, b) -> c
-- Definicion: f (x, y) = x + y
-- c
-- Declaracion: f :: (a -> b) -> a -> b
-- Definicion g x = g x
-- d
-- Declaracion: f :: (a -> b) -> [a] -> [b]
-- Definicion: g (x:xs) = g x : f xs
