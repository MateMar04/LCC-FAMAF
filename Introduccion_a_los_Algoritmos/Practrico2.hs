{-
1.
A. lenght [5,6,7] = 3

B. [5,3,57] !! 1 = 3

C. [0,11,2,5]:[ ] = [[0,11,2,5]]

D. take 2 [5,6,7] = [5,6]

E. drop 2 [5,6,7] = [7]

F. head (0:[1,2,3]) = 0

G. ([1,2] ++ [3,4] ++ [(2+3)]) = [1,2,3,4,5]

H. take 2 (([[1]] ++ [[2]]) ++ [[3]]) = [[1], [2]]

I. take (length ([ ]:[[ ]])) (([[ ]] ++ [[ ]]) ++ [([ ] ++ [ ])]) = [[], []]

2.
A. -45:[1,2,3] -----> (-45):[1,2,3]

B. ([1,2] ++ [3,4]) ++ [5] -----> [1,2] ++ ([3,4] ++ [5])

C. 0 ++ [[1,2,3]] -----> Mal escrita (no se puede summar un int con una lista)

D. []:[]

E. ([1] ++ [2]) ++ [[3]] -----> Mal escrita

F. [1,5,False] -----> Mal escrita

G. head [[5]]

H. head [True, False] ++ [False] -----> head ([True, False] ++ [False])
-}

--3
soloPares :: [Int] -> [Int]
soloPares [] = []
soloPares (x:xs)
    | even x = x : soloPares xs  
    | otherwise = soloPares xs  


mayoresQue10 :: [Int] -> [Int]
mayoresQue10 [] = []
mayoresQue10 (x:xs)
    | x > 10 = x : mayoresQue10 xs
    | otherwise = mayoresQue10 xs

mayoresQue :: Int -> [Int] -> [Int]
mayoresQue a [] = []
mayoresQue a (x:xs)
    | x > a = x : mayoresQue a xs
    | otherwise = mayoresQue a xs

--4
sumar1 :: [Int] -> [Int]
sumar1 [] = []
sumar1 (x:xs) = (x + 1) : sumar1 xs

duplica :: [Int] -> [Int]
duplica [] = []
duplica (x:xs) = (x * 2) : duplica xs

multiplica :: Int -> [Int] -> [Int]
multiplica a [] = []
multiplica a (x:xs) = (x * a) : multiplica a xs

--5
todosMenores10 :: [Int] -> Bool
todosMenores10 [] = True
todosMenores10 (x:xs)
    | x < 10 = todosMenores10 xs
    | x >= 10 = False


hay0 :: [Int] -> Bool
hay0 [] = False
hay0 (x:xs)
    | x == 0 = True
    | x /= 0 = hay0 xs

suma :: [Int] -> Int
suma [] = 0
suma (x:xs) = x + sum xs

--6
repartir :: [String] -> [String] -> [(String,String)]
repartir [] _ = []
repartir _ [] = []
repartir (x:xs) (y:ys) = (x,y) : repartir xs ys

--7
apellidos :: [(String, String, Int)] -> [String]
apellidos [] = []
apellidos ((_, ap, _):xs) = ap  : apellidos xs

--8
myLenght :: [a] -> Int
myLenght [] = 0
myLenght (x:xs) = 1 + myLenght xs

!!
myIndex :: [a] -> Int -> a
myIndex (x:_) 0 = x
myIndex (x:xs) i = myIndex xs (i - 1)

myTake :: Int -> [a] -> [a]
myTake 0 _ = []
myTake _ [] = []
myTake i (x:xs) = x : myTake (i - 1) xs

myDrop :: Int -> [a] -> [a]
myDrop 0 xs = xs
myDrop _ [] = []
myDrop i (x:xs) = myDrop (i - 1) xs

++
myConcat :: [a] -> [a] -> [a]
myConcat [] ys = ys
myConcat xs [] = xs
myConcat (x:xs) ys = x : myConcat xs ys

--9
--filter
maximo :: [Int] -> Int
maximo [] = error "Lista vacía"
maximo [x] = x
maximo (x:y:xs)
    | x > y = maximo (x:xs)
    | x < y = maximo (y:xs)

maximo2 [x] = x
maximo2 (x:y:xs) = max x (maximo2 (y:xs))
    

--fold
sumaPares :: [(Int, Int)] -> Int
sumaPares [] = 0
sumaPares ((x, y):xs) = x + y + sumaPares xs


--fold
todos0y1 :: [Int] -> Bool
todos0y1 [] = True
todos0y1 (x:xs)
    | (x == 1 || x == 0) = todos0y1 xs
    | otherwise = False


--filter
quitar0s :: [Int] -> [Int]
quitar0s [] = []
quitar0s (x:xs)
    | x == 0 = quitar0s xs
    | otherwise = x : quitar0s xs


--filter
ultimo :: [a] -> a
ultimo (x:xs) = (x:xs) !! ((length (x:xs) ) - 1)


--
repetir :: Int -> Int -> [Int] 
repetir 0 _ = []
repetir x y = y: (repetir (x-1) y)


--fold
myConcat1 :: [[a]] -> [a]
myConcat1 [] = []
myConcat1 (x:xs) = x ++ concat xs


--map
rev :: [a] -> [a]
rev [] = []
rev (x:xs) = rev xs ++ [x]

--10


CuentaVacia :: [[a]] -> Int
CuentaVacia [] = 0
CuentaVacia (x:xs) 
    | lenght x > 0 = CuentaVacia xs
    | lenght x == 0 = 1 + CuentaVacia xs


(a, b)
(a, b, c)

pegarEn3 :: [(String, String)] -> [(String, String, String)]
pegarEn3 [] = []
pegarEn3 ((x,y):xs) = (x,y, x++y) : pegarEn3 xs