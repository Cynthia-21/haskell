clase 7
doble (doble 3)
doble 3 + doble 3
6+ doble 3
--depende de cada lenguaje de programacion es el q usa
lazy evaluation (evaluacion perezosa) => evaluacion diferida => CUIDADO CON LAS LISTAS
evalucion ansiosa => usan casi todos los lenguajes de programacion
call by name => evaluar un resultado antes o despues es lo mismo xq en haskell hay valores no varibles (nunca cambian)
-- undefined => se puede utilizar en cualquier cosa
-- LISTA X RANGO
[1 .. 1000]
-- me muestra todos los numeros del 1 al 1000
-- se puede trabajar con listas infinitas => [1 .. ] => me muestra del 1 al infinito
take 100 [1..]
-- me agarra del 1 al 100
filter even [1 .. ]
-- me filtra los impares (infinitamente)
take 100 . filter even [1 .. ]
-- toma 100 elementos pares de la lista infinita
!! 18 . filter even $ [1 .. ]
-- me agarra el numero 18 de la lista q tengo al filtrar los impares
all even [1 ..]
-- all => si todos los elementos de la lista cumplen esta condicion?
-- si alguno no cumple me tira falso
all odd [2,4 ..]
-- xq evalua si son impares => si no lo son => falso
all even ([2, 4 .. ] ++ [3])
-- el ultimo elemento es un 3 pero como es una lista infinita => se nunca va a llegar
-- :t all
all :: (a -> Bool) -> [a]  -> Bool
-- any => alguno cumple la condicion?

--BUSCAR => hay un bot en discor de haskel
--para que sirve? !ghci [ejemplo de lista] te nuestra los primeros 10 o 50 elementos 
la ultima funcion es show que devuelve el string para mostrar

['a' .. 'z']
-- me toma un lista de la A a la Z
-- pero no se pueden poner string xq solo se pueden poner char o num

-- lista de muchos 1 => lista recursiva
unos :: [Int]
unos = 1 : unos -- no tengo caso base
(:) : a -> [a] -> [a]

 unos !! 8737
-- de la lista unos dame el elemento de la lista 8737

--fold => agarra una lista y converge en un valor
--unfold => agarr un valor y converge a una lista

-- funcion iterate
iterar f a = 
-- iterar
-- iterar :: (t-> t) - t -> [t]
iterar (2*) 1
-- lista q empieza desde el elemento 1 iterando en 2

-- LISTAS RECURSIVAS
-- cycle => si o si lista
-- [a] -> [a]
-- "hola "
-- holaholahola ..
repeat 
-- recibe un valor y devuelve un lista de ese valor
repeat 10
[10, 10, ..]
-- replicate => replica varias veces el valor
-- int -> a -> [a]
take 10 . repeat $5
-- repite 100 veces en una lista el valor 5

-- drop => contrario de take
drop 3 [ 1,2,3,4,5,6,7]
[5,6,7]

--head => evalua el primero 

-- COSAS Q NO SE PUEDEN HACER
-- no funciona => no se puede poner _ _
sumarEnergia (Persona _ energia _ _) = (Persona _ (energia + 5) _ _)

-- no funciona no se puede l composicion solo recibe una funcion => no va el pto entre filter y even => hay error de tipo x mal uso de composicion
triplicarLosPares numeros = (map (*3) . filter . even) numeros
-- se puede componer varias veces
-- funcion $ separa la funcion del valor 
triplicarLosPares numeros =  map (*3) . filter . even $ numeros

-- es lo mismo que decir =>  all esMamifero animales => (== True) => no es necesario es redundante
sonTodosMamiferos animales = all (==True) (map esMamifero animales)

-- and agarra una lista de bool y me dicen si es verdadero => esta mal xq es redundante
sonTodosMamiferos’ animales = (and . map esMamifero) animales
			      all => cambiarlo x


abrirVentanas :: Casa -> Casa
prenderEstufa :: Casa -> Casa
encenderElAireA :: Casa -> Int -> Casa
mudarseA :: String -> Casa -> Casa

miCasaInteligente = Casa { 
     direccion = "Medrano 951",
     temperatura = 26,
     reguladoresDeTemperatura = [abrirVentanas, prenderEstufa,  mudarseA, encenderElAireA 24]
   }
-- el error es q tienen q ser del mismo tipo no pueden ser de distintos mudarse y encender el aire estan rompiendo la funcion => tengo un string en mudarse y un int a encender el aire ( un entero no es una casa y error de tipo)
para q funcione tengo q dar vueta la funcion de encender aire        ... flip encenderElAire 24) => devuelve otra funcio con los parametros cambiados => recibe primero e 24 asi


esBeatle _ = False -- patern maching no aplica aca
esBeatle "Ringo" = True
esBeatle "John" = True
esBeatle "George" = True
esBeatle "Paul" = True

-- para solucionar el error hago

esBeatle "Ringo" = True
esBeatle "John" = True
esBeatle "George" = True
esBeatle "Paul" = True
esBeatle _ = False

si la funcion devuelve un booleano esta prohibido usar guardas => uso conectores logicos


sumaDeLasEdadesRecursiva [] = 0
sumaDeLasEdadesRecursiva lista = edad (head lista) + sumaDeLasEdadesRecursiva (drop 1 lista)
			     usar pattern maching		          tail = drop 1 lista

-- dame una casa igual a esta q devuelve una casa nueva con todos los mismos valores menos la temperatura de la casa q baja 
abrirVentanas casa = casa { direccion = direccion casa, temperatura = temperatura casa - 2, reguladoresDeTemperatura = reguladoresDeTemperatura casa }
--copia de la casa q tengo
-- redundancia

-- no esta mas algo sutil para corregir
agregarValor valor indice lista =  take (indice - 1) lista  ++ [valor] ++ drop indice lista
-- es lo mismo q
agregarValor valor indice lista =  take (indice - 1) lista ++ valor ++ drop indice lista

-- funciona pero es mejor la composicion
poneleUnNombre numeros = (sum (map (*3) (filter even numeros))) < 100 	   -- es lo mismo que
poneleUnNombre numeros = (( <100) . sum . map (*3). filter even ) numeros	   -- es lo mismo que 
poneleUnNombre numeros = ( <100) . sum . map (*3). filter even  $ numeros
