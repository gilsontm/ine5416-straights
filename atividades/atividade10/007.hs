escreva :: String -> Int -> IO ()
escreva (h:_) 1 = putChar h
escreva (h:t) n = putChar h >>= \x -> escreva t (n-1)

escrevaDo :: String -> Int -> IO ()
escrevaDo (h:_) 1 = putChar h
escrevaDo (h:t) n = do
    putChar h 
    escrevaDo t (n-1)

main = do
    escreva "abcdef" 2
    putStrLn ""
    escrevaDo "abcdef" 5
    putStrLn ""