minimo :: Int -> Int -> Int
minimo a b
    | a < b = a
    | otherwise = b

menor :: [Int] -> Int
menor [] = 0
menor (a:[]) = a
menor (a:b) = minimo a (menor b)

maximo :: Int -> Int -> Int
maximo a b
    | a > b = a
    | otherwise = b

maior :: [Int] -> Int
maior [] = 0
maior (a:[]) = a
maior (a:b) = maximo a (maior b)

diferencaMaiorMenor :: [Int] -> Int
diferencaMaiorMenor [] = 0
diferencaMaiorMenor x = (maior x) - (menor x)

main = do
    print (diferencaMaiorMenor [7, 9, 2, 4, 5, 3])