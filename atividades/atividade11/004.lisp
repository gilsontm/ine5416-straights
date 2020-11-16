(defun exclusive-or(x y)
    (or (and x (not y)) (and y (not x)))
)

(defun main()
    (setq x (read))
    (setq y (read))
    (write-line (write-to-string (exclusive-or x y)))
)

(main)