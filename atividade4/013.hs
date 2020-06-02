mdc :: Int -> Int -> Int
mdc a 0 = a
mdc a b = mdc b (a `mod` b)


mmc :: Int -> Int -> Int
mmc a b = (a * b) `div` mdc a b


main = do
    a <- getLine
    b <- getLine
    print (mmc (read a :: Int) (read b :: Int))
