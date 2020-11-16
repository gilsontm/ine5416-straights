larger :: Int -> Int -> Int -> Int
larger a b c | (a > b && a > c) = a
             | (b > a && b > c) = b
             | otherwise = c

main = do
    a <- getLine
    b <- getLine
    c <- getLine
    print (larger (read a :: Int) (read b :: Int) (read c :: Int))
