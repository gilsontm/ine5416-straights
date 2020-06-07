apagar :: Int -> [t] -> [t]
apagar _ [] = []
apagar n (a:b)
    | n > 1     = apagar (n-1) b
    | otherwise = b

main = do
    print (apagar 3 [7, 9, 2, 4, 5, 3])