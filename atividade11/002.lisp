(defun absolute(n) 
    (if (> n 0)
        n
        (* n (- 0 1))
    )
)

(defun main()
    (setq n (read))
    (write-line (write-to-string (absolute n)))
)

(main)