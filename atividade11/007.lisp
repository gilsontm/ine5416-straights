(defun fibonacci (n)
    (cond
        ((= n 0) 0)
        ((= n 1) 1)
        (t (+ (fibonacci (- n 1)) (fibonacci (- n 2))))
    )
)

(defun main()
    (setq n (read))
    (write-line (write-to-string (fibonacci n)))
)

(main)