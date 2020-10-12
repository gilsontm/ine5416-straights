module Square (Square, white, black, value, isBlack, isEmpty, setValue) where

{-
    "Square" é uma tupla (Int,Bool) e representa uma casa no tabuleiro:
        > Int: valor da casa (se for zero, a casa é vazia)
        > Bool: cor da casa (True = branco; False = negro)
-}
type Square = (Int, Bool)

-- | A função "white" recebe um inteiro, e retorna um Square branco com esse valor
white :: Int -> Square
white v = (v, True)

-- | A função "black" recebe um inteiro, e retorna um Square negro com esse valor
black :: Int -> Square
black v = (v, False)

-- | "value" retorna o valor inteiro de um Square
value :: Square -> Int
value (v, _) = v

-- | "isBlack" retorna True caso o Square seja negro, e False caso contrário
isBlack :: Square -> Bool
isBlack (_, b) = not b

-- | "isEmpty" retorna True se o valor do Square de entrada for zero
isEmpty :: Square -> Bool
isEmpty (v, b) = (v == 0) && b

{- 
    A função "setValue" recebe um Square e um inteiro, e retorna um Square da mesma
    cor que o Square de entrada, porém com o valor do inteiro recebido.
-}
setValue :: Square -> Int -> Square
setValue (_, b) v = (v, b)