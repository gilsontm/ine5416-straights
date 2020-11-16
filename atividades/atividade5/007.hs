alunos :: [(Int, String, Float)]
alunos = [(1, "Ana", 3.4), (2, "Bob", 6.7), (3, "Tom", 7.6)]

getNome :: (Int, String, Float) -> String
getNome (a,b,c) = b

getPrimeiroAluno :: [(Int, String, Float)] -> (Int, String, Float)
getPrimeiroAluno (a:_) = a

aprovado :: (Int, String, Float) -> Bool
aprovado (_,_,c) = c >= 6

aprovados :: [(Int, String, Float)] -> [String]
aprovados [] = []
aprovados x = map (getNome) (filter (aprovado) x)

aprovados2 :: [(Int, String, Float)] -> [String]
aprovados2 [] = []
aprovados2 lista = [b | (a, b, c) <- lista, c >= 6]

gerarPares :: [t] -> [u] -> [(t,u)] 
gerarPares l1 l2 = [(a,b) | a <- l1, b <- l2]

gerarDuplas :: [(Int, String, Float)] -> [(String, String)]
gerarDuplas [] = []
gerarDuplas lista = [(b, y) | ((a, b, c), (x, y, z)) <- gerarPares lista lista, b /= y]

main = do
    print (gerarDuplas alunos)