fibonacci :: Int -> Int
fibonacci n | (n <= 2) = 1
            | otherwise = fibonacci(n-1) + fibonacci(n-2)
main = do
    n <- getLine
    print (fibonacci (read n :: Int))
