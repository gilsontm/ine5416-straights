bhaskara :: Float -> Float -> Float -> (Float, Float)
bhaskara a b c =
    (((-b + sqrt (b * b - 4 * a * c)) / (2 * a)), ((-b - sqrt (b * b - 4 * a * c)) / (2 * a)))

main = do
    a <- getLine
    b <- getLine
    c <- getLine

    print (bhaskara (read a :: Float) (read b :: Float) (read c :: Float))
