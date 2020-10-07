echo :: IO ()
echo = getChar >>= (\x -> putChar x)

echoDo :: IO ()
echoDo = do 
    x <- getChar
    putChar x

main = do 
    echo
    echoDo
    putStrLn ""