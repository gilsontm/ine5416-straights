(defun possible (m y x value)
    (setq result T)
    (dotimes (i 9)
        (if (or (= (aref m y i) value) (= (aref m i x) value))
            (setq result NIL)
        )
    )
    (setq y0 (* (floor y 3) 3))
    (setq x0 (* (floor x 3) 3))
    (dotimes (i 3)
        (dotimes (j 3)
            (if (= (aref m (+ y0 j) (+ x0 i)) value)
                (setq result NIL)
            )
        )
    )
    result
)

(defun solve (m)
    (setq stack (cons T stack))
    (dotimes (y 9)
        (dotimes (x 9)
            (if (and (car stack) (= (aref m y x) 0))
                (progn
                    (setq stack (cons NIL (cdr stack)))
                    (dotimes (value 9)
                        (if (possible m y x (+ value 1))
                            (progn 
                                (setf (aref m y x) (+ value 1))
                                (solve m)
                                (setf (aref m y x) 0)
                            )
                        )
                    )
                )
            )
        )
    )
    (if (car stack)
        (write-line (write-to-string m))
    )
    (setq stack (cdr stack))
)

(setf a (make-array '(9 9)
        :initial-contents '(
            (0 3 2 5 7 9 4 6 8)
            (4 9 8 2 6 1 3 7 5)
            (7 5 0 3 8 4 2 1 9)
            (6 4 3 1 5 8 7 9 2)
            (5 2 1 7 9 3 8 4 6)
            (9 8 7 4 2 6 5 3 1)
            (2 1 4 9 3 5 6 8 7)
            (3 6 5 8 1 7 9 2 4)
            (8 7 9 6 4 2 1 5 3)
        )
    )
)

(setf b (make-array '(9 9)
        :initial-contents '(
            (0 0 2 0 0 0 5 0 0)
            (0 1 0 7 0 5 0 2 0)
            (4 0 0 0 9 0 0 0 7)
            (0 4 9 0 0 0 7 3 0)
            (8 0 1 0 3 0 4 0 9)
            (0 3 6 0 0 0 2 1 0)
            (2 0 0 0 8 0 0 0 4)
            (0 8 0 9 0 2 0 6 0)
            (0 0 7 0 0 0 8 0 0)
        )
    )
)


(defun main ()
    (setq stack ())
    ;; (solve a)
    (solve b)
)

(main)