(defun maior (a b c)
    (if (and (> a b) (> a c))
        a
        (if (> b c)
            b
            c
        )
    )
)

(defun main()
    (setq a (read))
    (setq b (read))
    (setq c (read))
    (write-line (write-to-string (maior a b c)))
)

(main)