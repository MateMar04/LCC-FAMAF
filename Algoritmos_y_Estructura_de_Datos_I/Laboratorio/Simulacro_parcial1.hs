module Simulacro_parcial1 where

-- Ejercicio 1
-- a)

type Altura = Int

data Modalidad = Carretera | Pista deriving (Show)

data Deportista = Velocista Altura | Ciclista Modalidad deriving (Show)

-- b)
juan :: Deportista
juan = Velocista 172

-- c)
esVelocistaAlto :: Deportista -> Int -> Bool
esVelocistaAlto (Velocista altura) n = altura > n
esVelocistaAlto _ n = False

-- d)
contarVelocistas :: [Deportista] -> Int
contarVelocistas [] = 0
contarVelocistas (Velocista _ : xs) = 1 + contarVelocistas xs
contarVelocistas (_ : xs) = contarVelocistas xs

-- e)
esCiclista :: Deportista -> Bool
esCiclista (Ciclista _) = True
esCiclista _ = False


--Ejercicio 2
data Cola = VaciaC | Encolada Deportista Cola deriving (Show)

encolar :: Deportista -> Cola -> Cola
encolar dep VaciaC = Encolada dep VaciaC
encolar dep (Encolada dep' c) = Encolada dep' (encolar dep c)

