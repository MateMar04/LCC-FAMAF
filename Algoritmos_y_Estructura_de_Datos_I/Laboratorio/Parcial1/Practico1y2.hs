module Practico1y2 where
import Numeric.Natural
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




-- Practico 2 solo laboratorio

-- Ejercicio 1
-- a
-- Consigna: sum cuad.xs = ⟨SUM i : 0 ≤ i < #xs : xs.i ∗ xs.i⟩
sum_cuad :: [Int] -> Int
sum_cuad [] = 0
sum_cuad (x : xs) = (x * x) + sum_cuad xs

-- b
-- Consigna: iga.e.xs = ⟨ ∀ i : 0 ≤ i < #xs : xs.i = e ⟩
iga :: (Eq a) => a -> [a] -> Bool
iga _ [] = True
iga e (x : xs) = e == x && iga e xs

-- c
-- Consigna exp.x.n = x^n
exp' :: (Num a) => a -> Natural -> a
exp' _ 0 = 1
exp' x n = x * exp' x (n - 1)

-- d
-- Consigna: sum_pares n = ⟨SUM i : 0 ≤ i ≤ n && par.i : i⟩
sum_pares :: Int -> Int
sum_pares 0 = 0
sum_pares n
  | mod n 2 == 0 = n + sum_pares (n - 1)
  | otherwise = sum_pares (n - 1)

-- Ejercicio 2
-- a
-- Consigna: Implementa el tipo Carrera como esta definido arriba.
data Carrera = Matematica | Fisica | Computacion | Astronomia deriving (Eq)

-- b
titulo :: Carrera -> String
titulo Matematica = "Licenciatura en Matematica"
titulo Fisica = "Licenciatura en Fisica"
titulo Computacion = "Licenciatura en Ciencias de la Computacion"
titulo Astronomia = "Licenciatura en Astronomia"

-- c
data NotasBasica = Do | Re | Mi | Fa | Sol | La | Si deriving (Show, Ord, Eq)

-- d
-- Consigna: Implementa la funcion cifradoAmericano que recibe una NotaBasica y devuelve un Char
cifradoAmericano :: NotasBasica -> Char
cifradoAmericano Do = 'C'
cifradoAmericano Re = 'D'
cifradoAmericano Mi = 'E'
cifradoAmericano Fa = 'F'
cifradoAmericano Sol = 'G'
cifradoAmericano La = 'A'
cifradoAmericano Si = 'B'

-- Ejericio 3
-- Se agrego deriving (Show, Ord, Eq) a NotasBasica y deriving (Eq) a Carrera

-- Ejercicio 4

-- a
-- Consigna: Defini usando polimorfismo ad hoc la funcion minimoElemento que calcula (de manera recursiva) cual es el menor valor de una lista de tipo [a]. Asegurate que solo este definida para listas no vacias.
minimoElemento :: (Ord a) => [a] -> a
minimoElemento [x] = x
minimoElemento (x : y : xs)
  | x < y = minimoElemento (x : xs)
  | otherwise = minimoElemento (y : xs)

-- b
-- Consigna: Defini la funci ́on minimoElemento’ de manera tal que el caso base de la recursi ́on sea el de la lista vacia.Para ello revisa la clase Bounded.
minimoElemento' :: (Ord a, Bounded a) => [a] -> a
minimoElemento' [] = minBound
minimoElemento' [x] = x
minimoElemento' (x : y : xs)
  | x < y = minimoElemento (x : xs)
  | otherwise = minimoElemento (y : xs)

-- c
-- minimoElemento [Fa, La, Sol, Re, Fa]

-- Ejercicio 5

-- a
-- Sinonimos de tipo
type Altura = Int

type NumCamiseta = Int

-- Tipos algebraicos sin parametros
data Zona = Arco | Defensa | Mediocampo | Delantera deriving (Show, Eq)

data TipoDeReves = DosManos | UnaMano deriving (Show)

data Modalidad = Carretera | Pista | Monte | BMX deriving (Show)

data PiernaHabil = Izquierda | Derecha deriving (Show)

-- Sinonimo
type ManoHabil = PiernaHabil

data Deportista = Ajedrecista | Ciclista Modalidad | Velocista Altura | Tenista TipoDeReves ManoHabil Altura | Futbolista Zona NumCamiseta PiernaHabil Altura deriving (Show)

-- b
-- Consigna: ¿Cual es el tipo del constructor Ciclista?
-- Ciclista :: Modalidad -> Deportista

-- c
-- Consigna: dada una lista de deportistas xs, devuelve la cantidad de velocistas que hay dentro de xs. Programar contar_velocistas sin usar igualdad, utilizando pattern matching.
contarVelocistas :: [Deportista] -> Int
contarVelocistas [] = 0
contarVelocistas (Velocista _ : xs) = 1 + contarVelocistas xs
contarVelocistas (_ : xs) = contarVelocistas xs

-- d
-- Consigna: dada una lista de deportistas xs, y una zona z, devuelve la cantidad de futbolistas incluidos en xs que juegan en la zona z. No usar igualdad, solo pattern matching.
contarFutbolistas :: [Deportista] -> Zona -> Int
contarFutbolistas [] _ = 0
contarFutbolistas (Futbolista Arco _ _ _ : xs) Arco = 1 + contarFutbolistas xs Arco
contarFutbolistas (Futbolista Defensa _ _ _ : xs) Defensa = 1 + contarFutbolistas xs Defensa
contarFutbolistas (Futbolista Mediocampo _ _ _ : xs) Mediocampo = 1 + contarFutbolistas xs Mediocampo
contarFutbolistas (Futbolista Delantera _ _ _ : xs) Delantera = 1 + contarFutbolistas xs Delantera
contarFutbolistas (_ : xs) zona = contarFutbolistas xs zona

-- e
-- Consigna: ¿La funcion anterior usa filter? Si no es asi, reprogramala para usarla.
contarFutbolistas' :: [Deportista] -> Zona -> Int
contarFutbolistas' xs zona = length (filter (esFutbolistaDeZona zona) xs)

esFutbolistaDeZona :: Zona -> Deportista -> Bool
esFutbolistaDeZona Arco (Futbolista Arco _ _ _) = True
esFutbolistaDeZona Defensa (Futbolista Defensa _ _ _) = True
esFutbolistaDeZona Mediocampo (Futbolista Mediocampo _ _ _) = True
esFutbolistaDeZona Delantera (Futbolista Delantera _ _ _) = True
esFutbolistaDeZona _ _ = False

-- Ejercicio 6
-- a
-- Consigna: computa la suma de potencias de un numero
sumaPotencias :: (Num a) => a -> Natural -> a
sumaPotencias x 0 = 0
sumaPotencias x n = sumaPotencias x (n - 1) + exp' x n

-- b
-- Consigna: computa la aproximacion del numero π
pi' :: Int -> Double
pi' 0 = 4
pi' n = pi' (n - 1) + 4 * ((-1) ^ n / fromIntegral (2 * n + 1))

-- c
-- Consigna: computa el cubo de un numero natural x utilizando unicamente sumas.
cubo :: Natural -> Natural
cubo 0 = 0
cubo n = cubo (n - 1) + cuadrado (n) + cuadrado (n) + cuadrado (n) - n - n - n + 1

cuadrado :: Natural -> Natural
cuadrado 0 = 0
cuadrado n = cuadrado (n - 1) + n + n - 1

-- d
-- Consigna: ⟨ ∃ i : 0 < i ≤ #xs : ⟨prod j : 0 ≤ j < #(xs↓i) : (xs↓i).j ⟩ = xs.(i − 1) ⟩
-- CREO QUE NO ANDA
indiceProducto :: [Int] -> Bool
indiceProducto [] = False
indiceProducto (x : xs) = indiceProducto xs || prod' xs == x

prod' :: [Int] -> Int
prod' [] = 1
prod' (x : xs) = x * prod' xs

-- Ejercicio 7
-- a
-- Consigna: determina si los elementos de una lista de tipo A son todos iguales entre si.
iguales :: (Eq a) => [a] -> Bool
iguales [] = True
iguales [x] = True
iguales (x : y : xs) = x == y && iguales (y : xs)

-- b
-- Consigna: calcula el m ́ınimo elemento de una lista no vacia de enteros.
minimo :: [Int] -> Int
minimo [x] = x
minimo (x : y : xs)
  | x < y = minimo (x : xs)
  | otherwise = minimo (y : xs)

-- c
-- Consigna: determina si los elementos de una lista de enteros est ́an ordenados en forma creciente.
creciente :: [Int] -> Bool
creciente [] = True
creciente [x] = True
creciente (x : y : xs) = x < y && creciente (y : xs)

-- d
-- Consigna: calcula el producto entre pares de elementos en iguales posiciones de las listas y suma estos resultados
prod :: [Int] -> [Int] -> Int
prod [] _ = 0
prod _ [] = 0
prod (x : xs) (y : ys) = x * y + prod xs ys

-- Ejercicio 8
-- a
-- Consigna: ⟨ ∀ i : 0 ≤ i ≤ #xs : sum.(xs↑i) ≥ 0 ⟩

psum :: [Int] -> Bool
psum [] = True
psum xs = gpsum 0 xs

gpsum :: Int -> [Int] -> Bool
gpsum n [] = n >= 0
gpsum n (x : xs) = n >= 0 && gpsum (n + x) xs

sum' :: [Int] -> Int
sum' [] = 0
sum' (x : xs) = x + sum' xs

-- b
-- Consigna: sum ant.xs = ⟨ ∃ i : 0 ≤ i < #xs : xs.i = sum.(xs↑i) ⟩
sum_ant :: [Int] -> Bool
sum_ant [] = False
sum_ant xs = gsum_ant 0 xs

gsum_ant :: Int -> [Int] -> Bool
gsum_ant _ [] = False
gsum_ant n (x : xs) = (x == n) || gsum_ant (n + x) xs

-- c
-- Cosnigna: ⟨ ∃ i : 0 ≤ i ≤ #xs : sum.(xs↑i) = 8 ⟩
sum8 :: [Int] -> Bool
sum8 [] = False
sum8 xs = gsum8 0 xs

gsum8 :: Int -> [Int] -> Bool
gsum8 n [] = n == 0
gsum8 n (x : xs) = n == 8 || gsum8 (n + x) xs

-- d
-- Consigna: ⟨Max i : 0 ≤ i < #xs ∧ sum.(xs↑i) = sum.(xs↓i) : i ⟩
-- NO ANDA
f_sin_gen :: [Int] -> Int
f_sin_gen [] = minBound
f_sin_gen xs = f_gen 0 xs

f_gen :: (Num a, Ord a, Bounded a) => a -> [a] -> a
f_gen _ [] = minBound
f_gen n (x : xs)
  | n == sum (x : xs) = max 0 (f_gen (n + x) xs + 1)
  | otherwise = f_gen n xs + 1

-- Ejercicio 9
-- a
-- Consigna: dado un natural determina si es el cuadrado de un numero.
-- NO ANDA
cuad :: Natural -> Bool
cuad 1 = True
cuad n = cuad_gen n 1

cuad_gen :: Natural -> Natural -> Bool
cuad_gen 1 m = m == 0
cuad_gen n m = cuad_gen n (m - 1) || (n * n) + n == m

-- b
-- Consigna: que cuenta la cantidad de segmentos iniciales de una lista cuya suma es igual a 8.
n8 :: (Num a, Eq a) => [a] -> Natural
n8 [] = 0
n8 xs = n8_gen 0 xs

n8_gen :: (Num a, Eq a) => a -> [a] -> Natural
n8_gen n [] = if n == 8 then 1 else 0
n8_gen n (x : xs)
  | n == 8 = 1 + n8_gen (n + x) xs
  | otherwise = n8_gen (n + x) xs

-- Ejercicio 10
-- a
sonidoNatural :: NotasBasica -> Int
sonidoNatural Do = 0
sonidoNatural Re = 2
sonidoNatural Mi = 4
sonidoNatural Fa = 5
sonidoNatural Sol = 7
sonidoNatural La = 9
sonidoNatural Si = 11

-- b
-- Defini el tipo enumerado Alteracion qie cpmsta de los constructores Bemol, Natural y Sostenido
data Alteracion = Bemol | Natural | Sostenido deriving (Show, Eq)

-- c
-- Defini el tipo algebraico NotaMusical que debe tener un solo constructor que llamaremos Nota el cual recibe dos parametros
-- el primero es NotaBasica y el segundo Alteracion
data NotaMusical = Nota NotasBasica Alteracion deriving (Show, Eq)

-- d
-- Consigna: devuelve el sonido de una nota, incrementando en uno su valor si tiene la alteracion Sostenido, decrementando en uno si tiene la alteraci ́on Bemol y dejando su valor intacto si la alteracion es Natural
sonidoCromatico :: NotaMusical -> Int
sonidoCromatico (Nota n Natural) = sonidoNatural n
sonidoCromatico (Nota n Bemol) = sonidoNatural n - 1
sonidoCromatico (Nota n Sostenido) = sonidoNatural n + 1

-- e
-- Agregar Eq y Show a NotaMusical

-- d
-- Agregar 0rd a NotaMusical

-- Ejercicio 11
-- Consigna: devuelve el primer elemento de una lista no vacia, o Nothing si la lista es vacia.
data Maybe' a = Nothing' | Just' a deriving (Show)

primerElemento :: [a] -> Maybe' a
primerElemento [] = Nothing'
primerElemento (x : _) = Just' x

-- Ejercicio 12
-- 1
data Cola = Vacia | Encolada Deportista Cola deriving (Show)

-- a
-- Consigna: elimina de la cola a la persona que esta en la primer posicion de una cola, por haber sido atendida. Si la cola esta vacia, devuelve Nothing.
atender :: Cola -> Maybe' Cola
atender Vacia = Nothing'
atender (Encolada _ c) = Just' c

-- b
-- Consigna: Agrega un deportista a una cola de deportistas en la ultima posicion
encolar :: Deportista -> Cola -> Cola
encolar dep Vacia = Encolada dep Vacia
encolar dep (Encolada dep' c) = Encolada dep' (encolar dep c)

-- c
-- Consigna: devuelve el/la primera futbolista dentro de la cola que juega en la zona que se corresponde con el segundo parametro. Si no hay futbolistas jugando en esa zona devuelve Nothing.
busca :: Cola -> Zona -> Maybe' Deportista
busca Vacia _ = Nothing'
busca (Encolada (Futbolista z' nc ph a) c) z
  | z == z' = Just' (Futbolista z' nc ph a)
  | otherwise = busca c z
busca (Encolada _ c) z = busca c z

-- 2

data ListaAsoc a b = Vacia' | Nodo a b (ListaAsoc a b) deriving (Show)

-- Es parecido a una lista?

-- Ejercicio 13
-- 1
-- Para una guia telefonica seria ListaAsoc String Int

-- 2
-- a
-- Consigna: devuelve la cantidad de datos en una lista.
la_long :: ListaAsoc a b -> Int
la_long Vacia' = 0
la_long (Nodo _ _ xs) = 1 + la_long xs

-- b
-- Consigna: devuelve la concatenacion de dos listas de asociaciones.
la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b
la_concat Vacia' ys = ys
la_concat (Nodo x y xs) ys = Nodo x y (la_concat xs ys)

-- c
-- Consigna: agrega un nodo a la lista de asociaciones si la clave no esta en la lista, o actualiza el valor si la clave ya se encontraba.
la_agregar :: (Eq a) => ListaAsoc a b -> a -> b -> ListaAsoc a b
la_agregar Vacia' x y = Nodo x y Vacia'
la_agregar (Nodo x y xs) x' y'
  | x == x' = Nodo x y' xs
  | otherwise = Nodo x y (la_agregar xs x' y')

-- d
-- Consigna: transforma una lista de asociaciones en una lista de pares clave-dato.
la_pares :: ListaAsoc a b -> [(a, b)]
la_pares Vacia' = []
la_pares (Nodo x y xs) = (x, y) : la_pares xs

-- e
-- Consigna: dada una lista y una clave devuelve el dato asociado, si es que existe. En caso contrario devuelve Nothing.
la_busca :: (Eq a) => ListaAsoc a b -> a -> Maybe' b
la_busca Vacia' _ = Nothing'
la_busca (Nodo x y xs) x'
  | x == x' = Just' y
  | otherwise = la_busca xs x'

-- f
-- Consigna: dada una clave a elimina la entrada en la lista.
la_borrar :: (Eq a) => a -> ListaAsoc a b -> ListaAsoc a b
la_borrar _ Vacia' = Vacia'
la_borrar x (Nodo x' y xs)
  | x == x' = xs
  | otherwise = Nodo x' y (la_borrar x xs)

-- Ejercicio 14
-- a
esSegIncial :: (Eq a) => [a] -> [a] -> Bool
esSegIncial [] ys = True
esSegIncial xs [] = xs == []
esSegIncial (x : xs) (y : ys) = x == y && esSegIncial xs ys

-- b
esSeg :: (Eq a) => [a] -> [a] -> Bool
esSeg xs [] = xs == []
esSeg xs (y : ys) = esSegIncial xs (y : ys) || esSeg xs ys

-- Ejercicio 15
-- a
sumin :: (Num a, Ord a) => [a] -> a
sumin [] = 0
sumin (x : xs) = min (suminInicial (x : xs)) (sumin xs)

suminInicial :: (Num a) => [a] -> a
suminInicial [] = 0
suminInicial (x : xs) = x + suminInicial xs

-- b
-- NO ANDA
f'' :: (Eq t, Num t, Num a) => [t] -> a
f'' [] = 0
f'' xs = sf xs + f'' xs

sf :: (Eq t, Num t, Num a) => [t] -> a
sf xs = gsf 0 xs

gsf :: (Eq t, Num t, Num a) => t -> [t] -> a
gsf n []
  | n == 8 = 1
  | otherwise = 0
gsf n (x : xs)
  | n == 8 = 1 + gsf (n + x) xs
  | otherwise = gsf (n + x) xs

-- c
-- Hecha sin el teorico
maxiga :: (Eq a) => a -> [a] -> Int
maxiga _ [] = 0
maxiga e (x : xs)
  | e == x = 1 + maxiga e xs
  | otherwise = maxiga e xs

-- Ejercicio 16
g :: (Num a, Ord a) => [a] -> a
g [] = 0
g [x] = x
g (x : y : xs) = max (x + y) (g xs)

-- Ejercicio 17
-- Hechas sin teorico

-- a
-- El elemento e ocurre un numero par de veces en la lista xs.
parOcurrencias :: (Eq a) => a -> [a] -> Bool
parOcurrencias _ [] = True
parOcurrencias e xs = mod (maxiga e xs) 2 == 0

-- b
-- El elemento e ocurre por lo menos en las posiciones pares de la lista xs.
posicionesPares :: (Eq a) => a -> [a] -> Bool
posicionesPares _ [] = False -- Devuelve False si la lista está vacía
posicionesPares e xs = checkPosicionesPares e xs 0

checkPosicionesPares :: (Eq a) => a -> [a] -> Int -> Bool
checkPosicionesPares _ [] _ = False -- Si llegamos al final sin encontrar el elemento en una posición par, devuelve False
checkPosicionesPares e (x : xs) n
  | e == x && n `mod` 2 == 0 = True -- Si encontramos e en una posición par, devuelve True
  | otherwise = checkPosicionesPares e xs (n + 1)

-- c
-- El elemento e ocurre únicamente en las posiciones pares de la lista xs.
posicionesPares' :: (Eq a) => a -> [a] -> Bool
posicionesPares' _ [] = True
posicionesPares' e xs = posicionesPares'' e xs 0

posicionesPares'' :: (Eq a) => a -> [a] -> Int -> Bool
posicionesPares'' _ [] _ = True
posicionesPares'' e (x : xs) n
  | e == x && mod n 2 /= 0 = False
  | otherwise = posicionesPares'' e xs (n + 1)

-- d
-- NO ANDA
-- Si e ocurre en la lista xs, entonces l ocurre en alguna posicion anterior en la misma lista.
verificaElementos :: (Eq a) => a -> a -> [a] -> Bool
verificaElementos _ _ [] = False  -- Si la lista está vacía, devuelve False
verificaElementos e l xs = checkElementos e l xs 0

checkElementos :: (Eq a) => a -> a -> [a] -> Int -> Bool
checkElementos _ _ [] _ = False  -- Fin de la lista sin encontrar e
checkElementos e l (x:xs) n
  | e == x = lEnPosAnteriores l (take n (x:xs))  -- Verifica en posiciones anteriores si l está presente
  | otherwise = checkElementos e l xs (n + 1)

lEnPosAnteriores :: (Eq a) => a -> [a] -> Bool
lEnPosAnteriores _ [] = False  -- Si no hay elementos anteriores, devuelve False
lEnPosAnteriores l (x:xs)
  | l == x = True  -- Si encontramos l en posiciones anteriores, devuelve True
  | otherwise = lEnPosAnteriores l xs  -- Continúa buscando en el resto de la lista

-- e
-- Existe un elemento de la lista xs que es estrictamente mayor a todos los demás.
esMayorUnico :: (Ord a, Eq a) => [a] -> Bool
esMayorUnico [] = False  -- No tiene sentido para una lista vacía
esMayorUnico [x] = True  -- Si hay un solo elemento, ese es estrictamente mayor a los demás
esMayorUnico xs = esUnico maxElem xs
  where
    maxElem = maximum xs  -- Encuentra el mayor elemento de la lista

-- Verifica si el máximo es único
esUnico :: (Eq a) => a -> [a] -> Bool
esUnico _ [] = False  -- No puede ser único si la lista está vacía
esUnico e xs = length (filter (== e) xs) == 1  -- Verifica que solo haya una ocurrencia de e


-- f
-- En la lista xs solo ocurren valores que anulan la funcion f.
