(defun _menor (a b)
    (if (< a b)
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

(defun main()
    (write-line (write-to-string (menor '(7 8 3 4 5 6))))
)

(main)