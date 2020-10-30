;; Trabalho II : Resolver de Straights (Str8s)
;; Disciplina  : INE5416 - Paradigmas de Programacao
;; Autor       : Gilson Trombetta Magro


;; | a funcao "possible" verifica um dado valor "value" pode
;; | ser colocado numa dada posicao (y,x) do tabuleiro;
;; | retorna T em caso positivo, e NIL em caso negativo.
(defun possible (numbers colors y x value)
    (block outer-block
        ;; percorre a linha y e a coluna x da matriz e
        ;; retorna NIL se o numero "value" aparecer em
        ;; alguma das posicoes visitadas
        (dotimes (i SIZE)
            (if (or (= (aref numbers y i) value) (= (aref numbers i x) value))
                (return-from outer-block NIL)))

        ;; < < < < <REGIAO VERTICAL> > > > 
            ;; busca a posicao mais ao norte e mais ao sul de (y,x),
            ;; de modo a encontrar os limites da região vertical da
            ;; qual a posicao (y,x) faz parte
            (setf north y)
            (setf south y)
            (loop while (and (> north 0) (aref colors (- north 1) x))
                do (setf north (- north 1)))
            (loop while (and (< south (- SIZE 1)) (aref colors (+ south 1) x))
                do (setf south (+ south 1)))

            ;; verifica se o valor de entrada (value) pode ser colocado
            ;; nesta regiao sem quebrar a regra de consecutividade
            (setf space (+ (- south north) 1))
            (loop for row from north to south
                do (if (and (/= (aref numbers row x) 0) (>= (abs (- (aref numbers row x) value)) space))
                    (return-from outer-block NIL)))
        ;; </</</</</REGIAO VERTICAL> > > > 

        ;; < < < < < REGIAO HORIZONTAL> > > > 
            ;; repete o processo para a regiao horizontal (direcoes leste e oeste)
            (setf west x)
            (setf east x)
            (loop while (and (> west 0) (aref colors y (- west 1)))
                do (setf west (- west 1)))
            (loop while (and (< east (- SIZE 1)) (aref colors y (+ east 1)))
                do (setf east (+ east 1)))

            (setf space (+ (- east west) 1))
            (loop for col from west to east
                do (if (and (/= (aref numbers y col) 0) (>= (abs (- (aref numbers y col) value)) space))
                    (return-from outer-block NIL)))
        ;; </</</</</REGIAO HORIZONTAL> > > > 

        ;; retorna T caso "value" passe em todas as verificacoes
        T
    )
)


;; | a funcao "solve" resolve o tabuleiro;
;; | ela recebe duas matrizes como entrada:
;; |    - "numbers": matriz de inteiros, representa os numeros das casas
;; |    - "colors" : matriz de booleanos, representa a cor das casas
(defun solve (numbers colors)
    (if
        (block solve-block
            ;; para cada cada linha y do tabuleiro...
            (dotimes (y SIZE)
                ;; e para cada coluna x do tabuleiro...
                (dotimes (x SIZE)
                    ;; se a posicao (y,x) é branca e vazia
                    (if (and (= (aref numbers y x) 0) (aref colors y x))
                        (progn
                            ;; entao para cada valor possivel (de 1 ate SIZE-1)
                            (dotimes (value SIZE)
                                ;; se este valor puder ser escrito em (y,x)
                                (if (possible numbers colors y x (+ value 1))
                                    (progn 
                                        ;; entao escreva-o na posicao (y,x)
                                        (setf (aref numbers y x) (+ value 1))
                                        ;; e resolva esta configuracao do tabuleiro
                                        (solve numbers colors)
                                        ;; depois remova-o da posicao (y,x)
                                        ;; e tente escrever o proximo valor,
                                        ;; ate encontrar todas as solucoes possiveis
                                        (setf (aref numbers y x) 0))))
                            ;; se encontrou uma posicao vazia, entao ainda nao
                            ;; chegamos numa solucao valida; desse modo nao 
                            ;; devemos imprimir o tabuleiro, portanto retorne NIL
                            (return-from solve-block NIL)))))
            ;; se nao encontrou nenhuma posicao vazia, entao chegamos numa
            ;; solucao valida; portanto, retorne T e imprima o tabuleiro
            T
        )
        ;; imprima o tabuleiro encontrado
        (parse-output numbers colors)
    )
)


;; | a funcao "parse-output" imprime o tabuleiro na tela
(defun parse-output (numbers colors)
    (dotimes (y SIZE)
        (terpri )
        (dotimes (x SIZE)
            (if (aref colors y x)
                (format T " ~D " (aref numbers y x))
                (format T "[~D]" (aref numbers y x)))))
    (terpri )
)


;; | a funcao "parse-input" le o tabuleiro da entrada, constroi as
;; | matrizes "numbers" e "colors", e por fim chama a funcao "solve"
(defun parse-input ()

    ;; le da entrada o tamanho do lado do tabuleiro
    (write-line "::: Lendo inteiro (>=1) que representa o tamanho do tabuleiro...")
    (setf SIZE (parse-integer (read-line )))

    ;; inicializa as matrizes "numbers" e "colors"
    (format T "::: Tamanho selecionado: ~Dx~D" SIZE SIZE)
    (terpri )
    (setf numbers (make-array (list SIZE SIZE) :initial-element 0))
    (setf colors  (make-array (list SIZE SIZE) :initial-element T))

    ;; le a entrada e monta as matrizes "numbers" e "colors"
    (write-line "::: Lendo o tabuleiro...")
    (dotimes (y SIZE)
        (dotimes (x SIZE)
            (setf word (write-to-string (read )))
            (setf (aref numbers y x) (parse-integer (subseq word 1)))
            (if (equalp (subseq word 0 1) "w")
                (setf (aref colors y x) T)
                (setf (aref colors y x) NIL))))

    ;; imprime o tabuleiro de entrada
    (write-line "::: Tabuleiro de entrada:")
    (parse-output numbers colors)

    ;; imprime as solucoes para o tabuleiro de entrada
    ;; se nao houver nenhuma, nao imprime nada
    (write-line "::: Solucoes validas:")
    (solve numbers colors)
    (write-line "::: Concluido!")
)


(parse-input)
