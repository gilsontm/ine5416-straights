type Nome = String
type Disciplina = String
type Nota = Float
type Aluno = (Nome, Disciplina, Nota, Nota, Nota)

aluno :: Int -> Aluno
aluno 1 = ("Ana", "Matemática", 10, 7, 6)
aluno 2 = ("Bruno", "Matemática", 9, 5.8, 10)
aluno 3 = ("Carlos", "Biologia", 6.3, 4, 2)
aluno 4 = ("Daniel", "Física", 0, 9, 8.7)

getNome :: Aluno -> Nome
getNome (nome, _, _, _, _) = nome

mediaAluno :: Aluno -> Float
mediaAluno (_, _, n1, n2, n3) = (n1 + n2 + n3) / 3

somaMedias :: Int -> Float
somaMedias 0 = 0
somaMedias numAlunos = (mediaAluno (aluno numAlunos)) + (somaMedias (numAlunos - 1))

mediaTurma :: Int -> Float
mediaTurma numAlunos = (somaMedias numAlunos) / (fromIntegral(numAlunos))

main = do
    print (getNome (aluno 1))
    print (mediaAluno (aluno 1))
    print (mediaTurma 4)