class (Integral x) => MeuInt x where
    par :: x -> Bool
    impar :: x -> Bool
    primo :: x -> Bool
    mdc :: x -> x -> x
    (===) :: x -> x -> Bool

    par n = (n `mod` 2) == 0

    impar n = (n `mod` 2) == 1

    primo n 
        | n < 0     = primo (abs n)
        | n <= 1    = False
        | otherwise = not (hasFactor n (n-1))
            where 
                hasFactor a b | b == 1    = False
                              | otherwise = ((a `mod` b) == 0) || hasFactor a (b-1)

    mdc a 0 = a
    mdc a b = mdc b (a `mod` b)

    (===) a b = abs(a - b) <= 1

instance MeuInt Integer
instance MeuInt Int

main = do
    print(par (9::Integer))
    print(impar (7::Integer))
    print(primo (2::Integer))
    print(primo (-32::Integer))
    print(primo (8::Integer))
    print(primo (70::Integer))
    print(mdc (50::Integer) (8::Integer))
    print((52::Integer) === (51::Integer))
    print((52::Integer) === (60::Integer))