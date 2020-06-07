primeiros :: Int -> [t] -> [t]
primeiros _ [] = []
primeiros n (a:b)
    | (n > 0)   = [a] ++ (primeiros (n-1) b)
    | otherwise = []

main = do
    print (primeiros 3 [7, 9, 2, 4, 5, 3])