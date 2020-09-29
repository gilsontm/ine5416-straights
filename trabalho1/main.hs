import Data.List

{-
    'Square' é uma tupla (Int,Bool) e representa uma casa no tabuleiro:
        > Int: valor da casa (se for zero, a casa é vazia)
        > Bool: cor da casa (True = branco; False = negro)
-}
type Square = (Int, Bool)

{-
    'Board' é uma lista de Squares, e representa o tabuleiro. Como o tabuleiro
    é bidimensional, mas a lista é apenas unidimensional, utiliza-se a convenção
    de ordenamento em que a lista representa uma matriz cujas linhas foram concatenadas.

    Exemplo:    | a b c |
                | d e f |   >>>   [a b c d e f g h i]
                | g h i | 
-}
type Board = [Square]

-- | A função 'w' recebe um inteiro, e retorna um Square branco com esse valor
w :: Int -> Square
w v = (v, True)

-- | A função 'b' recebe um inteiro, e retorna um Square negro com esse valor
b :: Int -> Square
b v = (v, False)

-- | 'value' retorna o valor inteiro de um Square
value :: Square -> Int
value (v, _) = v

-- | 'isBlack' retorna True caso o Square seja negro, e False caso contrário
isBlack :: Square -> Bool
isBlack (_, b) = not b

-- | 'isEmpty' retorna True se o valor do Square de entrada for zero
isEmpty :: Square -> Bool
isEmpty (v, b) = (v == 0) && b

{- 
    A função 'setValue' recebe um Square e um inteiro, e retorna um Square da mesma
    cor que o Square de entrada, porém com o valor do inteiro recebido.
-}
setValue :: Square -> Int -> Square
setValue (_, b) v = (v, b)

{- 
    'side' retorna o tamanho do lado de um tabuleiro.
    Note que tabuleiros sempre devem ser quadrados.
-}
side :: Board -> Int
side b = round (sqrt (fromIntegral(length b)))

-- | 'coord' transforma um índice (representação em lista) em uma posição (y,x)
coord :: Board -> Int -> (Int, Int)
coord b i = (i `div` (side b), i `mod` (side b))

-- | 'index' transforma uma posição (y,x) em um índice da representação em lista
index :: Board -> (Int, Int) -> Int
index b (y,x) = y * (side b) + x

-- | 'readAt' retorna o Square na posição (y,x) do tabuleiro
readAt :: Board -> (Int, Int) -> Square
readAt b (y,x) = b !! (index b (y,x))

-- | 'writeAt' "escreve" um valor na posição (y,x) e retorna um novo tabuleiro
writeAt :: Board -> (Int, Int) -> Int -> Board
writeAt b (y,x) v = write' b (index b (y,x)) v
    where write' (a:b) i v
            | i == 0 = (setValue a v):b
            | otherwise = a:(write' b (i-1) v)

-- | 'emptyAt' retorna verdadeiro se a posição (y,x) do tabuleiro for branca e vazia 
emptyAt :: Board -> (Int, Int) -> Bool
emptyAt b (y,x) = isEmpty (readAt b (y,x))


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

-- Funções de parseamento de inputs e formatação de outputs.
toString :: Square -> String
toString (v, True)  = " " ++ show(v) ++ " "
toString (v, False) = "[" ++ show(v) ++ "]"

showBoard :: Board -> IO ()
showBoard b = putStrLn (showBoard' b ((side b)-1) ((side b)-1))
        where   showBoard' [] _ _    = ""
                showBoard' (a:b) n 0 = (toString a) ++ "\n" ++ (showBoard' b n n)
                showBoard' (a:b) n m = (toString a) ++ " " ++ (showBoard' b n (m-1))

parseLine :: [String] -> Board
parseLine [] = []
parseLine ((hh:tt):t)
    | hh == '.' = (w(read tt :: Int)) : (parseLine t)
    | otherwise = (b(read tt :: Int)) : (parseLine t)

parser :: Int -> IO ()
parser n = parser' n []
    where parser' 0 b = mapM_ showBoard (solve b (0,0) [])
          parser' n b = do 
                            line <- getLine
                            parser' (n-1) (b ++ (parseLine (words line)))

main = do
    putStrLn "Solving"
    side <- getLine
    parser (read side :: Int)
    putStrLn "Done"
