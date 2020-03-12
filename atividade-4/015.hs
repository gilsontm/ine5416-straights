mdc :: Int -> Int -> Int
mdc a 0 = a
mdc a b = mdc b (a `mod` b)


coprimes :: Int -> Int -> Bool
coprimes a b = (mdc a b) == 1


totient_help :: Int -> Int -> Int -> Int
totient_help a 1 count = count + 1
totient_help a b count =
    if (coprimes a b) then
        totient_help a (b-1) (count+1)
    else
        totient_help a (b-1) count


totient :: Int -> Int
totient n = totient_help n (n-1) 0


main = do
    n <- getLine
    print (totient (read n :: Int))
