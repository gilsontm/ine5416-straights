execute :: Float -> Float -> Char -> Float
execute a b operator
    | (operator == '+') = a + b
    | (operator == '-') = a - b
    | (operator == '*') = a * b
    | (operator == '/') = a / b
    | otherwise = 0

main = do
    operator <- getChar
    _ <- getLine
    a <- getLine
    b <- getLine
    print (execute (read a :: Float) (read b :: Float) operator)