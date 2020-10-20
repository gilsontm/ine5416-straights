(defun mdc (a b)
    (if (= b 0)
        a
        (mdc b (mod a b))
    )
)

(defun main()
    (setq a (read))
    (setq b (read))
    (write-line (write-to-string (mdc a b)))
)

(main)