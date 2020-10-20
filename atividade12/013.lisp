(defun apagarEnquanto (f lista)
    (cond
        ((null lista) ())
        ((funcall f (car lista)) (apagarEnquanto f (cdr lista)))
        (t lista)
    )
)

(defun par (n)
    (= (mod n 2) 0)
)

(defun main()
    (write-line (write-to-string (apagarEnquanto (function par) '(2 4 1 2 3 4 5 6))))
)

(main)