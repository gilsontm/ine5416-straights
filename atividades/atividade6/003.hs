data Ponto = TwoD Float Float | ThreeD Float Float Float

distancia :: Ponto -> Ponto -> Float
distancia (TwoD x1 y1) (TwoD x2 y2) = sqrt((x1-x2)**2 + (y1-y2)**2)
distancia (ThreeD x1 y1 z1) (ThreeD x2 y2 z2) =
    sqrt((x1-x2)**2 + (y1-y2)**2 + (z1-z2)**2)

p1 :: Ponto
p1 = (TwoD 1 1)

p2 :: Ponto
p2 = (TwoD 2 3)

p3 :: Ponto
p3 = (ThreeD 1 1 2)

p4 :: Ponto
p4 = (ThreeD 2 1 10)

main = do
    print (distancia p1 p2)
    print (distancia p3 p4)
