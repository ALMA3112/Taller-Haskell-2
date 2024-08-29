# Taller de Programación en Haskell

## Descripcion 
  Este repositorio alberga el taller numero 2 de haskell, donde se prueban losdiferentes codigos para ver como funciona Haskell

## Parte 1
  Se prueban los codigos que estan en la carpeta para ver como funciona la sintaxis de Haskell
  Entre ellos un ejemplo de estp es el siguiente:
  - Eliminar Numeros Duplicados: En este ejercicio se puede ver como se eliminan los duplicados de un arreglo

    ``` Haskell
    
      removeDuplicates :: (Eq a) => [a] -> [a]
      removeDuplicates [] = []
      removeDuplicates (x:xs)
            | x `elem` xs = removeDuplicates xs
            | otherwise = x : removeDuplicates xs
    ```
## Parte 2
  Se debe de agregar dos funciones al codigo una que busque el producto y otra que implemente el descuento 
  - Gestion Inventario:
    
    ```Haskell
        
  
