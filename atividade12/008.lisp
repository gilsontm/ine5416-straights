(defun fatia (n m lista)
    (cond
        ((null lista) ())
        ((= m 0) ())
        ((= n 0) (cons (car lista) (fatia 0 (- m 1) (cdr lista))))
        (t (fatia (- n 1) (- m 1) (cdr lista)))
    )
)

(defun main()
    (write-line (write-to-string (fatia 0 5 '(7 8 4 4 5 7 2 1))))
    (write-line (write-to-string (fatia 2 4 '(7 8 4 4 5 7 2 1))))
    (write-line (write-to-string (fatia 1 4 '(7 8 4 4 5 7 2 1))))
)

(main)