(defun _menor (a b)
    (if (< a b)
        a
        b
    )
)

(defun _maior (a b)
    (if (> a b)
        a
        b
    )
)

(defun menor (lista)
    (if (null lista) 
        0
        (if (null (cdr lista))
            (car lista)
            (_menor (car lista) (menor (cdr lista)))
        )
    )
)

(defun maior (lista)
    (if (null lista) 
        0
        (if (null (cdr lista))
            (car lista)
            (_maior (car lista) (maior (cdr lista)))
        )
    )
)

(defun diferencaMaiorMenor (lista)
    (- (maior lista) (menor lista))
)

(defun main()
    (write-line (write-to-string (diferencaMaiorMenor '(7 8 3 4 5 6))))
)

(main)