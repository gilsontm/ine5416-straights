(defun inverte (lista)
    (if (null lista)
        ()
        (concatenate 'list (inverte (cdr lista)) (list (car lista)))
    )
)

(defun main()
    (write-line (write-to-string (inverte '(1 2 3 4 5 6))))
)

(main)