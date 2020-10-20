(defun eh-triangulo (a b c)
    (and (> (+ a b) c) (and (> (+ a c) b) (> (+ b c) a)))
)

(defun main()
    (setq a (read))
    (setq b (read))
    (setq c (read))
    (write-line (write-to-string (eh-triangulo a b c)))
)

(main)