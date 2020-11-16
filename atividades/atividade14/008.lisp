(defun isMagical (m)
    (setq result T)
    (setq n (array-dimension m 0))
    (setq n-squared (* n n))
    (setq goal 0)


    (dotimes (i n-squared) (setq goal (+ goal i 1)))
    (setq goal (/ goal 3))

    (setq ocurrences (make-array n-squared))

    (setq diag1 0) ; initialize diagonal sums
    (setq diag2 0)
    (dotimes (i n)
        (setq row 0) ; initialize row and column sums
        (setq col 0)
        (dotimes (j n)
            (if (and (>= (- (aref m i j) 1) 0) (< (- (aref m i j) 1) n-squared))
                (setf (aref ocurrences (- (aref m i j) 1)) T)
                (setq result NIL)
            )
            (setq row (+ row (aref m i j))) ; update row and column sums
            (setq col (+ col (aref m j i)))
        )
        (if (or (/= row goal) (/= col goal)) ; compare row and column
            (setq result NIL)
        )
        (setq diag1 (+ diag1 (aref m i i))) ; update diagonal sums
        (setq diag2 (+ diag2 (aref m i (- n i 1)))) 
    )
    (if (or (/= diag1 goal) (/= diag2 goal)) ; compare diagonals
        (setq result NIL)
    )
    (dotimes (i n-squared)
        (if (not (aref ocurrences i))
            (setq result NIL)
        )
    )
    result
)

(defun main()
    (write-line (write-to-string
        (isMagical
            (make-array '(3 3) :initial-contents '((2 7 6) (9 5 1) (4 3 8)))
        )
    ))

    (write-line (write-to-string
        (isMagical
            (make-array '(3 3) :initial-contents '((4 7 6) (9 5 1) (2 3 8)))
        )
    ))

    (write-line (write-to-string
        (isMagical
            (make-array '(3 3) :initial-contents '((5 5 5) (5 5 5) (5 5 5)))
        )
    ))
)

(main)