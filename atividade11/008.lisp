(defun bhaskara (a b c)
    (/ (+ (- 0 b) (sqrt (- (expt b 2) (* 4 (* b c))))) (* 2 a))
)

(defun main()
    (setq a (read))
    (setq b (read))
    (setq c (read))
    (write-line (write-to-string (bhaskara a b c)))
)

(main)