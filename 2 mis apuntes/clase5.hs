data Persona = Persona {
    nombre :: String,
    edad :: Int,
    apodo :: String,
    hobbies :: [String]
} deriving (Show)

-- no utilizar esto asi
apodo nuevoApodo (Persona nombre edad _ hobbies) = Persona nombre edad nuevoApodo hobbies

apodar nuevoApodo persona = persona {apodo = nuevoApodo}

ingenierizar persona = persona { apodo = "Ing." ++ apodo persona}


cambiarApodo funcion persona = persona { apodo = funcion (apodo persona)}
apodar' nuevoApodo persona = cambiarApodo (const nuevoApodo) persona
--con aplicacion parcial
ingenierizar persona = cambiarApodo ("Ing."++) persona

---------------------------------------------------------------------------------------------------------------
factorial :: Int -> Int
factorial numero 
    | numero ==0 = 1 -- caso base
    | numero > 0 = numero * factorial (numero -1)
-- funcion recursiva => se llama a si misma
-- tiene al menos una caso base y un caso recursivo

-- estructura de datos recursivos
data Persona = Persona {
    nombre :: String,
    edad :: Int,
    apodo :: String,
    amigos :: [Persona]
} deriving (Show)

-- head devuelve la cabeza de la lista
head (cabeza : cola) = cabeza
-- tail devuelve la cola de la lista
tail (cabeza : cola) = cola
--last => me da el ultimo elemento de la lista

-- and => todos los elementos de la lista son verdaderos
--and [True, True]
--True

-- or => algun elemento de la lista me da verdadero
-- or [True, False]
-- True
-- concat => recibe una lista de listas y me devuelve una lista siemple


-- 1 : 2 : [3,4,5]
-- los : me sirve para concatenar valores de la lista
-- el head de la lista es el 1
-- las listas son recursivas xq la lista llama otra lista

-- foldr => funciones recursivas sobre lista con un caso base y una recursividad
--las listas son plegables (unica estructura plegable q vamos a ver)
-- foldr (+) 0 [1,2,3,4]
-- 10
-- foldl => valor inicial a la izquiera
-- foldl (-) 0 [1,2,3,4]
-- - 10 => (-1-2-3-4)
-- foldr (-) 0 [1,2,3,4]
-- -2 => (4-3-2-1)

-- fold (reducir) se usa cuando a partir de un conj aplicado a un valor inicial necesito un elemento resultante
-- se agarra un conj y se reduce a un resultado

-------------------------------------------------------------------------------------------------------------------------------
COMANDOS EN GIT
git init => iniciar proyecto en git (me crea un repo en git y me crea una rama de trabajo)
git status => ver el estado de mi repo
git add saludo.txt funcionesRandom.hs => agrego el archivo o los archivos para versionarlos
git rm --catched saludo.txt => saco el archivo q agregue
git commit -m "saludo inicial" => agrego archivos o cosas con una leyenda
git log => me muestra las cosas q hice (los commit)
git remote add origin link => agrego repositorio remoto
git push origin HEAD => subo al repo de git
cd git_tutorial/ => me muevo de carpeta
rm - rf git_tutorial/ => borro mi carpeta
git clone linkDeGit
git pull => si alguien sube cambios y tengo q bajarlos

-- para compilar 
stack gchi Lib.hs





