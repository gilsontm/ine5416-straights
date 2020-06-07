filtrar :: (t -> Bool) -> [t] -> [t]
filtrar f lista = [x | x <- lista, f x]

foo :: Int -> Bool
foo x = x > 5

main = do
    print (filtrar foo [7, 9, 2, 4, 5, 3])