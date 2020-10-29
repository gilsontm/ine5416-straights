(defun isPermutation (m) 
    (setq n (array-dimension m 0))
    (setq result T)
    (dotimes (i n)
        (setq row NIL)
        (setq col NIL)
        (dotimes (j n)
            (if (= (aref m i j) 1)
                (if row
                    (setq result NIL)
                    (setq row T)
                )
                (if (/= (aref m i j) 0)
                    (setq result NIL)
                )
            )
            (if (= (aref m j i) 1)
                (if col
                    (setq result NIL)
                    (setq col T)
                )
                (if (/= (aref m j i) 0)
                    (setq result NIL)
                )
            )
        )
        (if (or (not row) (not col))
            (setq result NIL)
        )
    )
    result
)

(defun main()
    (write-line (write-to-string
        (isPermutation
            (make-array '(3 3) :initial-contents '((1 0 0) (0 0 1) (0 1 0)))
        )
    ))

    (write-line (write-to-string
        (isPermutation
            (make-array '(2 2) :initial-contents '((1 0) (1 0)))
        )
    ))

    (write-line (write-to-string
        (isPermutation
            (make-array '(2 2) :initial-contents '((1 0) (0 1)))
        )
    ))
)

(main)