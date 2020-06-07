data Arvore = Null | No Int Arvore Arvore

ocorrenciasElemento :: Arvore -> Int -> Int
ocorrenciasElemento Null _ = 0
ocorrenciasElemento (No n esq dir) m
    | (n == m)  = 1 + (ocorrenciasElemento esq m) + (ocorrenciasElemento dir m)
    | otherwise =     (ocorrenciasElemento esq m) + (ocorrenciasElemento dir m)

maioresQueElemento :: Arvore -> Int -> Int
maioresQueElemento Null _ = 0
maioresQueElemento (No n esq dir) m
    | (n > m)   = 1 + (maioresQueElemento esq m) + (maioresQueElemento dir m)
    | otherwise =     (maioresQueElemento esq m) + (maioresQueElemento dir m)

quantidade :: Arvore -> Int
quantidade Null = 0
quantidade (No _ esq dir) = 1 + (quantidade esq) + (quantidade dir)

somaElementos :: Arvore -> Int
somaElementos Null = 0
somaElementos (No n esq dir) = n + (somaElementos esq) + (somaElementos dir)

mediaElementos :: Arvore -> Float
mediaElementos Null = 0
mediaElementos t =
    (fromIntegral (somaElementos t)) / (fromIntegral (quantidade t))

elementos :: Arvore -> [Int]
elementos Null = []
elementos (No n esq dir) = (elementos esq) ++ [n] ++ (elementos dir)

minhaArvore :: Arvore
minhaArvore = No 5 (No 3 (No 2 Null Null) Null) (No 8 (No 7 Null Null) (No 9 Null Null))

main = do 
    print (ocorrenciasElemento minhaArvore 1)
    print (maioresQueElemento minhaArvore 3)
    print (mediaElementos minhaArvore)
    print (quantidade minhaArvore)
    print (elementos minhaArvore)
