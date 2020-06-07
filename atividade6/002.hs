data Forma = Circulo Float | Retangulo Float Float | Triangulo Float Float 

area :: Forma -> Float
area (Circulo r) = pi * r * r
area (Retangulo b a) = b * a
area (Triangulo base altura) = base * altura / 2

minhaForma :: Forma
minhaForma = (Retangulo 4 6)

main = do
    putStrLn ( show (area (Circulo 6.42)) )
    putStrLn ( show (area (Retangulo 4 5)) )
    putStrLn ( show (area minhaForma) )
    putStrLn ( show (area (Triangulo 4 8)) )