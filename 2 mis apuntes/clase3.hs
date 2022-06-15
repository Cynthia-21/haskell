esMultiploDe3 = flip esMultiplo 3
-- flip -> funcion q recive dos parametros (me da vuelta los parametros)
-- flip :: (a -> b ->c) -> b -> a ->c

module Lib where

nombreDeJuli :: String
nombreDeJuli = "Julian Berbel Alt"
edadDeJuli :: Int
edadDeJuli = 27

saludar :: String -> String
saludar persona = "hola" ++ persona

-- TUPLA=> valor compuesto (t es la cantidad de valores que tiene la tupla)
juli:: (String , Int)
juli= ("Julian Berbel Alt", 27)
-- agrupar valores o cosas con distinto tipo

-- con tupla
saludar :: (String, Int) -> String
saludar persona = "hola" ++ fst persona
-- fst => primer elemento de la tupla
-- snd => segundo elemento de la tupla
-- 

nombrePersona :: (String -> Int) -> String
nombrePersona persona = fst persona

edadPersona:: (String, Int) -> Int
edadPersona persona = snd persona

cumplirAños :: (String, Int) -> (String,Int)
cumplirAños persona = (nombrePersona persona , edadPersona persona + 1)

-- El parametro no me interesa se le pone un "_"
fst :: (a,b) -> a
fst (x, _) = x

snd :: (a , b) -> b
snd (_ , y) = y

trd3 :: (a,b,c) -> c
trd3 (_,_,z) = z

trd4 :: (a,b,c,d) -> d
trd4 (_,_,_,m) = d
constante x y = x
-- recibe dos valores y devuelve uno solo

:i persona 
-- tipo de la persona

type Persona = (String , Int)
type Estudiante = (String , Int)

diego :: Estudiante
diego = ("Diego Hernandez" , 14324) -- diego es estudiante

data Persona = Persona String Int

data Estudiante = Estudiante String Int

juli :: Persona
juli = Persona "Julian " 27

diego :: Estudiante
diego = Estudiante "DIego Hernandez" 243243

cumplirAños :: Persona -> Persona
cumplirAños persona = Persona (nombrePersona persona) (edadPersona persona + 1)


nombrePersona:: Persona -> String
nombrePersona ( Persona nombre edad) = nombre

edadPersona:: Persona -> Int
edadPersona ( Persona nombre edad) = edad

-- Pattern Matching => descomponer algo (lo q recibo)

nombrePersona :: Persona -> String
nombrePersona ( UnPersona nombre edad) = nombre

-- Data record syntax
-- otra forma de escribirlo para q ya existan estas funciones
data Persona = Persona {
    nombrePersona :: String,
    edadPersona :: Int,
    equipoArgentinoDePrimeraA :: EquipoArgentinoDePrimeraA
} deriving (Show)
-- deriving (Show) esto va para q se sepa mostrar x pantalla

-- muchas componentes
data EquipoArgentinoDePrimeraA = Boca | River | SanLorenzo | Independiente

juli :: Persona
juli = Persona "Julian " 27 SanLorezo

data Bool = False | True

data Buleano = Falso | Verdadero deriving (Show)

negacion :: Buleano -> Buleano
negacion Falso       = Verdadero
negacion Verdadero   = Falso

numeros = [1,2,3,4,5,6,7,8,9]
-- LISTAS
--['h','o','l','a']
-- "hola"
-- length "hola"
-- 4
-- length [1,2,3,4,5,6,7,8,9]
-- 9

-- elem 6 [1,2,3,4,5,6,7,8,9]
-- True
-- elem 0 [1,2,3,4,5,6,7,8,9]
-- False

-- numeros !! 3 (elemento en la posicion 4 de la lista)
-- 4
-- numeros !! 0 
-- 1

-- numeros => no puedo agregar y sacar cosas de la lista
-- 10 : numeros
-- [10,1,2,3,4,5,6,7,8,9]

-- mayor o menor
-- numeros > [2,3,4]
-- False

-- reverse numeros (invierte la lista)
-- [9,8,7,6,5,4,3,2,1]

-- concatenar listas (++)
-- numeros ++ [4,6,7,4]
-- [1,2,3,4,5,6,7,8,9,4,6,7,4]

-- null=> recibe una lista y me dice si esta vacia o no
-- null numeros
-- False

-- tipo de lista vacia
-- :t []
-- [] :: [a]

-- !! que elemento hay en la lista en ese espacio
-- numeros !! 5
-- 6

-- take => toma los primeros n elementos de la lista
-- take 5 numeros
-- [1,2,3,4,5]

-- drop => descarta los primeros n elementos de la lista
-- drop 5 "hola como estas"
-- "como estas"

--filter => filtro lo q necesito
-- filter even numeros (filtro los numeros impares)
-- [2,4,6,8]
-- filter odd numeros (filtro los numeros pares)
-- [1,3,5,7,9] 

-- filter (esMulploDe 4) numeros
-- [4,8]

-- :t filter
-- filter :: (a -> Bool) -> [a] -> [a]

-- filter (esMultiploDe 3 . lenght) ["hola", "como", "estan", "?" , "todo bien"]

-- tipo map :: (a -> b) -> [a] -> [b]

-- map length ["hola", "como", "estan", "?" , "todo bien"]
-- [4,4,5,1,9] (me dio la longitud de cada una de las palabras)

-- map edadPersona [juli, fede]
-- [27, 34]

-- nombre de las personas q tengan mas de 30 años
-- map nombrePersona (filter ((>30) .edadPersona) [juli, fede])
-- ["Federico Alfredo Scarpa"]

esMulploDe divisor dividendo = rem dividendo divisor == 0


(filter ((>30) .edadPersona) [juli, fede]
            g                       x

map nombrePersona (filter ((>30) .edadPersona) [juli, fede]
             f    (          g                      (x)   )
-- funcion compuesta (ambas son equivalentes)
-- map nombrePersona . filter ((>30) .edadPersona [juli, fede]