area :: Float -> Float -> Float
area a b = (a * b) / 2

main = do
    base <- getLine
    altura <- getLine
    print (area (read base :: Float) (read altura :: Float))
