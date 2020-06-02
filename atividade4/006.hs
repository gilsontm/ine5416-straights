isTriangle :: Float -> Float -> Float -> Bool
isTriangle x y z =
    if (x + y > z) && (y + z > x) && (x + z > y) then
        True
    else False

main = do
    x <- getLine
    y <- getLine
    z <- getLine
    print (isTriangle (read x :: Float) (read y :: Float) (read z :: Float))
