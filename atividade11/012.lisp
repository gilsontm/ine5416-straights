(defun mdc (a b)
    (if (= b 0)
        a
        (mdc b (mod a b))
    )
)

(defun mdc3 (a b c)
    (mdc a (mdc b c))
)

(defun main()
    (setq a (read))
    (setq b (read))
    (setq c (read))
    (write-line (write-to-string (mdc3 a b c)))
)

(main)