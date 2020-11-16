main = do
    x <- getLine
    y <- getLine
    print((\x y -> (x && not y) || (y && not x)) (read x :: Bool) (read y :: Bool))