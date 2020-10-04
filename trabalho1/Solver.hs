module Solver (solve) where

import Square
import Board
import Data.List

{- 
    'solve' soluciona o tabuleiro propriamente dito, e retorna uma lista
    de soluções válidas. Se a lista retornada for vazia, o tabuleiro não
    possui solução.
-}
solve :: Board -> (Int, Int) -> [Board] -> [Board]
solve b (y,x) l 
    | x == (side b) = solve b (y+1, 0) l
    | y == (side b) = b:l
    | emptyAt b (y,x) = solve' b (y,x) l (getAvailable b (y,x))
    | otherwise       = solve b (y,x+1) l
    where 
        -- | "solve' " lida com o backtracking
        solve' :: Board -> (Int, Int) -> [Board] -> [Int] -> [Board]
        solve' b (y,x) l []    = l
        solve' b (y,x) l (h:t) = do l1 <- [solve (writeAt b (y,x) h) (y,x+1) l]
                                    solve' b (y,x) l1 t

{-
    'getAvailable' retorna uma lista com os possíveis valores para uma dada
    posição (y,x) do tabuleiro. Assume-se que a posição (y,x) esteja vazia.
-}
getAvailable :: Board -> (Int, Int) -> [Int]
getAvailable b (y,x) = [1..(side b)] \\ ((getRow b y) ++ (getCol b x) ++ (getRowRegion b (y,x)) ++ (getColRegion b (y,x)))

-- | 'getRow' retorna os números presentes na linha (y,_)
getRow :: Board -> Int -> [Int]
getRow b y = [value (readAt b (y,x')) | x' <- [0..((side b)-1)]]

-- | 'getCol' retorna os números presentes na coluna (_,x)
getCol :: Board -> Int -> [Int]
getCol b x = [value (readAt b (y',x)) | y' <- [0..((side b)-1)]]

{- 
    'getRowRegion' retorna os números que NÃO podem fazer parte da
    região horizontal que inclui a posição (y,x).
-}
getRowRegion :: Board -> (Int, Int) -> [Int]
getRowRegion b (y,x) = getRowRegion' b (minMax(inRowRegion b (left b (y,x)) (right b (y,x)))) (left b (y,x)) (right b (y,x))
    where
        getRowRegion' :: Board -> (Int, Int) -> (Int, Int) -> (Int, Int) -> [Int]
        getRowRegion' _ (0,0) _ _             = []
        getRowRegion' b (m0,m1) (_,x0) (_,x1) = [1..(side b)] \\ [(m1-x1+x0)..(m0+x1-x0)]

{- 
    'getColRegion' retorna os números que NÃO podem fazer parte da
    região vertical que inclui a posição (y,x).
-}
getColRegion :: Board -> (Int, Int) -> [Int]
getColRegion b (y,x) = getColRegion' b (minMax(inColRegion b (top b (y,x)) (bottom b (y,x)))) (top b (y,x)) (bottom b (y,x))
    where
        getColRegion' :: Board -> (Int, Int) -> (Int, Int) -> (Int, Int) -> [Int]
        getColRegion' _ (0,0) _ _             = []
        getColRegion' b (m0,m1) (y0,_) (y1,_) = [1..(side b)] \\ [(m1-y1+y0)..(m0+y1-y0)]

{-
    'inRowRegion' retorna os valores que já fazem parte da região horizontal
    da qual a posição (y,x) faz parte.
-}
inRowRegion :: Board -> (Int, Int) -> (Int, Int) -> [Int]
inRowRegion b (y,x0) (_,x1) = [n | n <- [value (readAt b (y,x')) | x' <- [x0..x1]], n /= 0]

{-
    'inColRegion' retorna os valores que já fazem parte da região vertical
    da qual a posição (y,x) faz parte.
-}
inColRegion :: Board -> (Int, Int) -> (Int, Int) -> [Int]
inColRegion b (y0,x) (y1,_) = [n | n <- [value (readAt b (y',x)) | y' <- [y0..y1]], n /= 0]

{-
    'minMax' recebe uma lista de inteiros e retorna uma tupla contendo
    o menor e o maior valor da lista. Se a lista for vazia, retorna (0,0).
-}
minMax :: [Int] -> (Int, Int)
minMax []    = (0,0)
minMax (h:t) = (min' t h, max' t h)
    where min' [] n    = n
          min' (h:t) n = min' t (min n h)
          max' [] n    = n
          max' (h:t) n = max' t (max n h)

{-
    Dada uma posição (y,x), 'top' retorna a posição de menor valor y que
    pertence à mesma região vertical que (y,x). Efetivamente, o resultado
    de 'top' representa a "barreira superior" da região vertical que inclui (y,x).
    Note que uma "região" é delimitada por casas negras ou pela borda do tabuleiro.
-}
top :: Board -> (Int, Int) -> (Int, Int)
top b (y,x)
    | isBlack (readAt b (y,x)) = (y+1,x)
    | y == 0                   = (y,x)
    | otherwise                = top b (y-1,x)

{-
    Dada uma posição (y,x), 'bottom' retorna a posição de maior valor y que
    pertence à mesma região vertical que (y,x). Efetivamente, o resultado
    de 'bottom' representa a "barreira inferior" da região vertical que inclui (y,x).
    Note que uma "região" é delimitada por casas negras ou pela borda do tabuleiro.
-}
bottom :: Board -> (Int, Int) -> (Int, Int)
bottom b (y,x)
    | isBlack (readAt b (y,x)) = (y-1,x)
    | y == ((side b) - 1)      = (y,x)
    | otherwise                = bottom b (y+1,x)

{-
    Dada uma posição (y,x), 'left' retorna a posição de menor valor x que
    pertence à mesma região horizontal que (y,x). Efetivamente, o resultado
    de 'left' representa a "barreira lateral esquerda" da região horizontal que inclui (y,x).
    Note que uma "região" é delimitada por casas negras ou pela borda do tabuleiro.
-}
left :: Board -> (Int, Int) -> (Int, Int)
left b (y,x)
    | isBlack (readAt b (y,x)) = (y,x+1)
    | x == 0                   = (y,x)
    | otherwise                = left b (y,x-1)

{-
    Dada uma posição (y,x), 'right' retorna a posição de maior valor x que
    pertence à mesma região horizontal que (y,x). Efetivamente, o resultado
    de 'right' representa a "barreira lateral direita" da região horizontal que inclui (y,x).
    Note que uma "região" é delimitada por casas negras ou pela borda do tabuleiro.
-}
right :: Board -> (Int, Int) -> (Int, Int)
right b (y,x)
    | isBlack (readAt b (y,x)) = (y,x-1)
    | x == ((side b) - 1)      = (y,x)
    | otherwise                = right b (y,x+1)