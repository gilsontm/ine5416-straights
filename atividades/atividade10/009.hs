{-
    O monad Either possui dois valores: Left e Right, e é comumente 
    utilizado em funções que podem gerar erros.

    Em geral, o valor Left é utilizado para indicar o erro, e Right
    para indicar o valor em caso de sucesso.

    Abaixo, temos um exemplo da função "mydiv", que trata o erro de
    divisão com zero através do monad Either.
-}

mydiv :: Int -> Int -> Either String Int
mydiv n m
    | m == 0    = Left "division by zero."
    | otherwise = Right (n `div` m)

main = do 
    print(mydiv 7 2)
    print(mydiv 8 0)
