distance :: Float -> Float -> Float -> Float -> Float -> Float -> Float
distance x1 y1 z1 x2 y2 z2 =
    sqrt ( (x1 - x2) ** 2 + (y1 - y2) ** 2 + (z1 - z2) ** 2 )

main = do
    x1 <- getLine
    y1 <- getLine
    z1 <- getLine
    x2 <- getLine
    y2 <- getLine
    z2 <- getLine
    print (distance (read x1 :: Float) (read y1 :: Float) (read z1 :: Float)
                    (read x2 :: Float) (read y2 :: Float) (read z2 :: Float))
