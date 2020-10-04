main = do
    a <- getLine
    b <- getLine
    c <- getLine
    print((\a b c -> ((-b+sqrt(b^2-4*a*c))/(2*a), (-b-sqrt(b^2-4*a*c))/(2*a))) (read a::Float) (read b::Float) (read c::Float))