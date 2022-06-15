module Lib where

import Text.Show.Functions
import Data.Char

-----------
-- Pto 1 --
-----------
--Modelar a los barbaros
data Barbaro = Barbaro {
    nombre :: String,
    fuerza :: Int,
    habilidades :: [String],
    objetos :: [Objeto]
} deriving (Show)

type Objeto = Barbaro -> Barbaro

dave = Barbaro "Dave" 100, ["tejer","escribirPoesia"] [ardilla, libroPedKing]
tomi = Barbaro "Tomas" 90 , ["tejer","escribirPoesia"] [ardilla, libroPedKing]

--A 
--Las espadas aumentan la fuerza de los bárbaros en 2 unidades por cada kilogramo de peso
espadas :: Int -> Objeto
espadas peso = cambiarFuerza (+ (peso * 2))

cambiarFuerza :: (Int -> Int) -> Barbaro -> Barbaro
cambiarFuerza funcion barbaro = barbaro { fuerza = funcion . fuerza $ barbaro }
--cambiarFuerza funcion barbaro = barbaro { fuerza = funcion (fuerza barbaro) }

--B
--Los amuletosMisticos puerco-marranos otorgan una habilidad dada a un bárbaro
amuletosMisticos :: String -> Objeto
amuletosMisticos = otraHabilidad

otraHabilidad :: String -> Barbaro -> Barbaro
otraHabilidad habilidad = cambiarHabilidad (habilidad :)
--agrego una nueva habilidad a la cola

cambiarHabilidad :: ([String]-> [String]) -> Barbaro -> Barbaro
cambiarHabilidad funcion barbaro = barbaro { habilidad = funcion . habilidad $ barbaro } 

--c 
--Las varitasDefectuosas, añaden la habilidad de hacer magia, pero desaparecen todos los demás objetos del bárbaro.
varitasDefectuosas :: Objeto
varitasDefectuosas = otraHabilidad "hacer magia" . vaciarObjetos

-- quito elementos de una lista
vaciarObjetos :: Barbaro -> Barbaro
vaciarObjetos = cambiarObjetos (const [])

cambiarObjetos:: ([Objeto]-> [Objeto]) -> Barbaro -> Barbaro
cambiarObjetos funcion barbaro = barbaro { objetos = funcion . objetos $ barbaro } 

-- d
-- Una ardilla, que no hace nada.
ardilla :: Objeto
ardilla = id

--e 
--Una cuerda, que combina dos objetos distintos, obteniendo uno que realiza las transformaciones de los otros dos.
cuerda :: Objeto -> Objeto -> Objeto
cuerda = (.)

-----------
-- Pto 2 --
-----------

--El megafono es un objeto que potencia al bárbaro, concatenando sus habilidades y poniéndolas en mayúsculas. 
-- Sabiendo esto, definir al megafono, y al objeto megafonoBarbarico, que está formado por una cuerda, una ardilla y un megáfono. 

megafono :: Objeto
megafono = ((:[]) . map toUpper . concat )

megafonoBarbarico :: Objeto
megafonoBarbarico = cuerda ardilla megafono

-----------
-- Pto 3 --
-----------

--Una aventura se compone de uno o más eventos
type Aventura = [Eventos]
-- un grupo de bárbaros puede sobrevivir a cierta aventura
type Eventos = Barbaro -> Bool

-- invasionDeSuciosDuendes: Un bárbaro sobrevive si sabe “Escribir Poesía Atroz”
invasionDeSuciosDuendes :: Eventos
invasionDeSuciosDuendes barbaro = (elem “Escribir Poesía Atroz” . habilidad) barbaro

-- cremalleraDelTiempo: Un bárbaro sobrevive si no tiene pulgares. Los bárbaros llamados Faffy y Astro no tienen pulgares, los demás sí. 
cremalleraDelTiempo :: Eventos
cremalleraDelTiempo' (Barbaro nombre _ _ _) = nombre == "Faffy" || nombre == "Astro"

--ritualDeFechorias: Un bárbaro puede sobrevivir si pasa una o más pruebas como las siguientes: 
----saqueo: El bárbaro debe tener la habilidad de robar y tener más de 80 de fuerza.

ritualDeFechorias :: Aventura
ritualDeFechorias barbaro = 

saqueo :: Eventos
saqueo barbaro = (tieneHabilidad "robar" && tieneFuerzaSuperiorA 80) barbaro

-- gritoDeGuerra: El bárbaro debe tener un poder de grito de guerra igual a la cantidad de letras de sus habilidades. 
-- El poder necesario para aprobar es 4 veces la cantidad de objetos del bárbaro

gritoDeGuerra :: Eventos
gritoDeGuerra barbaro = (==grito barbaro) . length . concat . habilidad $ barbaro
    where grito = (*4) . length . objeto

-- caligrafia: El bárbaro tiene caligrafía perfecta (para el estándar barbárico de la época) si sus habilidades contienen más de 3 vocales y comienzan con mayúscula.
caligrafia :: Eventos
caligrafia barbaro = (esMayuscula && masDe3Vocales) habilidad

esMayuscula :: String -> Bool
esMayuscula = isUpper . head

masDe3Vocales :: String -> Bool
masDe3Vocales cadena = (>=3) . (foldl cantVocales 0)

cantVocales :: String -> Int -> Bool 
cantVocales cadena cant 
    | esVocal cadena = cant + 1
    | otherwise = cant 

esVocal :: Char -> Bool
esVocal = (`elem` "aeiou")

