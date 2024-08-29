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
      -- Agregar un nuevo producto al inventario
    addProduct :: [(String, Double, Int)] -> String -> Double -> Int -> [(String, Double, Int)]
    addProduct inventory name price quantity = inventory ++ [(name, price, quantity)]

    -- Actualizar la cantidad de un producto existente
    updateQuantity :: [(String, Double, Int)] -> String -> Int -> [(String, Double, Int)]
    updateQuantity [] _ _ = []
    updateQuantity ((n, p, q):xs) name newQuantity
      | n == name = (n, p, newQuantity) : xs
      | otherwise = (n, p, q) : updateQuantity xs name newQuantity

    -- Eliminar un producto del inventario
    removeProduct :: [(String, Double, Int)] -> String -> [(String, Double, Int)]
    removeProduct inventory name = filter (\(n, _, _) -> n /= name) inventory

    -- Resumen del inventario: total de productos y valor total
    inventorySummary :: [(String, Double, Int)] -> (Int, Double)
    inventorySummary inventory = (totalQuantity, totalValue)
    where
    
    totalQuantity = sum [q | (_, _, q) <- inventory]
    totalValue = sum [p * fromIntegral q | (_, p, q) <- inventory]

    -- Buscar un producto en el inventario por nombre
    findProduct :: [(String, Double, Int)] -> String -> Maybe (Double, Int)
    findProduct [] _ = Nothing
    findProduct ((n, p, q):xs) name
        | n == name = Just (p, q)
        | otherwise = findProduct xs name

    -- Aplicar un descuento a todos los productos del inventario
    applyDiscount :: [(String, Double, Int)] -> Double -> [(String, Double, Int)]
    applyDiscount inventory discountPercentage = map applyDiscountToProduct inventory
    where
    
    discountFactor = (100 - discountPercentage) / 100
    applyDiscountToProduct (n, p, q) = (n, p * discountFactor, q)
    ```
  Y la funcion main que nos ayudara a ejecutar el codigo: 

  ```Haskell
    -- Función principal
    main :: IO ()
    main = do
    let inventory = []
    let inventory1 = addProduct inventory "Manzanas" 3.5 10
    let inventory2 = addProduct inventory1 "Platanos" 1.3 35
    let inventory3 = updateQuantity inventory2 "Manzanas" 100
    let inventory4 = removeProduct inventory3 "Platanos"
    
    -- Buscar un producto
    let searchResult = findProduct inventory4 "Manzanas"
    putStrLn $ "Resultado de búsqueda de Manzanas: " ++ show searchResult

    -- Aplicar un descuento del 10% al inventario
    let inventory5 = applyDiscount inventory4 10

    let (totalQty, totalValue) = inventorySummary inventory5

    putStrLn $ "Inventario Final: " ++ show inventory5
    putStrLn $ "Total de productos en stock: " ++ show totalQty
    putStrLn $ "Valor total del inventario: " ++ show totalValue
  ```

        
  
