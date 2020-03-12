xor :: Bool -> Bool -> Bool
xor a b = (a && not b) || (b && not a)

main = do
    a <- getLine
    b <- getLine
    print (xor (read a :: Bool) (read b :: Bool))
