
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome xs = xs == reverse xs


main :: IO ()
main = do
    putStrLn "Ingrese una cadena para verificar si es un palíndromo:"
    input <- getLine
    if isPalindrome input
        then putStrLn "Es un palíndromo."
        else putStrLn "No es un palíndromo."