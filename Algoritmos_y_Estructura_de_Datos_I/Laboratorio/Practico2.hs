module Practico2 where

import Numeric.Natural

-- Practico 2 solo laboratorio

-- Ejercicio 1
sumCuad :: [Int] -> Int
sumCuad [] = 0
sumCuad (x : xs) = (x * x) + sumCuad xs

iga :: (Eq a) => a -> [a] -> Bool
iga _ [] = True
iga e (x : xs) = e == x && iga e xs

exp' :: (Num a) => a -> Int -> a
exp' _ 0 = 1
exp' x n = x * exp' x (n - 1)

sumPares :: Int -> Int
sumPares 0 = 0
sumPares n
  | mod n 2 == 0 = n + sumPares (n - 1)
  | otherwise = sumPares (n - 1)

-- Ejercicio 2
-- a
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
minimoElemento :: (Ord a) => [a] -> a
minimoElemento [x] = x
minimoElemento (x : y : xs)
  | x < y = minimoElemento (x : xs)
  | otherwise = minimoElemento (y : xs)

-- b
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

-- data Deportista = Ajedrecista | Ciclista Modalidad | Velocista Altura | Tenista TipoDeReves ManoHabil Altura | Futbolista Zona NumCamiseta PiernaHabil Altura deriving (Show)

-- b
-- Ciclista :: Modalidad -> Deportista

-- c
contarVelocistas :: [Deportista] -> Int
contarVelocistas [] = 0
contarVelocistas (Velocista _ : xs) = 1 + contarVelocistas xs
contarVelocistas (_ : xs) = contarVelocistas xs

-- d
contarFutbolistas :: [Deportista] -> Zona -> Int
contarFutbolistas [] _ = 0
contarFutbolistas (Futbolista Arco _ _ _ : xs) Arco = 1 + contarFutbolistas xs Arco
contarFutbolistas (Futbolista Defensa _ _ _ : xs) Defensa = 1 + contarFutbolistas xs Defensa
contarFutbolistas (Futbolista Mediocampo _ _ _ : xs) Mediocampo = 1 + contarFutbolistas xs Mediocampo
contarFutbolistas (Futbolista Delantera _ _ _ : xs) Delantera = 1 + contarFutbolistas xs Delantera
contarFutbolistas (_ : xs) zona = contarFutbolistas xs zona

-- e
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
f :: (Num a) => a -> Natural -> a
f x 0 = 0
f x n = f x (n - 1) + x ^ n

-- b
pi' :: Int -> Double
pi' 0 = 4
pi' n = pi' (n - 1) + 4 * ((-1) ^ n / fromIntegral (2 * n + 1))

-- c
f' :: Natural -> Natural
f' 0 = 0
f' n = n ^ 3

-- d
prod' :: [Int] -> Int
prod' [] = 1
prod' (x : xs) = x * prod' xs

f_mod :: [Int] -> Bool
f_mod [] = False
f_mod (x : xs) = f_mod xs || prod' xs == x

-- Ejercicio 7
-- a
iguales :: (Eq a) => [a] -> Bool
iguales [] = True
iguales [x] = True
iguales (x : y : xs) = x == y && iguales (y : xs)

-- b
minimo :: [Int] -> Int
minimo [x] = x
minimo (x : y : xs)
  | x < y = minimo (x : xs)
  | otherwise = minimo (y : xs)

-- c
creciente :: [Int] -> Bool
creciente [] = True
creciente [x] = True
creciente (x : y : xs) = x < y && creciente (y : xs)

-- d
prod :: [Int] -> [Int] -> Int
prod [] _ = 0
prod _ [] = 0
prod (x : xs) (y : ys) = x * y + prod xs ys

-- Ejercicio 8
-- a
sum' :: [Int] -> Int
sum' [] = 0
sum' (x : xs) = x + sum' xs

-- testear
gpsum :: Int -> [Int] -> Bool
gpsum n [] = n >= 0
gpsum n (x : xs) = n >= 0 && gpsum (n - x) xs

-- b

-- tester
gsum_ant :: Int -> [Int] -> Bool
gsum_ant n [] = False
gsum_ant n (x : xs) = x == n || gsum_ant (n - x) xs

-- c
gsum8 :: Int -> [Int] -> Bool
gsum8 n [] = n == 0
gsum8 n (x : xs) = n == 8 || gsum8 (n - x) xs

-- d
f_gen :: (Num a, Ord a, Bounded a) => a -> [a] -> a
f_gen _ [] = minBound
f_gen n (x : xs)
  | n == sum (x : xs) = max minBound (f_gen (n + x) xs + 1)
  | otherwise = f_gen n xs + 1

-- Ejercicio 9
-- a
cuad :: Natural -> Bool
cuad 1 = True
cuad n = cuad_gen n 0

cuad_gen :: Natural -> Natural -> Bool
cuad_gen 1 m = m == 0
cuad_gen n m = cuad_gen n (m - 1) || (n * n) + n == m

-- b
n8 :: (Num a, Eq a) => [a] -> Natural
n8 [] = 0
n8 xs = n8_gen 0 xs

n8_gen :: (Num a, Eq a) => a -> [a] -> Natural
n8_gen n [] = 0
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
sonidoCromatico :: NotaMusical -> Int
sonidoCromatico (Nota n Natural) = sonidoNatural n
sonidoCromatico (Nota n Bemol) = sonidoNatural n - 1
sonidoCromatico (Nota n Sostenido) = sonidoNatural n + 1

-- e
-- Agregar Eq y Show a NotaMusical

-- d
-- Agregar 0rd a NotaMusical

-- Ejercicio 11
data Maybe' a = Nothing' | Just' a deriving (Show)

primerElemento :: [a] -> Maybe' a
primerElemento [] = Nothing'
primerElemento (x : _) = Just' x

-- Ejercicio 12
-- 1
data Deportista = Ajedrecista | Ciclista Modalidad | Velocista Altura | Tenista TipoDeReves ManoHabil Altura | Futbolista Zona NumCamiseta PiernaHabil Altura deriving (Show)

data Cola = Vacia | Encolada Deportista Cola deriving (Show)

-- a
-- elimina de la cola a la persona que esta en la primer posicion de una cola, por haber sido atendida. Si la cola esta vacia, devuelve Nothing.
atender :: Cola -> Maybe' Cola
atender Vacia = Nothing'
atender (Encolada _ c) = Just' c

-- b
-- Agrega un deportista a una cola de deportistas en la ultima posicion
encolar :: Deportista -> Cola -> Cola
encolar dep Vacia = Encolada dep Vacia
encolar dep (Encolada dep' c) = Encolada dep' (encolar dep c)

-- c
-- devuelve el/la primera futbolista dentro de la cola que juega en la zona que se corresponde con el segundo parametro. Si no hay futbolistas jugando en esa zona devuelve Nothing.
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
la_long :: ListaAsoc a b -> Int
la_long Vacia' = 0
la_long (Nodo _ _ xs) = 1 + la_long xs

-- b
la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b
la_concat Vacia' ys = ys
la_concat (Nodo x y xs) ys = Nodo x y (la_concat xs ys)

-- c
la_agregar :: (Eq a) => ListaAsoc a b -> a -> b -> ListaAsoc a b
la_agregar Vacia' x y = Nodo x y Vacia'
la_agregar (Nodo x y xs) x' y'
  | x == x' = Nodo x y' xs
  | otherwise = Nodo x y (la_agregar xs x' y')

-- d
la_pares :: ListaAsoc a b -> [(a, b)]
la_pares Vacia' = []
la_pares (Nodo x y xs) = (x, y) : la_pares xs

-- e
la_busca :: (Eq a) => ListaAsoc a b -> a -> Maybe' b
la_busca Vacia' _ = Nothing'
la_busca (Nodo x y xs) x'
  | x == x' = Just' y
  | otherwise = la_busca xs x'

-- f
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
-- El elemento e ocurre un n ́umero par de veces en la lista xs.
parOcurrencias :: (Eq a) => a -> [a] -> Bool
parOcurrencias _ [] = True
parOcurrencias e xs = mod (maxiga e xs) 2 == 0

-- b
-- El elemento e ocurre en las posiciones pares de la lista xs.
posicionesPares :: (Eq a) => a -> [a] -> Bool
posicionesPares _ [] = True
posicionesPares e xs = posicionesPares' e xs 0

posicionesPares' :: (Eq a) => a -> [a] -> Int -> Bool
posicionesPares' _ [] _ = True
posicionesPares' e (x : xs) n
  | e == x = mod n 2 == 0 && posicionesPares' e xs (n + 1)
  | otherwise = posicionesPares' e xs (n + 1)

-- c
-- El elemento e ocurre  ́unicamente en las posiciones pares de la lista xs.
posicionesPares'' :: (Eq a) => a -> [a] -> Bool
posicionesPares'' _ [] = True
posicionesPares'' e xs = posicionesPares'' e xs && posicionesPares e xs

-- d
-- Si e ocurre en la lista xs, entonces l ocurre en alguna posicion anterior en la misma lista.

-- e
-- Existe un elemento de la lista xs que es estrictamente mayor a todos los dem ́as.

-- f
-- En la lista xs solo ocurren valores que anulan la funcion f.
