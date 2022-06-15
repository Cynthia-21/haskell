-- MUMUKI 1 PROGRAMACION FUNCIONAL

-- los bool siempre van con mayuscula la primera
marioTieneGato = False

-- string
peliculaFavoritaAna = "Gladiador"

-- FUNCIONES 
-- sgte
siguiente numero = numero + 1
--anterior
anterior numero = numero - 1
--doble
doble numero = numero *2
--cuadrado
cuadrado numero = numero *numero
-- bool un número es positivo?
esPositivo :: Int -> Bool
esPositivo numero = numero > 0
-- calcular el perímetro de un rectángulo formula => 2 * lado1 + 2 * lado2 => implica el pasaje de 2 parametros
perimetroRectangulo lado1 lado2 = 2 * lado1 + 2 * lado2

-- COMBINACION
--toma un número por parámetro, y le suma uno y luego lo multiplica por 2
 dobleDelSiguiente numero = doble (siguiente numero)

 -- COMPOSICION 
 --dos funciones, y cada una debe tomar un único parámetro
 dobleDelSiguiente = doble.siguiente
 --dobleDelSiguiente es doble compuesto con siguiente
 --toma un número por parámetro, y le suma uno y luego lo multiplica por 2
 --dobleDelSiguiente numero = doble (siguiente numero)

 -- OPERANDOS 
 -- + , - , *
 -- las funciones comunes se aplican de forma prefija (es decir, delante de sus argumentos): siguiente numero
 -- los operadores se utilizan de forma infija (es decir, entre medio de sus argumentos): 3 + numero
 siguiente numero = (+) numero 1
 -- es lo mismo que siguiente numero = 1 + numero

 -- FUNCIONES PARA STRINGS

-- length nos dice el largo de un string
  length "seru giran"
  -- 10

-- head nos devuelve el primer caracter (la primer letra) de un string
   head "xilofon"
   -- x
-- me diga si el mismo comienza con la letra 'a'
  comienzaConA a= (head a)== 'a'

 -- ++ nos permite concatenar (unir) strings y es infija
  "hola " ++ "mundo"
  -- hola mundo

 -- elem nos dice si una letra (o cualquier caracter) forma parte de una palabra.
  elem 'a' "moto"
  --False

-- función cuantoMidenJuntos que te diga cuánto miden dos strings concatenados
cuantoMidenJuntos primer = length . (++ primer)

-- esMultiploDeTres que dice si un número se puede dividir por 3 (teniendo en cuenta la funcion esMultiploDe  que nos dice si un número es múltiplo de otro)
esMultiploDeTres n = esMultiploDe n 3

-- recibe un número y un string, y me dice si el string tiene más letras que el número
--opcion 1
esMasLargoQue numero palabra = length palabra > numero
--opcion 2
esMasLargoQue x = (x<) . length

-- aca utiliza || (o) && (and) not (negacion)
esBisiesto fecha= esMultiploDe fecha 400 || (esMultiploDe fecha 4 && not (esMultiploDe fecha 100))
-- Un año es bisiesto si: es múltiplo de 400, o bien es múltiplo de 4 pero no de 100

-- haceFrioCelsius que nos diga si hace menos de 8 grados Celsius
haceFrioCelsius = (8>)

-- haceFrioFarenheit que también nos diga si hace frío, pero que tome una temperatura expresada en grados Farenheit.
deFarenheitACelsius temperatura = (temperatura - 32)  * 5 / 9
haceFrioFarenheit= haceFrioCelsius . deFarenheitACelsius

-- maximoEntreTres: toma tres mediciones y nos da la más alta
maximoEntreTres a b c = max (max a c) (max b c)

-- minimoEntreTres: toma tres mediciones y nos da la mas baja
minimoEntreTres a b c = min (min a c) (min b c)

-- dispersion: toma los tres mediciones y devuelve la diferencia entre la más alta y la más baja. 
dispersion a b c = (maximoEntreTres a b c) -(minimoEntreTres a b c)

-- Número entero	-4, 0, 1, 3, 10     =>   (+) (-) (*)
-- Número con coma	3.14, 1.62, 2.71    =>	 (+) (-) (*) (/)
-- Booleano	True, False	                =>   not (&&)
-- Todos los anteriores	1, 3.14, True   =>  (==) (/=)

-- COMPOSICION
-- unaFuncionNueva x = unaFuncion (otraFuncion numero) => SIN COMPOSICION
-- unaFuncionNueva = unaFuncion.otraFuncion => x composicion

--largoEsPar = even . length => composicion de una función largoEsPar, que tome un string y nos diga si su longitud es par

-- TIPOS DE UNA FUNCION
-- hay funciones q trabajan con numeros (tanto int como float)
-- hay otras que si o si son de un tipo:
   rem :: Int -> Int -> Int
   esPar :: Int -> Bool
   esPar numero = rem numero 2 == 0 
   (/) :: Float -> Float -> Float
   porcentaje :: Float -> Float -> Float
   porcentaje cantidad total = cantidad * 100 / total

--Eq: las cosas que se pueden comparar por distinto e igual (/= y ==). Casi todo en Haskell es comparable, salvo las funciones. ¡doble == even rompe!
-- Ord:las cosas que son comparables y además pueden ser ordenadas de menor a mayor, como los Int, Float, Char y String. Estos tipos pueden ser comparados mediante <, >, >=
-- Show: las cosas que se pueden convertir en un string y mostrar en una consola, mediante la función show

-- se usa ord xq tengo q usar mayor q o menor q
estaEntre :: (Ord a) => a -> a -> a -> Bool
estaEntre valor menor mayor = valor >= menor && valor <= mayor

-- usa eq xq estoy comparando y uso ord xq estoy ordenando de menor a mayor
sonIgualesOEstaEntre :: (Eq a, Ord b) => a -> a -> b -> b -> b -> Bool
sonIgualesOEstaEntre unValor otroValor valorEntre menor mayor = unValor == otroValor || estaEntre valorEntre menor mayor
-- los dos primeros parámetros tienen que ser del mismo tipo, ¡pero no necesariamente del mismo que los otros tres!

-- funcion ID => retorna el mismo valor que recibio => id :: a -> a (el mas generico)

-- pueden ser de distinto tipo el primero con el segundo
ignoraElPrimero :: a -> b -> b
ignoraElPrimero primero segundo = segundo

-- si o si tiene q ser numerico no se pueden sumar string
sumarTres :: Num a => a -> a -> a -> a
sumarTres uno otro otroMas = uno + otro + otroMas

-- condicion es un booleano y uno y otro los tengo q comparar x eso les va un eq
compararSi :: Eq a => Bool -> a -> a -> Bool
compararSi condicion uno otro = not condicion || uno == otro

-- cuando es un float si o si se tiene q utilizar fractional
--  la división / sólo funciona con números con coma (Float) y no para todos los números (Num)
mitad :: Fractional a => a -> a
mitad numero = numero / 2

esParO :: Int -> Bool -> Bool
esParO numero condicion = even numero || condicion

-- el primer parámetro es mas chico que el segundo o más grande que el tercero
fueraDeRango :: Ord a => a -> a -> a -> Bool
fueraDeRango a b c = a < b || a > c 

longitudPar :: String -> Bool
longitudPar = even.length

-- funcion even => *Main> even :: Integral a => a -> Bool 
-- la función está definida para todos los tipos que representan a los números enteros. 
-- No le podemos preguntar a un número decimal si es par o no
sumaEsPar :: (Integral a, Eq a, Num a)  => a -> a -> Bool
sumaEsPar a b = even (a + b)
-- Integral se utiliza con : even (pares) - odd (impares) . div cuando quiero que mi funcion pueda tomar cualquier tipo entero

-- los dos primeros argumentos son iguales o bien, los dos últimos argumentos son iguales.
noTanDistintos :: (Eq a, Eq b) => a -> a -> b -> b -> Bool
noTanDistintos a b c d = a == b || c == d


-- APLICACION PARCIAL 
--  aplicar a una función con menos argumentos de los "normales", para obtener otra que reciba los faltantes
dobleDelSiguiente = doble.siguiente
siguiente x = x + 1 
doble x = x * 2
-- es lo mismo q
dobleDelSiguiente = doble.siguiente
siguiente = (+1)
doble x = x * 2
-- es lo mismo q
dobleDelSiguiente = doble.(+1)
doble x = x * 2
-- es lo mismo q 
dobleDelSiguiente = (*2) . (+1)

saludar = (++) "Hola "
-- es lo mismo que 
saludar nombre = "Hola" ++ nombre

--sinTitulo: toma un nombre y lo devuelve tal cual vino
sinTitulo = id
--sr: toma un nombre y le agrega adelante "Sr."
sr = (++) "Sr. "
--reyQuick: toma un nombre y le agrega al final "Rey de los Minisupers"
reyQuick n = n ++ " Rey de los Minisupers"

-- devuelve un numero f 
-- F => es una funcion 
-- 2 y true son parametros de esa funcion
-- funcionMisteriosa1 :: (tipo del parametro1 de f -> tipo del parametro2 de f -> tipo del retorno de f) -> tipo del retorno de funcionMisteriosa1
   funcionMisteriosa1 ::      Num a => (  a        ->        Bool              ->          b)            ->         b
funcionMisteriosa1 f = f 2 True


-- estamos agarrando lo que devuelve f, y se lo pasamos a length
-- y como length toma un string, podemos decir que f si o sí tiene que devolver un string
funcionMisteriosa1 f = length (f 2 True)

-- Un año es bisiesto si: es divisible por 400, o bien es divisible por 4 pero no es divisible por 100
esMultiploDe numero = ((== 0) . rem numero)
esBisiesto año = esMultiploDe año 400 || ((esMultiploDe año 4) && (not . esMultiploDe año) 100 )

-- dobleDelLargo, que da el doble del largo de una palabra
dobleDelLargo = (*2). length

-- sumarNumeroAlTriple => sumarNumeroAlTriple 3 2 = 11 ya que sumarle 2 al triple de 3, da como resultado 11
sumarNumeroAlTriple primero segundo = ((segundo +) . (*3)) primero

-- si su suma es par
sumaEsPar :: Int -> Int -> Bool
sumaEsPar x y = (even.(x+)) y

-- 8 porciones trae una pizza y cada comensal come 3 porciones => si son 3 comensales se necesitan mas pizzas
cantPizzas = (techo. (/8)). (*3)
cuantoPagaCadaUno precio comensales = (precio * cantPizzas comensales) /comensales

-- mejor => recibe dos funciones y un número, y devuelve el resultado de la función que dé un valor más alto.
mejor f1 f2 num = max (f1 num) (f2 num) 

-- TUPLA =>  Agrupamos datos simples, entre paréntesis y separándolos con comas 
martinFierro = ("Martín Fierro", 1872)
fundacion = ("Fundación", 1951)
-- el tipo de la tupla es (String, Int) xq el título es un String y el año de publicación es un Int
-- titulo
titulo (tituloDelLibro, anioDePublicacion) = tituloDelLibro

-- nos dice si un libro se publicó antes de 1959
esUnClasico (_ , anioDePublicacion) = anioDePublicacion < 1956

-- recibe una función y dos valores, y devuelve una tupla compuesta por el resultado de aplicar la función a cada valor
aplicarPar f a b = (f a, f b) 

-- funcion flip => toma una función de dos argumentos y devuelve otra que toma los mismos argumentos, pero dados vuelta.
darVuelta :: (b -> a -> c) -> a -> b -> c
darVuelta f a b = f b a

-- LISTA => las listas pueden tener:
-- cualquier tipo de elementos (incluso tuplas, listas y funciones)
-- cualquier cantidad de elementos (incluso 0 o 1)
-- elementos repetidos
-- Peeeeero, a diferencia de la tuplas, tienen que ser todos sus elementos del mismo tipo

-- en Haskell los strings son listas de caracteres (Chars). Y length funciona para cualquier lista
-- tipo de length :: [a] -> Int

-- compilador
-- "hola"
-- "hola"
--  ['a', 'b', 'c']
-- "abc"

-- take: toma una cantidad N y una lista, y devuelve los primeros N elementos de la lista
-- drop: toma una cantidad N y una lista, y "descarta" los primeros N elementos de la lista
listaMasCorta unaLista = drop 5 unaLista
-- o
listaMasCorta = drop 5 -- aplicacion parcial
-- head: toma el primer valor de la lista
-- map : recibe una función y una lista, y devuelve una lista nueva: el resultado de aplicar la función a cada elemento de la lista original (es de orden superior)
-- map puede devolver una lista de tipo diferente a la orignal, pero siempre tiene la misma cantidad de elementos
map (+1) [2, 3, 4]
[3,4,5]
 map length ["hola", "mundo"]
[4,5]
  map not [True, False, False]
[False,True,True]
  map not []
[]

elPrimeroEsPar :: Num a => [a] -> Bool
elPrimeroEsPar x = even (head x) 

-- tipo de la funcion map
map :: (a -> b) -> [a] -> [b]

-- función recortar, que tome una lista  trunque a sus contenidos a 15 de longitud
recortar :: [(a, [b])] -> [(a, [b])]
recortar = (map funcion)
funcion (a, b) = (a, take 15 b)

--el texto de un tuit es corto <10
tuitCorto = (10>).length.snd

-- filter => devuelve los elementos de una lista que cumplen una condición
filter even [1, 2, 3,4, 2]
[2, 4, 2]
-- filter devuelve siempre una lista del mismo tipo que la original, pero pueden tener menos elementos
nuestroFilter :: (a -> Bool) -> [a] -> [a]


-- UNIDAD 7 - GUARDAS Y PATTER MATCHING
-- estructura => empezamos con el nombre de la función seguido de los parámetros luego cada "definición" de la función empieza con el caracter pipe '|', seguido de la condición que tiene que cumplirse y después a que es igual en tal caso
minimoEntre x y | x > y = y
                | x < y = x
                | x == y = x
-- dado dos números devuelve el menor de ellos. (En caso de ser iguales devuelve cualquiera de los dos, pero lo importante es que devuelva alguno).

cantidadDePochoclosParaMinutosDeCine x
  | x < 40 = 2 -- Si la película dura menos de 40 minutos entonces se necesitan solo 2 paquetes
  | x > 200 = 10 --si dura más de 200 minutos, alcanza con solo 10 paquetes
  | otherwise = x / 20 --en cualquier otro caso, la cantidad de paquetes se calcula como 1 paquete por cada 20 minutos de película
-- devuelve la cantidad de paquetes de pochoclos dada una cierta cantidad de minutos mirando una película

-- Pattern Matching consiste en especificar patrones que deben cumplir un cierto dato y luego si lo hace, deconstruir el dato de acuerdo a esos patrones.
-- maching = encajar
esCero 0 = True
esCero otherwise = False
-- declará una función esCero que diga si un número es cero. 

--Cuando necesitemos recibir un parámetro pero que no nos interesa conocer su valor para la definición de la función, vamos a utilizar lo que llamamos variable anónima
esVocalCerrada _ = False -- que es lo mismo que decir
esVocalCerrada otro = False

-- siempre que hay involucrado un float se pone fractional 
puntosParaSetenta :: (Eq a, Fractional a) => a -> a
puntosParaSetenta 1 = 5.5 --El as (1) tienen 5.5 puntos
puntosParaSetenta 10 = 0.5 -- Las figuras (10, 11, 12) tienen 0.5 puntos
puntosParaSetenta 11 = 0.5
puntosParaSetenta 12 = 0.5
puntosParaSetenta a = a -- Todas las demás cartas tienen tantos puntos como su número

-- TUPLAS: La tupla tiene una cantidad de elementos fija, pero no necesariamente deben ser todos del mismo tipo
-- Las tuplas son escritas entre paréntesis y los valores que la componen están separados por comas
Num a , Num b => (String, a, b)
("Hector", 24, 75)

-- estas funciones sirven solo para las tuplas de 2 valores
-- fst => devuelven el primer elemento
-- snd => devuelve el segundo elemento
-- función distanciaAlOrigen que recibe un par ordenado y devuelve la distancia al origen
distanciaAlOrigen parOrdenado = sqrt ((fst parOrdenado ^ 2)+ (snd parOrdenado ^ 2))
-- sqrt => raíz cuadrada
-- (^) => operador exponenciación

-- poderSoldado que recibe una tupla que modela a un soldado, compuesta por su nombre, fuerza y la destreza del soldado.
poderSoldado ( _ , fuerza , destreza) = fuerza * destreza
soldadoLeGanaA ganador perdedor = poderSoldado ganador > poderSoldado perdedor

-- la funcion aplicar, que recibe una tupla de 2 funciones, y un entero, y devuelve como resultado una tupla con el resultado de aplicar el elemento a cada una de la funciones
aplicar (f1,f2) num = (f1 num , f2 num)

cuentaBizarra (x, y) 
  | x > y = x+y           -- si el primer elemento es mayor al segundo devuelve la suma
  | (y-x) > 10  = y - x   -- si el segundo le lleva más de 10 al primero devuelve la resta 2do – 1ro
	| otherwise = x * y	    -- en otro caso, devuelve el producto


esNotaBochazo = (<4) --Definir la función esNotaBochazo, recibe un número y dice si no llega a 4.
aprobo (nota1,nota2) = not (esNotaBochazo (fst (nota1,nota2))) && not (esNotaBochazo (snd (nota1, nota2)))
-- Definir la función esNotaBochazo, recibe un número y dice si no llega a 4.
notaMinima6 (nota1, nota2) = fst (nota1,nota2) >5 && snd (nota1,nota2) >5
promociono (nota1, nota2) = (nota1+nota2) >13 && notaMinima6 (nota1,nota2)
--Definir la función promociono, que indica si promocionó, para eso tiene las dos notas tienen que sumar al menos 14 y además haberse sacado al menos 6 en cada parcial.

--cuales fueron las notas finales del primer y segundo parcial con la codificación elegida, siempre la mejor nota es el máximo entre nota del parcial y nota del recuperatorio.
notasFinales ((parc1,parc2),(recup1,recup2)) = (max parc1 recup1 , max parc2 recup2) 

--si una persona no rindió un recuperatorio, entonces ponemos un "-1" en el lugar correspondiente
-- dado el par de pares que representa a un alumno, nos dice si el alumno, pudiendo promocionar con los parciales (o sea sin recup.), igual rindió al menos un recuperatorio
recuperoDeGusto ((parc1,parc2),(recup1,recup2)) = promociono (parc1,parc2) && (recup1 > -1 || recup2 > -1)

-- una tupla de 2 elementos (nombre, edad) me devuelva True si tiene al menos 21 años y False en caso contrario
-- esMayorDeEdad (nombre, edad) = edad > 21
esMayorDeEdad = (>=21).(snd) -- uso composicion y aplicacion parcial

-- si el primer elemento es par lo duplica; si no lo deja como está 
-- si el segundo elemento es impar le suma 1; si no deja como está
calcular (num1, num2)
  |even num1 && odd num2 = (num1 *2 , num2 +1)
  |even num1 = (num1 *2 , num2)
  |odd num2 = ( num1, num2 +1)
  |otherwise = (num1 , num2)

Main> calcular (4,5)
(8,6)

Main> calcular (3,7)
(3,8)

-- UNIDAD 13 - EXPRESIONES LAMBDA
-- es una función casi seguro nunca vamos a volver a usar. Estamos poniéndole un nombre a algo que realmente no lo necesita

juntarStrings separador = foldl1 (juntarDosStringsCon separador)

juntarDosStringsCon separador s1 s2 = s1 ++ separador ++ s2

todosDisiviblesPor4OPor100 = all (\x -> divisiblePor 4 x || divisiblePor 100 x)



