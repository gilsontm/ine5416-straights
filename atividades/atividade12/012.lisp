(defun apagar (n lista)
    (cond
        ((null lista) ())
        ((= n 0) lista)
        (t (apagar (- n 1) (cdr lista)))
    )
)

(defun main()
    (write-line (write-to-string (apagar 3 '(1 2 3 4 5 6))))
)

(main)