main = do
    print(map (\x -> (x `mod` 2) == 0) [0..10])