(defun primeiros (n lista)
    (cond
        ((null lista) ())
        ((= n 0) ())
        (t (cons (car lista) (primeiros (- n 1) (cdr lista))))

    )
)

(defun main()
    (write-line (write-to-string (primeiros 3 '(1 2 3 4 5 6))))
)

(main)