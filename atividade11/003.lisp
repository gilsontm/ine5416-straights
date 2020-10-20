(defun area(a b)
    (/ (* a b) 2)
)

(defun main()
    (setq a (read))
    (setq b (read))
    (write-line (write-to-string (area a b)))
)

(main)