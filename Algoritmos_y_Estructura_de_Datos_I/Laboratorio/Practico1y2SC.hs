module Practico1y2SC where

import Numeric.Natural

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

todosMayoresACero :: [Int] -> Bool
todosMayoresACero [] = True
todosMayoresACero (x : xs)
  | x > 0 = todosMayoresACero xs
  | otherwise = False

existeEnLista :: [Int] -> Int -> Bool
existeEnLista [] _ = False
existeEnLista (x : xs) n
  | x /= n = existeEnLista xs n
  | x == n = True

todaLaListaIgual :: [Int] -> Bool
todaLaListaIgual [] = True
todaLaListaIgual [_] = True
todaLaListaIgual (x : y : xs) = x == y && todaLaListaIgual (y : xs)

maxMenorMin :: [Int] -> [Int] -> Bool
maxMenorMin [] [] = True
maxMenorMin [] _ = False
maxMenorMin _ [] = False
maxMenorMin [a] [b] = a < b
maxMenorMin (x : xs) (y : ys) = maximum xs < minimum ys

existenMultiplos :: Int -> Bool
existenMultiplos n
  | n < 4 = False
  | otherwise = existePar 2
  where
    existePar i
      | i >= n = False
      | let j = n `div` i in j >= 2 && i * j == n = True
      | otherwise = existePar (i + 1)

todosTrue :: [Bool] -> Bool
todosTrue [] = True
todosTrue (x : xs)
  | x == True = todosTrue xs
  | x /= True = False

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

todosPares :: [Int] -> Bool
todosPares xs = paraTodo' xs esPar

esPar :: Int -> Bool
esPar x = mod x 2 == 0

hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo n ls = existe' ls (esDivisor n)

esDivisor :: Int -> Int -> Bool
esDivisor x y = mod x y == 0

sumaCuadrados :: Int -> Int
sumaCuadrados x = sumatoria' [0 .. x] (^ 2)

existeDivisor :: Int -> [Int] -> Bool
existeDivisor n ls = existe' ls (esDivisor n)

esPrimo :: Int -> Bool
esPrimo 0 = False
esPrimo 1 = False
esPrimo x = not (existeDivisor x [2 .. x - 1])

factorial' :: Int -> Int
factorial' x = productoria' [1 .. x] (* 1)

multiplicarPrimos :: [Int] -> Int
multiplicarPrimos xs = productoria' xs valorSiEsPrimo

valorSiEsPrimo :: Int -> Int
valorSiEsPrimo x = if esPrimo x then x else 1

esFib :: Int -> Bool
esFib x = existe' [0 .. x] (esIgualAFib x)

esIgualAFib :: Int -> Int -> Bool
esIgualAFib x y = fib y == x

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

todosFib :: [Int] -> Bool
todosFib xs = paraTodo' xs esFib

duplica :: [Int] -> [Int]
duplica [] = []
duplica (x : xs) = x * 2 : duplica xs

duplica' :: [Int] -> [Int]
duplica' xs = map (* 2) xs

buscarPrimos :: [Int] -> [Int]
buscarPrimos [] = []
buscarPrimos (x : xs)
  | esPrimo x = x : buscarPrimos xs
  | otherwise = buscarPrimos xs

buscarPrimos' :: [Int] -> [Int]
buscarPrimos' (x : xs) = filter esPrimo (x : xs)

primerosIgualesA :: (Eq a) => a -> [a] -> [a]
primerosIgualesA _ [] = []
primerosIgualesA n (x : xs)
  | n == x = x : primerosIgualesA n xs
  | otherwise = []

primerosIgualesA' :: (Eq a) => a -> [a] -> [a]
primerosIgualesA' _ [] = []
primerosIgualesA' n (x : xs) = takeWhile (== n) (x : xs)

primIguales :: (Eq a) => [a] -> [a]
primIguales [] = []
primIguales [x] = [x]
primIguales (x : y : xs)
  | x == y = x : primIguales (y : xs)
  | otherwise = [x]

primIguales' :: (Eq a) => [a] -> [a]
primIguales' [] = []
primIguales' (x : xs) = primerosIgualesA x (x : xs)

cuantGen :: (b -> b -> b) -> b -> [a] -> (a -> b) -> b
-- (b -> b -> b) o z en la definicion es el operador binario
-- b o z es el elemento neutro del operador binario
-- [a] o (x:xs) en la def. es la lista de elementos
-- (a -> b) o t en la def. es la funcion que aplica el operator binario a un elemento de la lista
cuantGen _ z [] _ = z
cuantGen op z (x : xs) t = op (t x) (cuantGen op z xs t)

primQueCumplen :: [a] -> (a -> Bool) -> [a]
primQueCumplen [] _ = []
primQueCumplen (l : ls) p
  | p l = l : primQueCumplen ls p
  | otherwise = []

sum_cuad :: [Int] -> Int
sum_cuad [] = 0
sum_cuad (x : xs) = (x * x) + sum_cuad xs

iga :: (Eq a) => a -> [a] -> Bool
iga _ [] = True
iga e (x : xs) = e == x && iga e xs

exp' :: (Num a) => a -> Natural -> a
exp' _ 0 = 1
exp' x n = x * exp' x (n - 1)

sum_pares :: Int -> Int
sum_pares 0 = 0
sum_pares n
  | mod n 2 == 0 = n + sum_pares (n - 1)
  | otherwise = sum_pares (n - 1)

data Carrera = Matematica | Fisica | Computacion | Astronomia deriving (Eq)

titulo :: Carrera -> String
titulo Matematica = "Licenciatura en Matematica"
titulo Fisica = "Licenciatura en Fisica"
titulo Computacion = "Licenciatura en Ciencias de la Computacion"
titulo Astronomia = "Licenciatura en Astronomia"

data NotasBasica = Do | Re | Mi | Fa | Sol | La | Si deriving (Show, Ord, Eq)

cifradoAmericano :: NotasBasica -> Char
cifradoAmericano Do = 'C'
cifradoAmericano Re = 'D'
cifradoAmericano Mi = 'E'
cifradoAmericano Fa = 'F'
cifradoAmericano Sol = 'G'
cifradoAmericano La = 'A'
cifradoAmericano Si = 'B'

minimoElemento :: (Ord a) => [a] -> a
minimoElemento [x] = x
minimoElemento (x : y : xs)
  | x < y = minimoElemento (x : xs)
  | otherwise = minimoElemento (y : xs)

minimoElemento' :: (Ord a, Bounded a) => [a] -> a
minimoElemento' [] = minBound
minimoElemento' [x] = x
minimoElemento' (x : y : xs)
  | x < y = minimoElemento (x : xs)
  | otherwise = minimoElemento (y : xs)

type Altura = Int

type NumCamiseta = Int

data Zona = Arco | Defensa | Mediocampo | Delantera deriving (Show, Eq)

data TipoDeReves = DosManos | UnaMano deriving (Show)

data Modalidad = Carretera | Pista | Monte | BMX deriving (Show)

data PiernaHabil = Izquierda | Derecha deriving (Show)

type ManoHabil = PiernaHabil

data Deportista = Ajedrecista | Ciclista Modalidad | Velocista Altura | Tenista TipoDeReves ManoHabil Altura | Futbolista Zona NumCamiseta PiernaHabil Altura deriving (Show)

contarVelocistas :: [Deportista] -> Int
contarVelocistas [] = 0
contarVelocistas (Velocista _ : xs) = 1 + contarVelocistas xs
contarVelocistas (_ : xs) = contarVelocistas xs

contarFutbolistas :: [Deportista] -> Zona -> Int
contarFutbolistas [] _ = 0
contarFutbolistas (Futbolista Arco _ _ _ : xs) Arco = 1 + contarFutbolistas xs Arco
contarFutbolistas (Futbolista Defensa _ _ _ : xs) Defensa = 1 + contarFutbolistas xs Defensa
contarFutbolistas (Futbolista Mediocampo _ _ _ : xs) Mediocampo = 1 + contarFutbolistas xs Mediocampo
contarFutbolistas (Futbolista Delantera _ _ _ : xs) Delantera = 1 + contarFutbolistas xs Delantera
contarFutbolistas (_ : xs) zona = contarFutbolistas xs zona

contarFutbolistas' :: [Deportista] -> Zona -> Int
contarFutbolistas' xs zona = length (filter (esFutbolistaDeZona zona) xs)

esFutbolistaDeZona :: Zona -> Deportista -> Bool
esFutbolistaDeZona Arco (Futbolista Arco _ _ _) = True
esFutbolistaDeZona Defensa (Futbolista Defensa _ _ _) = True
esFutbolistaDeZona Mediocampo (Futbolista Mediocampo _ _ _) = True
esFutbolistaDeZona Delantera (Futbolista Delantera _ _ _) = True
esFutbolistaDeZona _ _ = False

sumaPotencias :: (Num a) => a -> Natural -> a
sumaPotencias x 0 = 0
sumaPotencias x n = sumaPotencias x (n - 1) + exp' x n

pi' :: Int -> Double
pi' 0 = 4
pi' n = pi' (n - 1) + 4 * ((-1) ^ n / fromIntegral (2 * n + 1))

cubo :: Natural -> Natural
cubo 0 = 0
cubo n = cubo (n - 1) + cuadrado (n) + cuadrado (n) + cuadrado (n) - n - n - n + 1

cuadrado :: Natural -> Natural
cuadrado 0 = 0
cuadrado n = cuadrado (n - 1) + n + n - 1

indiceProducto :: [Int] -> Bool
indiceProducto [] = False
indiceProducto (x : xs) = indiceProducto xs || prod' xs == x

prod' :: [Int] -> Int
prod' [] = 1
prod' (x : xs) = x * prod' xs

iguales :: (Eq a) => [a] -> Bool
iguales [] = True
iguales [x] = True
iguales (x : y : xs) = x == y && iguales (y : xs)

minimo :: [Int] -> Int
minimo [x] = x
minimo (x : y : xs)
  | x < y = minimo (x : xs)
  | otherwise = minimo (y : xs)

creciente :: [Int] -> Bool
creciente [] = True
creciente [x] = True
creciente (x : y : xs) = x < y && creciente (y : xs)

prod :: [Int] -> [Int] -> Int
prod [] _ = 0
prod _ [] = 0
prod (x : xs) (y : ys) = x * y + prod xs ys

psum :: [Int] -> Bool
psum [] = True
psum xs = gpsum 0 xs

gpsum :: Int -> [Int] -> Bool
gpsum n [] = n >= 0
gpsum n (x : xs) = n >= 0 && gpsum (n + x) xs

sum' :: [Int] -> Int
sum' [] = 0
sum' (x : xs) = x + sum' xs

sum_ant :: [Int] -> Bool
sum_ant [] = False
sum_ant xs = gsum_ant 0 xs

gsum_ant :: Int -> [Int] -> Bool
gsum_ant _ [] = False
gsum_ant n (x : xs) = (x == n) || gsum_ant (n + x) xs

sum8 :: [Int] -> Bool
sum8 [] = False
sum8 xs = gsum8 0 xs

gsum8 :: Int -> [Int] -> Bool
gsum8 n [] = n == 0
gsum8 n (x : xs) = n == 8 || gsum8 (n + x) xs

f_sin_gen :: [Int] -> Int
f_sin_gen [] = minBound
f_sin_gen xs = f_gen 0 xs

f_gen :: (Num a, Ord a, Bounded a) => a -> [a] -> a
f_gen _ [] = minBound
f_gen n (x : xs)
  | n == sum (x : xs) = max 0 (f_gen (n + x) xs + 1)
  | otherwise = f_gen n xs + 1

cuad :: Natural -> Bool
cuad 1 = True
cuad n = cuad_gen n 1

cuad_gen :: Natural -> Natural -> Bool
cuad_gen 1 m = m == 0
cuad_gen n m = cuad_gen n (m - 1) || (n * n) + n == m

n8 :: (Num a, Eq a) => [a] -> Natural
n8 [] = 0
n8 xs = n8_gen 0 xs

n8_gen :: (Num a, Eq a) => a -> [a] -> Natural
n8_gen n [] = if n == 8 then 1 else 0
n8_gen n (x : xs)
  | n == 8 = 1 + n8_gen (n + x) xs
  | otherwise = n8_gen (n + x) xs

sonidoNatural :: NotasBasica -> Int
sonidoNatural Do = 0
sonidoNatural Re = 2
sonidoNatural Mi = 4
sonidoNatural Fa = 5
sonidoNatural Sol = 7
sonidoNatural La = 9
sonidoNatural Si = 11

data Alteracion = Bemol | Natural | Sostenido deriving (Show, Eq)

data NotaMusical = Nota NotasBasica Alteracion deriving (Show, Eq)

sonidoCromatico :: NotaMusical -> Int
sonidoCromatico (Nota n Natural) = sonidoNatural n
sonidoCromatico (Nota n Bemol) = sonidoNatural n - 1
sonidoCromatico (Nota n Sostenido) = sonidoNatural n + 1

data Maybe' a = Nothing' | Just' a deriving (Show)

primerElemento :: [a] -> Maybe' a
primerElemento [] = Nothing'
primerElemento (x : _) = Just' x

data Cola = Vacia | Encolada Deportista Cola deriving (Show)

atender :: Cola -> Maybe' Cola
atender Vacia = Nothing'
atender (Encolada _ c) = Just' c

encolar :: Deportista -> Cola -> Cola
encolar dep Vacia = Encolada dep Vacia
encolar dep (Encolada dep' c) = Encolada dep' (encolar dep c)

busca :: Cola -> Zona -> Maybe' Deportista
busca Vacia _ = Nothing'
busca (Encolada (Futbolista z' nc ph a) c) z
  | z == z' = Just' (Futbolista z' nc ph a)
  | otherwise = busca c z
busca (Encolada _ c) z = busca c z

data ListaAsoc a b = Vacia' | Nodo a b (ListaAsoc a b) deriving (Show)

la_long :: ListaAsoc a b -> Int
la_long Vacia' = 0
la_long (Nodo _ _ xs) = 1 + la_long xs

la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b
la_concat Vacia' ys = ys
la_concat (Nodo x y xs) ys = Nodo x y (la_concat xs ys)

la_agregar :: (Eq a) => ListaAsoc a b -> a -> b -> ListaAsoc a b
la_agregar Vacia' x y = Nodo x y Vacia'
la_agregar (Nodo x y xs) x' y'
  | x == x' = Nodo x y' xs
  | otherwise = Nodo x y (la_agregar xs x' y')

la_pares :: ListaAsoc a b -> [(a, b)]
la_pares Vacia' = []
la_pares (Nodo x y xs) = (x, y) : la_pares xs

la_busca :: (Eq a) => ListaAsoc a b -> a -> Maybe' b
la_busca Vacia' _ = Nothing'
la_busca (Nodo x y xs) x'
  | x == x' = Just' y
  | otherwise = la_busca xs x'

la_borrar :: (Eq a) => a -> ListaAsoc a b -> ListaAsoc a b
la_borrar _ Vacia' = Vacia'
la_borrar x (Nodo x' y xs)
  | x == x' = xs
  | otherwise = Nodo x' y (la_borrar x xs)

esSegIncial :: (Eq a) => [a] -> [a] -> Bool
esSegIncial [] ys = True
esSegIncial xs [] = xs == []
esSegIncial (x : xs) (y : ys) = x == y && esSegIncial xs ys

esSeg :: (Eq a) => [a] -> [a] -> Bool
esSeg xs [] = xs == []
esSeg xs (y : ys) = esSegIncial xs (y : ys) || esSeg xs ys

sumin :: (Num a, Ord a) => [a] -> a
sumin [] = 0
sumin (x : xs) = min (suminInicial (x : xs)) (sumin xs)

suminInicial :: (Num a) => [a] -> a
suminInicial [] = 0
suminInicial (x : xs) = x + suminInicial xs

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

maxiga :: (Eq a) => a -> [a] -> Int
maxiga _ [] = 0
maxiga e (x : xs)
  | e == x = 1 + maxiga e xs
  | otherwise = maxiga e xs

g :: (Num a, Ord a) => [a] -> a
g [] = 0
g [x] = x
g (x : y : xs) = max (x + y) (g xs)

parOcurrencias :: (Eq a) => a -> [a] -> Bool
parOcurrencias _ [] = True
parOcurrencias e xs = mod (maxiga e xs) 2 == 0

posicionesPares :: (Eq a) => a -> [a] -> Bool
posicionesPares _ [] = False 
posicionesPares e xs = checkPosicionesPares e xs 0

checkPosicionesPares :: (Eq a) => a -> [a] -> Int -> Bool
checkPosicionesPares _ [] _ = False 
checkPosicionesPares e (x : xs) n
  | e == x && n `mod` 2 == 0 = True 
  | otherwise = checkPosicionesPares e xs (n + 1)

posicionesPares' :: (Eq a) => a -> [a] -> Bool
posicionesPares' _ [] = True
posicionesPares' e xs = posicionesPares'' e xs 0

posicionesPares'' :: (Eq a) => a -> [a] -> Int -> Bool
posicionesPares'' _ [] _ = True
posicionesPares'' e (x : xs) n
  | e == x && mod n 2 /= 0 = False
  | otherwise = posicionesPares'' e xs (n + 1)

verificaElementos :: (Eq a) => a -> a -> [a] -> Bool
verificaElementos _ _ [] = False
verificaElementos e l xs = checkElementos e l xs 0

checkElementos :: (Eq a) => a -> a -> [a] -> Int -> Bool
checkElementos _ _ [] _ = False
checkElementos e l (x : xs) n
  | e == x = lEnPosAnteriores l (take n (x : xs))
  | otherwise = checkElementos e l xs (n + 1)

lEnPosAnteriores :: (Eq a) => a -> [a] -> Bool
lEnPosAnteriores _ [] = False
lEnPosAnteriores l (x : xs)
  | l == x = True
  | otherwise = lEnPosAnteriores l xs

esMayorUnico :: (Ord a, Eq a) => [a] -> Bool
esMayorUnico [] = False
esMayorUnico [x] = True
esMayorUnico xs = esUnico maxElem xs
  where
    maxElem = maximum xs

esUnico :: (Eq a) => a -> [a] -> Bool
esUnico _ [] = False
esUnico e xs = length (filter (== e) xs) == 1
