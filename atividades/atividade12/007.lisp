(defun enesimo (n lista)
    (if (null lista)
        NIL
        (if (= n 0)
            (car lista)
            (enesimo (- n 1) (cdr lista))
        )
    )
)

(defun main()
    (write-line (write-to-string (enesimo 6 '(7 8 4 4 5 7 2 1))))
    (write-line (write-to-string (enesimo 4 '(7 8 4 4 5 7 2 1))))
    (write-line (write-to-string (enesimo 1 '(7 8 4 4 5 7 2 1))))
)

(main)