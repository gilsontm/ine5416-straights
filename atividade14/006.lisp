(defun mapear (f lista)
    (if (null lista)
        ()
        (cons (funcall f (car lista)) (mapear f (cdr lista)))
    )
)

(defun main ()
    (write-line (write-to-string 
        (mapear (lambda (x) (= 0 (mod x 2))) '(1 2 3 4 5 6 7 8 9 10))
    ))
)

(main)
