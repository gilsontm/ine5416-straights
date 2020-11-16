minimo :: Int -> Int -> Int
minimo a b
    | a < b = a
    | otherwise = b

menor :: [Int] -> Int
menor [] = 0
menor (a:[]) = a
menor (a:b) = minimo a (menor b)

main = do
    print (menor [7, 9, 2, 4, 5, 3])
