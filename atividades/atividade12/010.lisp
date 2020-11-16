(defun mapear (f lista)
    (if (null lista)
        ()
        (cons (funcall f (car lista)) (mapear f (cdr lista)))
    )
)

(defun dobro (n)
    (* n 2)
)

(defun main()
    (write-line (write-to-string (mapear (function dobro) '(1 2 3 4 5 6))))
)

(main)