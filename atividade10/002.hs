data Expr = Val Int | Div Expr Expr | Mul Expr Expr | Add Expr Expr | Sub Expr Expr | Sqrt Expr
    deriving Show

mydiv :: Int -> Int -> Maybe Int
mydiv n m
    | m == 0    = Nothing
    | otherwise = return (n `div` m)

mysqrt :: Int -> Maybe Int
mysqrt n
    | n < 0     = Nothing
    | otherwise = return ((round (sqrt (fromIntegral n))))

eval :: Expr -> Maybe Int
eval (Val n) = Just n
eval (Div x y) = case (eval x) of
                    Nothing -> Nothing
                    Just n -> case (eval y) of
                                Nothing -> Nothing
                                Just m -> (mydiv n m)
eval (Mul x y) = case (eval x) of
                    Nothing -> Nothing
                    Just n -> case (eval y) of
                                Nothing -> Nothing
                                Just m -> return (n * m)
eval (Add x y) = case (eval x) of
                    Nothing -> Nothing
                    Just n -> case (eval y) of
                                Nothing -> Nothing
                                Just m -> return (n + m)
eval (Sub x y) = case (eval x) of
                    Nothing -> Nothing
                    Just n -> case (eval y) of
                                Nothing -> Nothing
                                Just m -> return (n - m)
eval (Sqrt x) = case (eval x) of
                    Nothing -> Nothing
                    Just n -> mysqrt n

evalmonad :: Expr -> Maybe Int
evalmonad (Val n) = return n
evalmonad (Div x y) = evalmonad x >>=
                        (\n -> evalmonad y >>=
                            \m -> (mydiv n m))
evalmonad (Mul x y) = evalmonad x >>=
                        (\n -> evalmonad y >>=
                            \m -> return (n * m))
evalmonad (Add x y) = evalmonad x >>=
                        (\n -> evalmonad y >>=
                            \m -> return (n + m))
evalmonad (Sub x y) = evalmonad x >>=
                        (\n -> evalmonad y >>=
                            \m -> return (n - m))
evalmonad (Sqrt x) = evalmonad x >>= (\n -> mysqrt n)

evalfinal :: Expr -> Maybe Int
evalfinal (Val n) = return n
evalfinal (Div x y) = do
    n <- evalfinal x
    m <- evalfinal y
    mydiv n m
evalfinal (Mul x y) = do
    n <- evalfinal x
    m <- evalfinal y
    return (n * m)
evalfinal (Add x y) = do
    n <- evalfinal x
    m <- evalfinal y
    return (n + m)
evalfinal (Sub x y) = do
    n <- evalfinal x
    m <- evalfinal y
    return (n - m)
evalfinal (Sqrt x) = do
    n <- evalfinal x
    mysqrt n

main = do
    print(eval(      Sqrt (Div (Add (Val 28) (Val 2)) (Sub (Val 6) (Val 1))) ))
    print(evalmonad( Sqrt (Div (Add (Val 28) (Val 2)) (Sub (Val 6) (Val 1))) ))
    print(evalfinal( Sqrt (Div (Add (Val 28) (Val 2)) (Sub (Val 6) (Val 1))) ))

    print(eval(      Div (Add (Val 1) (Sqrt (Val 7))) (Sub (Val 5) (Val 5)) ))
    print(evalmonad( Div (Add (Val 1) (Sqrt (Val 7))) (Sub (Val 5) (Val 5)) ))
    print(evalfinal( Div (Add (Val 1) (Sqrt (Val 7))) (Sub (Val 5) (Val 5)) ))

    print(eval(      Add (Val 7) (Sub (Mul (Val 8) (Val 7)) (Sqrt (Val 9))) ))
    print(evalmonad( Add (Val 7) (Sub (Mul (Val 8) (Val 7)) (Sqrt (Val 9))) ))
    print(evalfinal( Add (Val 7) (Sub (Mul (Val 8) (Val 7)) (Sqrt (Val 9))) ))
