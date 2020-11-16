absolute :: Int -> Int
absolute x =
    if x >= 0 then
        x
    else
        -x

main = do
    x <- getLine
    print (absolute (read x :: Int))
