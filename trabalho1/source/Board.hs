module Board (Board, side, coord, index, readAt, writeAt, emptyAt) where

import Square

{-
    "Board" é uma lista de Squares, e representa o tabuleiro. Como o tabuleiro
    é bidimensional, mas a lista é apenas unidimensional, utiliza-se a convenção
    de ordenamento em que a lista representa uma matriz cujas linhas foram concatenadas.

    Exemplo:    | a b c |
                | d e f |   >>>   [a b c d e f g h i]
                | g h i | 
-}
type Board = [Square]

{- 
    "side" retorna o tamanho do lado de um tabuleiro.
    Note que tabuleiros sempre devem ser quadrados.
-}
side :: Board -> Int
side b = round (sqrt (fromIntegral(length b)))

-- | "coord" transforma um índice (representação em lista) em uma posição (y,x)
coord :: Board -> Int -> (Int, Int)
coord b i = (i `div` (side b), i `mod` (side b))

-- | "index" transforma uma posição (y,x) em um índice da representação em lista
index :: Board -> (Int, Int) -> Int
index b (y,x) = y * (side b) + x

-- | "readAt" retorna o Square na posição (y,x) do tabuleiro
readAt :: Board -> (Int, Int) -> Square
readAt b (y,x) = b !! (index b (y,x))

-- | "writeAt" "escreve" um valor na posição (y,x) e retorna um novo tabuleiro
writeAt :: Board -> (Int, Int) -> Int -> Board
writeAt b (y,x) v = write' b (index b (y,x)) v
    where
        write' (a:b) i v
            | i == 0 = (setValue a v):b
            | otherwise = a:(write' b (i-1) v)

-- | "emptyAt" retorna verdadeiro se a posição (y,x) do tabuleiro for branca e vazia 
emptyAt :: Board -> (Int, Int) -> Bool
emptyAt b (y,x) = isEmpty (readAt b (y,x))