divisible :: Int -> Int -> Bool
divisible x y = (x `mod` y) == 0


main = do
    x <- getLine
    y <- getLine
    print (divisible (read x :: Int) (read y :: Int))
