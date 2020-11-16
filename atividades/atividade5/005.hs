busca :: [Int] -> Int -> Bool
busca [] _ = False
busca (a:b) c = 
    if a == c then True
    else busca b c

main = do
    print (busca [7, 9, 2, 4, 5, 3] 3)