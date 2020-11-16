comprimento :: [Int] -> Int
comprimento [] = 0
comprimento (_:b) = 1 + comprimento b

soma :: [Int] -> Int
soma [] = 0
soma (a:b) = a + soma b

media :: [Int] -> Float
media [] = 0
media lista = (fromIntegral (soma lista))/(fromIntegral (comprimento lista))

main = do
    print (media [7, 9, 2, 4, 5, 3])