mdc :: Int -> Int -> Int
mdc a 0 = a
mdc a b = mdc b (a `mod` b)

main = do
    a <- getLine
    b <- getLine
    print (mdc (read a :: Int) (read b :: Int))
