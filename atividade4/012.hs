mdc :: Int -> Int -> Int
mdc a 0 = a
mdc a b = mdc b (a `mod` b)


mdc3 :: Int -> Int -> Int -> Int
mdc3 a b c = mdc a (mdc b c)


main = do
    a <- getLine
    b <- getLine
    c <- getLine
    print (mdc3 (read a :: Int) (read b :: Int) (read c :: Int))
