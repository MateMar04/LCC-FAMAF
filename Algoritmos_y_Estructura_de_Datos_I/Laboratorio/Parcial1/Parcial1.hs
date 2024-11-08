module Parcial1 where

-- Datos de testeo

pepito :: Lanzamiento
pepito = Album "Pepe" "Pepito" ["1", "2", "3"] 2023

pepitoDeluxe :: Lanzamiento
pepitoDeluxe = Album "Pepe" "Pepito" ["1", "2", "3", "4", "5"] 2023


planA :: Lanzamiento
planA = Sencillo "Plan A" "Paulo Londra" 189 2023

nubes :: Lanzamiento
nubes = Sencillo "Nubes" "Paulo Londra" 203 2024

colaReproduccion' :: ColaLanzamiento
colaReproduccion' = Encolada cliclsModernos (Encolada planA (Encolada nubes Vacia))



-- Ejercicio 1
-- a)
type Nombre = String
type Artista = String
type Duracion = Int
type Temas = [String]
type AnioEstreno = Int

data Lanzamiento = Album Nombre Artista Temas AnioEstreno | Sencillo Nombre Artista Duracion AnioEstreno deriving (Show)


-- b)
cliclsModernos :: Lanzamiento
cliclsModernos = Album "Clics Modernos" "Charly Garcia" ["Nos siguen pegando abajo", "No soy un extraño", "Dos cero uno", "Nuevos trapos", "Bancate ese defecto", "No me dejan salir", "Los dinosaurios", "Plateado sobre plateado", "Ojos de video tape"] 1983

africa :: Lanzamiento
africa = Sencillo "Africa" "Toto" 260 1982

-- c)
esDelArtista :: Lanzamiento -> String -> Bool
esDelArtista (Album _ artista _ _) nombre = artista == nombre
esDelArtista (Sencillo _ artista _ _) nombre = artista == nombre

-- d)
esEP :: Lanzamiento -> Bool
esEP (Album _ _ temas _ ) = length(temas) <= 4
esEP (Sencillo _ _ _ _) = False

-- e)
minSencillosArtista :: [Lanzamiento] -> String -> Int
minSencillosArtista [] _ = 0
minSencillosArtista (Sencillo _ a d _ : xs) art
            | a == art = d + minSencillosArtista xs art
            | a /= art = minSencillosArtista xs art
minSencillosArtista (Album _ _ _ _ : xs) art = minSencillosArtista xs art

-- Ejercicio 2
data ColaLanzamiento = Vacia | Encolada Lanzamiento ColaLanzamiento deriving (Show)

colaReproduccion :: ColaLanzamiento
colaReproduccion = Encolada cliclsModernos (Encolada africa Vacia)

soloSencillos :: ColaLanzamiento -> ColaLanzamiento
soloSencillos Vacia = Vacia
soloSencillos (Encolada (Sencillo nom art dur anio) cola) = (Encolada (Sencillo nom art dur anio) (soloSencillos cola))
soloSencillos (Encolada (Album nom art tem anio) cola) = soloSencillos cola



