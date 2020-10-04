import Data.Function (fix)

main = do
    n <- getLine
    print((fix (\f x -> if x == 0 then 1 else x * (f (x-1)))) (read n::Int))