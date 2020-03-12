mdc :: Int -> Int -> Int
mdc a 0 = a
mdc a b = mdc b (a `mod` b)


coprimes :: Int -> Int -> Bool
coprimes a b = (mdc a b) == 1


main = do
    a <- getLine
    b <- getLine
    print (coprimes (read a :: Int) (read b :: Int))
