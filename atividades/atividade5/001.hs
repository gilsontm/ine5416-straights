soma :: [Int] -> Int
soma [] = 0
soma (a:b) = a + soma b

main = do
    print (soma [7, 9, 2, 4, 5, 3])

