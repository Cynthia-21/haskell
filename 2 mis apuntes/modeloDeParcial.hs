module Lib where
import Text.Show.Functions 
-----------
-- Pto 1 --
-----------
--Modelar a los héroes
data Heroe = Heroe {
    epiteto :: String,
    reconocimiento :: Int,
    artefacto :: [Artefacto]
} deriving (Show)
-- no es necesario poner el nombre

--cambiarEpiteto es lo mismo q mapEpipeto => funcion q me cambia al heroe
--setEspipeto => le da un nuevo valor a lo q hay en la funcion
cambiarEpiteto        funcion heroe = heroe { epiteto = funcion (epiteto heroe) }
cambiarReconocimiento funcion heroe = heroe { reconocimiento = funcion (reconocimiento heroe) }
cambiarArtefactos     funcion heroe = heroe { artefactos = funcion (artefactos heroe) }


data Artefacto = Artefacto{
    nombre :: String,
    rareza :: Int
} deriving (Show)

-----------
-- Pto 2 --
-----------
-- Hacer que un héroe pase a la historia. Esto varía según el índice de reconocimiento que tenga el héroe a la hora de su muerte

pasarALaHistoria Heroe
    |reconocimiento heroe > 1000    = heroe {epiteto = "El mitico"} -- Si su reconocimiento es mayor a 1000, su epíteto pasa a ser "El mítico", y no obtiene ningún artefacto.
    | reconocimiento heroe >=500    = heroe {epipeto = "El magnifico", artefactos = lanzaDelOlimpo : artefato heroe} --agrega una lista vacia q devuelve una lista con los heroes
    -- Si tiene un reconocimiento de al menos 500, su epíteto pasa a ser "El magnífico" y añade a sus artefactos la lanza del Olimpo (100 de rareza)
    |reconocimiento heroe > 100     = heroe {epipeto = "Hoplita", artefactos = xiphos : artefato heroe} --Si tiene menos de 500, pero más de 100, su epíteto pasa a ser "Hoplita" y añade a sus artefactos una Xiphos (50 de rareza).
    -- no es necesario poner q es mayor q 100 y menor q 500 como en el anterior esta esa especificacion => no es necesario poner <500
    |otherwise                      = heroe

-- la rareza es de 100
lanzaDelOlimpo :: Artefacto
lanzaDelOlimpo = Artefacto "Lanza del Olimpo" 100

xiphos :: Artefacto
xiphos = Artefacto "Xiphos" 50
-- hasta aca se repite logica cuando en epipeto se puede reemplazar x funcion

-- composicion, aplicacion parcial u oreden superior (tiene q estar)

-- reemplazo esto x

nuevoEpiteto :: String -> Heroe -> Heroe
nuevoEpiteto unEpipeto unHeroe = unHeroe {epipeto = unEpipeto}

agregarArtefacto :: Artefacto -> Heroe -> Heroe
agregarArtefacto unArtefacto unHeroe = unHeroe {artefacto = unArtefacto : artefacto heroe}

nuevoEpitetoYArtefacto :: String -> Artefacto -> Heroe -> Heroe
nuevoEpitetoYArtefacto unEpipeto unArtefacto heroe = nuevoEpiteto unEpipeto . agregarArtefacto unArtefacto $ heroe
-- composicion parcial

pasarALaHistoria Heroe
    |reconocimiento heroe > 1000    = nuevoEpiteto "El mitico" heroe -- Si su reconocimiento es mayor a 1000, su epíteto pasa a ser "El mítico", y no obtiene ningún artefacto.
    | reconocimiento heroe >=500    = nuevoEpitetoYArtefacto "El magnifico" lanzaDelOlimpo heroe --agrega una lista vacia q devuelve una lista con los heroes
    -- Si tiene un reconocimiento de al menos 500, su epíteto pasa a ser "El magnífico" y añade a sus artefactos la lanza del Olimpo (100 de rareza)
    |reconocimiento heroe > 100     =  nuevoEpitetoYArtefacto "Hoplita" xiphos heroe --Si tiene menos de 500, pero más de 100, su epíteto pasa a ser "Hoplita" y añade a sus artefactos una Xiphos (50 de rareza).
    -- no es necesario poner q es mayor q 100 y menor q 500 como en el anterior esta esa especificacion => no es necesario poner <500
    |otherwise                      = heroe

-----------
-- Pto 3 --
-----------
{- Día a día, los héroes realizan tareas. Llamamos tareas a algo que modifica a un héroe de alguna manera, algo tan variado como aumentar 
su reconocimiento, obtener un nuevo epíteto o artefacto, y muchas más. 
Tras realizar una tarea, los héroes se la anotan en una lista, para luego recordarlas y presumirlas ante sus compañeros.
Hay infinidad de tareas que un héroe puede realizar, por el momento conocemos las siguientes:

    Encontrar un artefacto: el héroe gana tanto reconocimiento como rareza del artefacto, además de guardarlo entre los que lleva.
    Escalar el Olimpo: esta ardua tarea recompensa a quien la realice otorgándole 500 unidades de reconocimiento y triplica la rareza de todos sus artefactos, pero desecha todos aquellos que luego de triplicar su rareza no tengan un mínimo de 1000 unidades. Además, obtiene "El relámpago de Zeus" (un artefacto de 500 unidades de rareza).
    Ayudar a cruzar la calle: incluso en la antigua Grecia los adultos mayores necesitan ayuda para ello. Los héroes que realicen esta tarea obtiene el epíteto "Groso", donde la última 'o' se repite tantas veces como cuadras haya ayudado a cruzar. Por ejemplo, ayudar a cruzar una cuadra es simplemente "Groso", pero ayudar a cruzar 5 cuadras es "Grosooooo".
    Matar una bestia: Cada bestia tiene una debilidad (por ejemplo: que el héroe tenga cierto artefacto, o que su reconocimiento sea al menos de tanto). Si el héroe puede aprovechar esta debilidad, entonces obtiene el epíteto de "El asesino de <la bestia>". Caso contrario, huye despavorido, perdiendo su primer artefacto. Además, tal cobardía es recompensada con el epíteto  "El cobarde"
-}

type Tarea = Heroe -> Heroe

-- encontrar artefacto --

encontrarArtefacto :: Artefacto -> Tarea
encontrarArtefacto artefacto heroe = agregarArtefacto artefacto . sumarReconocimiento (rareza artefacto) $ heroe
-- me agrega el artefacto y me lo suma
-- es lo mismo q 
encontrarArtefacto artefacto heroe = (agregarArtefacto artefacto . sumarReconocimiento (rareza artefacto) )heroe

sumarReconocimiento :: Int -> Tarea
sumarReconocimiento unReconocimiento unHeroe = unHeroe {reconocimiento = unReconocimiento + reconocimiento heroe}

-- escalar el olimpo --

escalarElOlimpo :: Tarea
escalarElOlimpo heroe = agregarArtefacto relampagoDeZeus (desecharArtefactosComunes (triplicarRarezaArtefactos (sumarReconocimiento 500 heroe)))
-- es lo mismo q 
escalarElOlimpo heroe = agregarArtefacto . relampagoDeZeus . desecharArtefactosComunes . triplicarRarezaArtefactos . sumarReconocimiento 500 
-- es lo mismo q 
escalarElOlimpo heroe = (agregarArtefacto . relampagoDeZeus . desecharArtefactosComunes . triplicarRarezaArtefactos . sumarReconocimiento 500) heroe

triplicarRarezaArtefactos :: Tarea 
triplicarRarezaArtefactos heroe = map ((*3). rareza) (artefactos heroe)
-- me devuelve con lista de enteros no un heroe =>
triplicarRarezaArtefactos heroe = heroe { artefactos = map triplicarRareza (artefactos heroe)}

triplicarRareza :: Artefacto -> Artefacto
triplicarRareza artefacto = artefacto {rareza = 3* rareza artefacto}

-- definicion local (where)
triplicarRarezaArtefactos :: Tarea 
triplicarRarezaArtefactos heroe = cambiarArtefactos {map triplicarRareza}heroe
where
    triplicarRareza :: Artefacto -> Artefacto
    triplicarRareza artefacto = artefacto {rareza = 3* rareza artefacto}

-- como repito logica =>
cambiarArtefactos :: ([Artefacto]->[Artefacto])-> Heroe -> Heroe
cambiarArtefactos funcion heroe = heroe {artefactos = funcion $ artefactos heroe}
-- es lo mismo q 
cambiarArtefactos :: ([Artefacto]->[Artefacto])-> Heroe -> Heroe
cambiarArtefactos funcion heroe = heroe {artefactos = funcion (artefactos heroe)}
-- funcion es una funcion con 1 parametro x eso cuando la defino es entre paretesis

desecharArtefactosComunes :: Tarea
desecharArtefactosComunes heroe = cambiarArtefactos (\artefactos -> filter ((<=1000). rareza)) heroe
-- otra forma de hacerlo

esComun :: Artefacto -> Bool
esComun artefacto = rareza artefacto < 1000

desecharArtefactosComunes :: Tarea
desecharArtefactosComunes heroe = cambiarArtefactos ( filter (not.esComun)) heroe


-- ayudar a cruzar la calle --

-- unas cuadras y tarea resive
ayudarACruzarCalle :: Int -> Tarea 
ayudarACruzarCalle unasCuadras heroe = nuevoEpiteto ("Gros" ++ replicate unasCuadras 'o') heroe
-- string de tantas o como cantidad de cuadras

-- matar una bestia --

data Bestia = Bestia {
    nombreBestia :: String,
    debilidad :: debilidad
}

type Debilidad = Heroe -> Bool 

matarBestia :: Bestia -> Bool
matarBestia bestia heroe
    | (debilidad bestia) heroe = nuevoEpiteto ("Asesino de" ++ nombreBestia bestia) heroe
    | otherwise                = (cambiarArtefactos (tail) . nuevoEpiteto "el cobarde") heroe
-- tail me saca el primer elemento de la lista es lo mismo q drop 1

-----------
-- Pto 4 --
----------- 
{-Modelar a Heracles, cuyo epíteto es "Guardián del Olimpo" y tiene un reconocimiento de 700.
Lleva una pistola de 1000 unidades de rareza (es un fierro en la antigua Grecia, obviamente que es raro) y el relámpago de Zeus. 
Este Heracles es el Heracles antes de realizar sus doce tareas, hasta ahora sabemos que solo hizo una tarea...-}

heracles :: Heroe
heracles = Heroe "Guardian del Olimpo" 700 [Artefacto "pistola" 1000, relampagoDeZeus] [matarAlLeonDeNemea]

-----------
-- Pto 5 --
-----------
{-Modelar la tarea "matar al león de Nemea", que es una bestia cuya debilidad es que el epíteto del héroe sea de 20 caracteres o más. Esta es la tarea que realizó Heracles.-}

matarAlLeonDeNemea :: Tarea
matarAlLeonDeNemea heroe = matarBestia leonDeNemea heroe

leonDeNemea :: Bestia
leonDeNemea = Bestia "Leon de Nemea" (\heroe -> 20 <= length (epiteto heroe))
-- se puede hacer x composicion

-----------
-- Pto 6 --
-----------
--Hacer que un héroe haga una tarea. Esto nos devuelve un nuevo héroe con todos los cambios que conlleva realizar una tarea.

realizarTarea :: Tarea -> Heroe -> Heroe
realizarTarea heroe tarea = agregarTarea tarea (tarea heroe)

agregarTarea :: Tarea -> Heroe -> Heroe
agregarTarea tarea heroe = heroe {tareas = tarea : tareas heroe}
-- agrega una tarea a la cola del heroe

-----------
-- Pto 7 --
-----------

{-Hacer que dos héroes presuman sus logros ante el otro. Como resultado, queremos conocer la tupla que tenga en primer lugar al ganador de la contienda, y en segundo al perdedor. Cuando dos héroes presumen, comparan de la siguiente manera:
    Si un héroe tiene más reconocimiento que el otro, entonces es el ganador.
    Si tienen el mismo reconocimiento, pero la sumatoria de las rarezas de los artefactos de un héroe es mayor al otro, entonces es el ganador.
    Caso contrario, ambos realizan todas las tareas del otro, y vuelven a hacer la comparación desde el principio. Llegado a este punto, el intercambio se hace tantas veces sea necesario hasta que haya un ganador.
-}
 --                               tupla
presumir :: Heroe -> Heroe -> (Heroe, Heroe)
presumir heroe1 heroe2
    | reconocimiento heroe1 > reconocimiento heroe2 = (heroe1 , heroe2)
    | reconocimiento heroe1 < reconocimiento heroe2 = (heroe2 , heroe1)
    | sumaRarezaArtefactos heroe1 > sumaRarezaArtefactos heroe2 = (heroe1 , heroe2)
    | sumaRarezaArtefactos heroe1 < sumaRarezaArtefactos heroe2 = (heroe2 , heroe1)
    | otherwise = presumir (realizarTareasDe heroe2 heroe1) (realizarTareasDe heroe1 heroe2)

realizarTareasDe :: Heroe -> Tarea
realizarTareasDe otroHeroe = realizarTarea (tareas otroHeroe) heroe

--recursividad se puede usar un foldl
realizarTarea :: [Tarea] -> Heroe -> Heroe
realizarTarea tareas heroe = foldl (flip realizarTarea) heroe tareas
realizarTarea tareas heroe = foldl realizarTarea heroe tareas
-- es lo mismo q 
realizarTarea tareas heroe = foldr (realizarTarea) heroe tareas
-- flip invierte la lista

sumaRarezaArtefactos :: Heroe -> Int
sumaRarezaArtefactos = sum . map rareza . artefactos -- no tiene parametros
-- es lo mismo q
sumaRarezaArtefactos heroe = sum . map rareza . artefactos $ heroe

-- codigo duplicado otra forma
presumir heroe1 heroe2
    | gana heroe1 heroe2 = (heroe1 , heroe2)
    | gana heroe2 heroe1 = (heroe2 , heroe1)
    | sumaRarezaArtefactos heroe1 > sumaRarezaArtefactos heroe2 = (heroe1 , heroe2)
    | sumaRarezaArtefactos heroe1 < sumaRarezaArtefactos heroe2 = (heroe2 , heroe1)
    | otherwise = presumir (realizarTareasDe heroe2 heroe1) (realizarTareasDe heroe1 heroe2)

gana :: Heroe -> Heroe -> Bool
gana ganador perdedor =
    reconocimiento ganador > reconocimiento perdedor || reconocimiento ganador == reconocimiento perdedor && sumaRarezaArtefactos ganador > sumaRarezaArtefactos perdedor


-----------
-- Pto 8 --
-----------
{-  ¿Cuál es el resultado de hacer que presuman dos héroes con reconocimiento 100, ningún artefacto y ninguna tarea realizada?
se queda presumiendo infinitamente -}

-----------
-- Pto 9 --
-----------
-- Hacer que un héroe realice una labor, obteniendo como resultado el héroe tras haber realizado todas las tareas.

-- una labor es una tarea
-- ya esta hecho
realizarLabor tareas heroe = foldl (flip realizarTarea) heroe tareas
realizarLabor tareas heroe = foldl realizarTarea heroe tareas

-----------
-- Pto 10 -
-----------

-- no, no se puede
