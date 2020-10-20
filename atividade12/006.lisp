(defun ocorrencias (n lista)
    (if (null lista)
        0
        (if (= n (car lista))
            (+ 1 (ocorrencias n (cdr lista)))
            (ocorrencias n (cdr lista))
        )
    )
)

(defun main()
    (write-line (write-to-string (ocorrencias 6 '(7 8 4 4 5 7 2 1))))
    (write-line (write-to-string (ocorrencias 4 '(7 8 4 4 5 7 2 1))))
    (write-line (write-to-string (ocorrencias 1 '(7 8 4 4 5 7 2 1))))
)

(main)