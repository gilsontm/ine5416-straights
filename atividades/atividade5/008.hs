inverte :: [t] -> [t]
inverte [] = []
inverte (a:b) = (inverte b) ++ [a]

main = do
    print (inverte [7, 9, 2, 4, 5, 3])