

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


main = do
    n <- getLine
    print (prime (read n :: Int))
