import Square (Square, white, black)
import Board  (Board, side)
import Solver (solve)

-- | "toString" transforma um Square numa String para ser impressa no terminal
toString :: Square -> String
toString (v, True)  = " " ++ show v ++ " "
toString (v, False) = "[" ++ show v ++ "]"

-- | "showBoard" recebe um Board e imprime-o no terminal
showBoard :: Board -> IO ()
showBoard b = putStrLn ("\n" ++ (showBoard' b ((side b)-1) ((side b)-1)))
        where
            showBoard' [] _ _    = ""
            showBoard' (a:b) n 0 = (toString a) ++ "\n" ++ (showBoard' b n n)
            showBoard' (a:b) n m = (toString a) ++ (showBoard' b n (m-1))

-- | "parseLine" lê uma linha do tabuleiro e retorna uma lista de Squares
parseLine :: [String] -> Board
parseLine [] = []
parseLine ((hh:tt):t)
    | hh == 'w' = (white (read tt :: Int)) : (parseLine t)
    | otherwise = (black (read tt :: Int)) : (parseLine t)

-- | "parser" lê a entrada, monta um Board, soluciona-o e imprime o resultado no terminal
parser :: Int -> IO ()
parser n = parser' n []
    where
        parser' :: Int -> Board -> IO ()
        parser' 0 b = do
                        putStrLn "::: Tabuleiro de entrada:"
                        showBoard b
                        putStrLn "::: Solucoes validas:"
                        mapM_ showBoard (solve b)
        parser' n b = do 
                        line <- getLine
                        parser' (n-1) (b ++ (parseLine (words line)))

main = do
    putStrLn "::: Lendo inteiro (>=1) que representa o tamanho do tabuleiro..."
    n <- getLine
    putStrLn ("::: Tamanho selecionado: " ++ n ++ "x" ++ n)
    putStrLn "::: Lendo o tabuleiro..."
    parser (read n :: Int)
    putStrLn "::: Concluído!"
