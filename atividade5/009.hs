mapear :: (t -> y) -> [t] -> [y]
mapear _ [] = []
mapear f (a:b) = [f a] ++ (mapear f b)

foo :: Int -> Int
foo x = x + 1

main = do
    print (mapear foo [7, 9, 2, 4, 5, 3])