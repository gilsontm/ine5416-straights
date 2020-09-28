import Data.List

type Square = (Int, Bool)
type Board = [Square]

-- Square
w :: Int -> Square
w v = (v, True)

b :: Int -> Square
b v = (v, False)

value :: Square -> Int
value (v, _) = v

isWhite :: Square -> Bool
isWhite (_, b) = b

isBlack :: Square -> Bool
isBlack (_, b) = not b

isEmpty :: Square -> Bool
isEmpty (v, b) = (v == 0) && b

setValue :: Square -> Int -> Square
setValue (_, b) v = (v, b)

toString :: Square -> String
toString (v, True)  = " " ++ show(v) ++ " "
toString (v, False) = "[" ++ show(v) ++ "]"

-- Board
side :: Board -> Int
side b = round (sqrt (fromIntegral(length b)))

coord :: Board -> Int -> (Int, Int)
coord b i = (i `div` (side b), i `mod` (side b))

index :: Board -> (Int, Int) -> Int
index b (y,x) = y * (side b) + x

readAt :: Board -> (Int, Int) -> Square
readAt b (y,x) = b !! (index b (y,x))

writeAt :: Board -> (Int, Int) -> Int -> Board
writeAt b (y,x) v = write' b (index b (y,x)) v
    where write' (a:b) i v
            | i == 0 = (setValue a v):b
            | otherwise = a:(write' b (i-1) v)

emptyAt :: Board -> (Int, Int) -> Bool
emptyAt b (y,x) = isEmpty (readAt b (y,x))

board :: Int -> Board
board 1 = [ w(6), w(0), b(0), b(0), w(0), w(0), 
            w(0), w(0), w(0), w(0), w(0), w(2), 
            w(0), w(0), w(5), w(0), w(4), b(0), 
            w(0), w(2), b(0), w(0), w(0), w(0), 
            w(0), w(0), b(6), b(0), w(3), w(0), 
            b(0), w(0), w(0), w(1), b(0), b(5) ]
board 2 = [ w(3), w(0), b(0), 
            b(0), b(0), w(0), 
            b(0), w(0), w(2) ]
board 3 = [ w(0), w(0), w(0), w(0)]
board 4 = [ b(0), w(0), b(2), w(0), w(0), w(0), 
            b(0), b(0), b(1), w(0), w(0), w(0), 
            w(0), w(0), w(0), w(0), w(0), w(0), 
            w(0), w(0), w(0), w(0), w(0), w(0), 
            w(0), w(0), w(0), w(0), w(0), w(0), 
            w(0), w(0), w(0), w(0), w(0), b(5) ]
board 5 = [ w(0), w(0), b(4), b(0), w(0), w(1), 
            w(0), w(0), b(0), w(0), w(0), w(0), 
            b(6), w(0), w(0), w(0), w(0), b(0), 
            w(0), w(0), w(0), b(1), w(0), w(0), 
            w(3), w(0), w(0), b(0), w(0), w(6), 
            w(0), w(0), b(0), w(0), w(0), b(0) ]

showBoard :: Maybe Board -> IO ()
showBoard Nothing  = putStrLn "Nothing"
showBoard (Just b) = putStrLn (showBoard' b ((side b)-1) ((side b)-1))
        where   showBoard' [] _ _    = ""
                showBoard' (a:b) n 0 = (toString a) ++ "\n" ++ (showBoard' b n n)
                showBoard' (a:b) n m = (toString a) ++ " " ++ (showBoard' b n (m-1))

-- Solve
solve :: Board -> (Int, Int) -> [Maybe Board] -> [Maybe Board]
solve b (y,x) l 
    | x == (side b) = solve b (y+1, 0) l
    | y == (side b) = (Just b):l
    | emptyAt b (y,x) = solve' b (y,x) l (getAvailable b (y,x))
    | otherwise       = solve b (y,x+1) l
    where 
        solve' :: Board -> (Int, Int) -> [Maybe Board] -> [Int] -> [Maybe Board]
        solve' b (y,x) l []    = l
        solve' b (y,x) l (h:t) = do l1 <- [solve (writeAt b (y,x) h) (y,x+1) l]
                                    solve' b (y,x) l1 t

getAvailable :: Board -> (Int, Int) -> [Int]
getAvailable b (y,x) = [1..(side b)] \\ ((getRow b y) ++ (getCol b x) ++ (getRowRegion b (y,x)) ++ (getColRegion b (y,x)))

getRow :: Board -> Int -> [Int]
getRow b y = [value (readAt b (y,x')) | x' <- [0..((side b)-1)]]

getCol :: Board -> Int -> [Int]
getCol b x = [value (readAt b (y',x)) | y' <- [0..((side b)-1)]]

inRowRegion :: Board -> (Int, Int) -> (Int, Int) -> [Int]
inRowRegion b (y,x0) (_,x1) = [n | n <- [value (readAt b (y,x')) | x' <- [x0..x1]], n /= 0]

inColRegion :: Board -> (Int, Int) -> (Int, Int) -> [Int]
inColRegion b (y0,x) (y1,_) = [n | n <- [value (readAt b (y',x)) | y' <- [y0..y1]], n /= 0]

minMax :: [Int] -> (Int, Int)
minMax []    = (0,0)
minMax (h:t) = (min' t h, max' t h)
    where min' [] n    = n
          min' (h:t) n = min' t (min n h)
          max' [] n    = n
          max' (h:t) n = max' t (max n h)

getRowRegion :: Board -> (Int, Int) -> [Int]
getRowRegion b (y,x) = getRowRegion' b (minMax(inRowRegion b (left b (y,x)) (right b (y,x)))) (left b (y,x)) (right b (y,x))
    where
        getRowRegion' :: Board -> (Int, Int) -> (Int, Int) -> (Int, Int) -> [Int]
        getRowRegion' _ (0,0) _ _             = []
        getRowRegion' b (m0,m1) (_,x0) (_,x1) = [1..(side b)] \\ [(m1-x1+x0)..(m0+x1-x0)]
        -- getRowRegion' b (m0,m1) (_,x0) (_,x1) = [n | n <- [1..(side b)], abs(n-m0) >= (x1-x0), abs(n-m1) >= (x1-x0)]

getColRegion :: Board -> (Int, Int) -> [Int]
getColRegion b (y,x) = getColRegion' b (minMax(inColRegion b (top b (y,x)) (bottom b (y,x)))) (top b (y,x)) (bottom b (y,x))
    where
        getColRegion' :: Board -> (Int, Int) -> (Int, Int) -> (Int, Int) -> [Int]
        getColRegion' _ (0,0) _ _             = []
        getColRegion' b (m0,m1) (y0,_) (y1,_) = [1..(side b)] \\ [(m1-y1+y0)..(m0+y1-y0)]
        -- getColRegion' b (m0,m1) (y0,_) (y1,_) = [n | n <- [1..(side b)], abs(n-m0) >= (y1-y0), abs(n-m1) >= (y1-y0)]

top :: Board -> (Int, Int) -> (Int, Int)
top b (y,x)
    | isBlack (readAt b (y,x)) = (y+1,x)
    | y == 0                   = (y,x)
    | otherwise                = top b (y-1,x)

bottom :: Board -> (Int, Int) -> (Int, Int)
bottom b (y,x)
    | isBlack (readAt b (y,x)) = (y-1,x)
    | y == ((side b) - 1)      = (y,x)
    | otherwise                = bottom b (y+1,x)

left :: Board -> (Int, Int) -> (Int, Int)
left b (y,x)
    | isBlack (readAt b (y,x)) = (y,x+1)
    | x == 0                   = (y,x)
    | otherwise                = left b (y,x-1)

right :: Board -> (Int, Int) -> (Int, Int)
right b (y,x)
    | isBlack (readAt b (y,x)) = (y,x-1)
    | x == ((side b) - 1)      = (y,x)
    | otherwise                = right b (y,x+1)


parser :: Int -> IO ()
parser n = parser' n []
    where parser' 0 b = mapM_ showBoard (solve b (0,0) [])
          parser' n b = do 
                            line <- getLine
                            parser' (n-1) (b ++ (parseLine (words line)))

parseLine :: [String] -> Board
parseLine [] = []
parseLine ((hh:tt):t)
    | hh == 'w' = (w(read tt :: Int)) : (parseLine t)
    | otherwise = (b(read tt :: Int)) : (parseLine t)

main = do
    putStrLn "Parsing"
    side <- getLine
    parser (read side :: Int)
    putStrLn "Done"
    -- mapM_ showBoard (solve (board 2) (0,0) [])
