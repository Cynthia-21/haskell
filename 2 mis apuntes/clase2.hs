-- cd mover de carpeta
-- compilador stack gchi (archivo)

frecuenciaCardiacaPromedio :: Int
frecuenciaCardiacaPromedio = 80

hacerEjercicio :: Int -> Int
hacerEjercicio frecuenciaCardiaca = frecuenciaCardiaca + 50

-- taquicardia (pregunta si devuelve un booleano)
tieneTaquicardia :: Int -> Bool
tieneTaquicardia frecuenciaCardiaca = frecuenciaCardiaca >=100

frecuenciaCardiacaDeJuli :: Int
frecuenciaCardiacaDeJuli = frecuenciaCardiacaPromedio
-- esto siempre va a ser 80 xq es una constante (no lo puedo cambiar el valor)

-- expresiones: tiene valor pero no efecto ej 5*2
-- sentencias: no tienen valor pero si efecto ej aux =123

-- aux = 5 * 3
-- aux = algo es una sentencia xq cambia el valor de aux

-- COMPOSICION -> operador binario
--f (g x)= (f . g) x
--(tieneTaquicardia . hacerEjercicio) frecuenciaCardiacaPromedio
--tieneTaquicardia . hacerEjercicio $ frecuenciaCardiacaPromedio
-- es lo mismo funcion $ parametro (estructura del $)

-- ++ concatenar strings
-- || comparo (esto o esto)
-- && comparo (esto y esto)

-- Precedencia de operaciones
-- Parentesis
-- aplicacion prefija -> como se escribe la funcion unaFuncion parametro1 parametro2 ... parametroN
-- .
-- ^
-- * , /
-- + , -
-- <, > , ==
-- &&
-- ||
-- $ -> aplica la funcion con el valor (no sirve mucho)
-- son operadores binarios (son todos simbolos desde linea 37 a 44)

-- prefija
-- consola
-- (+) 5 8
-- 13
-- (-) 5 8
-- -3
-- suma 2 3

-- notacion infija 
-- 3 + 8

-- 5 ´suma´ 8
-- 13

--length "Paradigmas"
--length $ "Paradirgmas"

-- tipo de $
-- ($) :: (a ->b) -> a  (tipo parametro 2) -> b (tipo del retorno (puede ser del mismo tipo o distinto))

($) :: (a -> b) -> a -> b
unaFuncion $ unValor = unaFuncion unValor
-- prefija => ($) unaFuncion unValor = unaFuncion unValor
-- le paso a una funcion ese valor con dominio a

-- tipo de la composicion (.)
(.) :: (b -> c) -> (a -> b) -> a -> c 

--MAX
-- funcion q devuelve el maximo entre dos cosas
-- max (-5) 7
-- 7
-- max 'a' 'c'
-- 'c'

-- max :: Int -> Int -> Int
-- (max dos) 5

-- CONST  => toma dos valores y me devuelve 
const :: a->b-> a
const dos :: b -> Int

-- (1+) 5
--6
-- (1/) 5 => es como poner 1/5
-- 0,2
-- (/1) 5 => es como poner 5/1
-- 5

-- (substrat 5) 2 => es como poner 2-5
-- -3  
-- (substract 2) 5 => es como poner 5-2
-- 3

suma unNumero otroNumero ultimoNumero = unNumero + otroNumero + ultimoNumero

-- 1´sumaDeTres´ 2
-- <function>
-- :t (1´sumaDeTres´ 2)
-- 1´sumaDeTres´ 2 :: Num a => a -> a 

-- formas de definir funciones:
-- definicion tradicional : con nombre en archivo de otro
-- aplico parcialmente -> ejemplo 

---------------------------------------------------------------------------------------------------------------------------------
-- Orden superior ->  toman funciones como parametro (particularidad)
(.) :: (b-> c) -> (a -> b) -> (a -> c)
($) :: (a ->b) -> a -> b
flip :: (a -> b -> c) -> b -> a -> c
-- flip (+) 5 2
-- 7
-- flip (/) 2 5
-- 2,5 => aplico los parametros alrevez hace 5/2 o (/) 5 2
-- flip const 2 5
--5
-- flip (/) 5 . (+1) $ 8 
-- 1.8
-- const ->toma dos parametros y me devuelve el primero (no es necesario q sean del mismo tipo)

-- (.) :: (b-> c)    ->   (a  ->       b)       -> (a -> c)
--          (*3)               (+)
--       (Int -> Int)     (Int -> (Int -> Int))

funcionMisteriosa2 :: show d => d -> Int 
funcionMisteriosa2 = length . show

length :: String -> Int
show :: Show a => a -> String
unaFuncion :: tipo del parametro 1 -> tipo del parametro 2 ... -> tipo del parametro N
unaFuncion parametro1 parametro2 ... parametroN = valorRetorno
