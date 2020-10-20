(defun busca (n lista)
    (if (null lista)
        NIL
        (or (= n (car lista)) (busca n (cdr lista)))
    )
)

(defun main()
    (write-line (write-to-string (busca 2 '(7 8 3 4 5 6))))
    (write-line (write-to-string (busca 4 '(7 8 3 4 5 6))))
)

(main)