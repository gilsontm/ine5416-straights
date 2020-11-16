

distancia :: (Float, Float) -> (Float, Float) -> Float
distancia (x0,y0) (x1,y1) = sqrt((x0-x1)^2 + (y0-y1)^2)

area :: (Float, Float) -> (Float, Float) -> (Float, Float) -> Float
area (x0,y0) (x1,y1) (x2,y2) = let
    {
        a = distancia (x0,y0) (x1,y1);
        b = distancia (x0,y0) (x2,y2);
        c = distancia (x1,y1) (x2,y2);
        s = (a + b + c) / 2
    } in sqrt(s*(s-a)*(s-b)*(s-c))

formaTriangulo :: (Float, Float) -> (Float, Float) -> (Float, Float) -> Maybe Float
formaTriangulo p0 p1 p2 = if
    (
        (distancia p0 p1) + (distancia p1 p2) > (distancia p0 p2) &&
        (distancia p0 p1) + (distancia p0 p2) > (distancia p1 p2) &&
        (distancia p0 p2) + (distancia p1 p2) > (distancia p0 p1)
    ) then return (area p0 p1 p2) else Nothing

main = do
    print(formaTriangulo (0,0) (1,1) (0,1))
    print(formaTriangulo (0,0) (1,1) (2,2))
    print(formaTriangulo (0,0) (1,0) (2,3))
