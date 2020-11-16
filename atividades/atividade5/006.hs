ocorrencias :: [Int] -> Int -> Int
ocorrencias [] _ = 0
ocorrencias (a:b) c
    | (a == c)  = 1 + ocorrencias b c
    | otherwise =     ocorrencias b c

main = do
    print (ocorrencias [7, 9, 2, 4, 5, 3, 7, 7] 7)