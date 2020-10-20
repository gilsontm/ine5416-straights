(defun tamanho (lista)
    (if (null lista) 
        0
        (+ 1 (tamanho (cdr lista)))
    )
)

(defun soma (lista)
    (if (null lista)
        0
        (+ (car lista) (soma (cdr lista)))
    )
)

(defun media (lista)
    (/ (soma lista) (tamanho lista))
)

(defun main()
    (write-line (write-to-string (media '(1 2 3 4 5 6))))
)

(main)