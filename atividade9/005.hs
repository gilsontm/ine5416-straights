main = do
    print((\(a,b,c) (x,y,z) -> sqrt((a-x)^2+(b-y)^2+(c-z)^2)) (1,1,1) (0,0,0))