calcPosicaoFinal :: [(Int, Int)] -> Maybe (Int, Int)
calcPosicaoFinal (h:[]) = Just h
calcPosicaoFinal (h:t)  = if (isValid h (t!!0)) then calcPosicaoFinal t else Nothing

isValid :: (Int, Int) -> (Int, Int) -> Bool
isValid (x0,y0) (x1,y1) = (abs(x1-x0)==2 && abs(y1-y0)==1) || (abs(y1-y0)==2 && abs(x1-x0)==1)

main = do
    print(calcPosicaoFinal [(1,0),(2,2),(0,3),(2,4)])
    print(calcPosicaoFinal [(1,0),(3,2),(0,3),(2,4)])