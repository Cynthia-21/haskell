-- DECLARACION o TIPO -> conjunto de valores asociados a operaciones que puedo trabajar

-- char
letraDeLaCarreraDeLaUTN= 'K'
letraDeLaCarreraDeLaUTN :: Char

-- String
comoMeLLamo = "Cynthia"
comoMeLLamo :: String

--Float
elNumeroPi= 3.141596
-- el numero pi es de tipo float
elNumeroPi :: Float

--int
edad =22
edad :: Int

-- bool
yoSoyFeliz = True 
yoSoyFeliz :: bool

--lengh :: String -> Int

----------------------------------------------------------------------------------------
--clase de tipos o familia de tipos -> es un contrato que especifica lo q tiene que hacer 
-- Num / fractional / ord (orden < o >) / eq (igualdad == / !=) / show (lo q se sabe mostrar x consola)
--------------------------------------------------------------------------------------------------------------

-- FUNCIONES -> 
    -- existencia (para todo elemento de nuestro dominio alla una imagen)
    -- unicidad (solo alla una imagen )

--va de todos los reales a todos los reales
-- hace el doble de un numero
doble :: Float -> Float
doble unNumero = 2 * unNumero

------------------------------------------
cuadruple :: Float -> Float
cuadruple :: Num a => a -> a
-- la diferencia es q el primero no te toma la diferencia entre entero y float y el segundo si

cuadruple unNumero = 4 * unNumero
cuadruple' unNumero = 2 * doble unNumero
cuadruple'' unNumero = doble (doble unNumero)
-- composicion (usar de esta forma)
-- asi me incluye al entero para q puedan funcionar juntos los enteros con los float
cuadruple''' :: Num a => a -> a
cuadruple''' unNumero = (doble . doble) unNumero

-- cuadruple solo es la composicion de doble con doble (esta es la mejor forma)
cuadruple''' :: Num a => a -> a
cuadruple'''' = doble . doble

-- la funcion dentro de un paradigma funcional es un valor 
-----------------------------------------------------------------------------------------

cuadrado :: Float -> Float
cuadrado unNumero = unNumero * unNumero

-- va de enteros a enteros
-- es una funcion q va de un entero y devuelve un entero
anterior :: Int -> Int
anterior unNumero = unNumero - 1

-- resto -> rem
-- modulo -> mod

-- dos parametros dos flechas
sonMultiplos :: Int -> Int -> Bool
sonMultiplos unNumero otroNumero = rem unNumero otroNumero == 0

-- composicion -> solo puedo componer funciones q esperan un parametro no 2 
elDobleDelAnterior unNumero = (doble . anterior) 8

-- no se puede xq not tiene un parametro y multi tiene 2
(not. sonMultiplos) 4 3 

----------------------------------------------------------------------------------------

-- COMPILACION
-- cuadrado (doble 67.8)
-- 18387.361

-- :t cuadrado (doble 67.8)
-- cuadrado (doble 67.8):: Float

-- MAYOR Q O MENOR Q
-- ghci> 1 > 3
-- false
-- ghci> 3 > 1
-- true
-- ghci> 'A' > 'B'
-- true
-- ghci> "hola" < "chau"
-- false
-- ghci> "hola" < "helado"
-- false
-- true > false
-- true

-- MAXIMO
-- max 1 3
-- 3

-- MINIMO
-- min 1 3
-- 1

-- COMPARAR
-- 1 == 3
-- false
-- 'a' == 'A'
-- false

-- GENERICO
-- identidad "hola"
-- "hola"
-- identidad True
-- true
-- tipo de dato cualquiera sin restrigcion (id)
-- :t identidad
-- identidad :: p -> p
-- como no aclare es lo mas generico que hay

-- CONST
-- const devuelve siempre el primer valor
-- const 4 "hola"
-- 4
-- :t const
-- const :: a -> b -> a
-- las letras son distintas xq pueden ser un tipo de dato diferente (uno es int y el otro es string en el ejemplo anterior)

------------------------------------------------------------------------------------------------

-- COMANDOS
-- :r -> recarga el archivo


-- :t -> dice el tipo (sin necesidad de especificarlo) x ejemplo 
-- :t elNumeroPi
-- elNumeroPi :: Float

-- que esctructura tiene el menor
-- :t (<)
-- (<):: Ord a => a -> a -> Bool 


-- :i obtengo info de una familia de tipos
-- ejemplo 
-- :i Num
-- type Nume :: * -> constrait
-- (+) :: a -> a -> a
-- (-) :: a -> a -> a
-- (*) :: a -> a -> a
-- negate :: a -> a



