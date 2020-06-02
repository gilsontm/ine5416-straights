status :: Float -> Float -> Float -> String
status a b c =
    if (a + b + c) / 3 > 6.0 then
        "Aprovado"
    else
        "Reprovado"

main = do
    a <- getLine
    b <- getLine
    c <- getLine

    print (status (read a :: Float) (read b :: Float) (read c :: Float))
