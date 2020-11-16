main = do
    a <- getLine
    b <- getLine
    c <- getLine
    print((\a b c -> if a > b && a > c then a else (if b > c then b else c)) (read a::Int) (read b::Int) (read c::Int))