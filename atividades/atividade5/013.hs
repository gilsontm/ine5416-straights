apagarEnquanto :: (t -> Bool) -> [t] -> [t]
apagarEnquanto _ [] = []
apagarEnquanto f (a:b)
    | f a       = apagarEnquanto f b
    | otherwise = [a] ++ b

impar :: Int -> Bool
impar x = x `mod` 2 == 1

main = do
    print (apagarEnquanto impar [7, 9, 2, 4, 5, 3])