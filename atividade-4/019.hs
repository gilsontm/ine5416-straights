prime_help :: Int -> Int -> Int -> Bool
prime_help a b limit =
    if b > limit then
        True
    else
        if (a `mod` b) == 0 then
            False
        else
            prime_help a (b + 1) limit


prime :: Int -> Bool
prime n | (n <= 1) = False
        | otherwise = prime_help n 2 (ceiling (sqrt (fromIntegral n)))


goldbach_help :: Int -> Int -> Int
goldbach_help n m =
    if prime m && prime (n - m) then
        m
    else
        goldbach_help n (m + 1)


goldbach :: Int -> Int
goldbach n = goldbach_help n 2


main = do 
    n <- getLine
    print (goldbach (read n :: Int))