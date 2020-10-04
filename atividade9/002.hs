main = do
    a <- getLine
    b <- getLine
    c <- getLine
    print((\x y z -> if (x+y+z)/3 >= 6 then "Aprovado" else "Reprovado")
          (read a::Float) (read b::Float) (read c::Float)) 