
matrix :: Int -> [[Int]]
matrix 1 = [[2,7,6],
            [9,5,1],
            [4,3,8]]
matrix 2 = [[2,7,6],
            [9,5,1],
            [4,8,3]]
matrix 3 = [[2,6,7],
            [9,1,5],
            [4,8,3]]

-- A
soma :: [[Int]] -> Int
soma [] = 0
soma (h:t) = (soma' h) + soma t
    where soma' [] = 0
          soma' (h:t) = h + (soma' t)


-- B
somaMatrizes :: [[Int]] -> [[Int]] -> [[Int]]
somaMatrizes [] _ = []
somaMatrizes _ [] = []
somaMatrizes (h:t) (hh:tt) = (soma' h hh):(somaMatrizes t tt)
    where soma' [] _ = []
          soma' _ [] = []
          soma' (h:t) (hh:tt) = (h+hh):(soma' t tt)

-- C
somaLista :: [Int] -> Int
somaLista [] = 0
somaLista (h:t) = h + (somaLista t)

tamanho :: [t] -> Int
tamanho [] = 0
tamanho (h:t) = 1 + tamanho t

valorMagico :: [t] -> Int
valorMagico m = let n = (tamanho m) in ((somaLista [1..(n^2)]) `div` n)

ehMagico :: [[Int]] -> Bool
ehMagico m = let v = (valorMagico m) in (rows m v) && (cols m v) && (diags m v)
    where 
        rows [] _ = True
        rows (h:t) v = (somaLista h == v) && (rows t v)

        cols m v = cols' m v (tamanho m)
            where
                cols' _ _ 0 = True 
                cols' m v n = ((somaLista (getCol m (n-1))) == v) && (cols' m v (n-1))
                    where
                        getCol [] _ = []
                        getCol (h:t) n = (h !! n):(getCol t n)

        diags m v = let n = tamanho m in (somaLista(primary m n) == v) && (somaLista(secondary m n 1) == v)
            where
                primary _ 0 = []
                primary m n = (m!!(n-1)!!(n-1)):(primary m (n-1))

                secondary _ 0 _ = []
                secondary m row col = (m!!(row-1)!!(col-1)):(secondary m (row-1) (col+1))

main = do
    print(soma (matrix 1))
    print(somaMatrizes (matrix 1) (matrix 2))
    print(ehMagico (matrix 1))
    print(ehMagico (matrix 2))
    print(ehMagico (matrix 3))