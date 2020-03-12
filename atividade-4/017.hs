

prime_help :: Int -> Int -> Float -> Bool
prime_help a b limit =
    if b > limit then
        True
    else
        if (a `mod` b) == 0 then
            False
        else
            prime_help a (b + 1) limit


prime :: Int -> Bool
prime 1 = False
prime n = prime_help n 2 (sqrt n)


main = do
    n <- getLine
    print (prime (read n :: Int))
