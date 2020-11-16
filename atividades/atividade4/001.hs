raise :: Float -> Float -> Float
raise x y = x ** y

main = do
    x <- getLine
    y <- getLine
    print (raise (read x :: Float) (read y :: Float))
