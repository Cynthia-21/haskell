-- Expresiones lambda => una funcion q no tiene nombre

siguiente unNumero = unNumero + 1
type Persona = (String , Int)

cumplirAños :: Persona -> Persona
cumplirAños (nombre , edad) = (nombre , siguiente edad)
-- es lo mismo que
cumplirAños (nombre , edad) = (nombre , (\unNumero -> unNumero +1) edad)
-- la funcion lambda se simboliza con \ y en este caso a un numero le sumo 1
-- Se usa cuando: 
--  1. cuando no tenemos un buen nombre para la abstraccion
--  2. cuando no la vamos a volver a usar
map :: (a -> b) -> [a] -> [b]
pam :: a -> [(a -> b)] -> [b]
pam valor unasFunciones = map (aplicar valor) unasFunciones

-- aca puedo usar \ ya que el nombre no es muy bueno
aplicar unValor unaFuncion = unaFuncion unValor

-- =>
pam valor unasFunciones = map (\unaFuncion -> unaFuncion valor) unasFunciones
-- se usa con funciones de orden superior como map o filter (es el ultimo recurso)

esMultiploDe :: Int -> Int -> Bool
esMultiploDe multiplo elOtro = rem multiplo elOtro == 0

-- si tengo una expresion lambda con mas de 1 parametro=> 
(\parametro1 parametro2 parametro3...) -> rem multiplo elOtro == 0

-- composicion 
(.) :: (b -> c) -> (a -> b) -> (a ->c)
-- toma 2 parametros (dos funciones b y c)
(.) unaFuncion otraFuncion = (\unValor -> unaFuncion (otraFuncion unValor))
-- una funcion q toma un valor y me devuelve una funcion le aplica unaFuncion a otraFuncion

(.) f g = (\x -> f (g x))
-- f y g son funciones y x lo q le aplico y me devuelve una funcion

-- currificacion => de n parametros en una cadena n funciones de l funciones => esto lo hace automatico

-- toma 4 numeros y me devuelve otro numero
sumaDe4 :: Num a => a -> a -> a -> a -> a 
sumaDe4 numero1 numero2 numero3 numero4 = numero1 + numero2 + numero3 + numero4

-- con lambda
sumaDe4' :: Num a => a -> (a -> a -> a -> a)
sumaDe4' numero1 = (\numero2 numero3 numero4 -> numero1 + numero2 + numero3 + numero4 )

-- funcion q toma un parametro y me devuelve dos parametros mas
sumaDe4'' :: Num a => (a -> (a -> a -> a -> a))
sumaDe4'' numero1 = (\numero2 -> (\ numero3 numero4 -> numero1 + numero2 + numero3 + numero4)) 

-- otra forma
sumaDe4''' :: Num a => a -> (a -> (a -> (a -> a)))
sumaDe4''' numero1 = (\numero2 -> (\ numero3 -> (\numero4 -> numero1 + numero2 + numero3 + numero4))) 

-- otra forma mas => asi es como lo ve haskell

sumaDe4'''' :: Num a => (a -> (a -> a -> a -> a))
sumaDe4'''' = (\numero1 -> (\numero2 -> (\ numero3 -> (\numero4 -> numero1 + numero2 + numero3 + numero4))))

-- asi lo ve haskell
function suma2 (unNumero, otroNumero) {
    return unNumero + otroNumero
}

funtion suma2 (unNumero) {
    return function (otroNumero) {
        return unNumero + otroNumero
    }
}

doble :: Int -> Int
siguiente ::        -> Int -> Int 
-- se puede escribir asi
doble . siguiente :: Int -> Int

(.)     :: (b           ->  c ) -> (a ->       b      ) -> (a   -> c  )
doble   :: (Int -> Int) -> Int  ->  Int -> (Int -> Int) -> (Int -> Int)

(+) :: Int -> Int -> Int 

-- GUARDAS => me permite definir una funcion x partes
-- seria como un if and else 
valorAbsoluto :: (Ord a , Num a) => a -> a
valorAbsoluto unNumero 
    | unNumero >= 0 = unNumero -- es de tipo Bool (si o si de ese tipo) => es una condicion
    | unNumero < 0  = -unNumero

-- otherwise (en cualquier otro caso) = True
valorAbsoluto :: (Ord a , Num a) => a -> a
valorAbsoluto unNumero 
    | unNumero >= 0 = unNumero -- es de tipo Bool (si o si de ese tipo) => es una condicion
    | otherwise     = -unNumero

-- compilacion
--valorAbsoluto 3
--3
--valorAbsoluto (-3) => si o si con () cuando es negativo
--3

-- si es de tipo Int no es necesario las demas restrcciones (ord)
factorial:: Int -> Int 
factorial unNumero
    | unNumero == 0 = 1
    | unNumero  > 0 = unNumero * factorial (unNumero - 1) --recursividad

tipoRaices :: (Ord a ,Num a) => a -> a -> a -> String
tipoRaices a b c 
    | b^2 - 4 * a * c == 0 = "Raiz doble"
    | b^2 - 4 * a * c > 0  = "Dos raices simples"
    | otherwise            = "Dos raices imaginarias" -- lo mismo con negativos

-- otra forma (mejorada)
tipoRaices :: (Ord a ,Num a) => a -> a -> a -> String
tipoRaices a b c 
    | discriminante== 0 = "Raiz doble"
    | discriminante > 0 = "Dos raices simples"
    | otherwise         = "Dos raices imaginarias"
    where -- donde
    |discriminante =  b^2 - 4 * a * c 
-- funcion q solo se usa dentro de tipoRaices => DEFINICION LOCAL => defino algo q solo puedo definir dentro de una funcion

-- consola
--tipoRaices 1 (-2) 3
--"Dos raices imaginarias"

-- PATTERN MATCHING => defino cosas q puedo hacer con guardas lo puedo ver de otra forma
-- esto en guardas
factorial:: Int -> Int 
factorial unNumero
    | unNumero == 0 = 1
    | unNumero  > 0 = unNumero * factorial (unNumero - 1)

-- en pattern matching => q me tiene q llegar x parametro
factorial' :: Int -> Int 
factorial' 0 = 1
factorial' n = n*factorial' (n-1)
-- si o si en ese orden

listaDe4ElementosSinElTercerElemento :: [a] -> [a] --es generico xq no especifique nada
listaDe4ElementosSinElTercerElemento [x , y , z , w] = [x, y, w]

listaDe4Elementos :: [Bool] -> [Bool] --es generico xq no especifique nada
listaDe4Booleanos[True , y , z , w] = [y, z, w]




