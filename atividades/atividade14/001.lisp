(defun main () 
    (write-line (write-to-string 
        ((lambda (x y) (if x (not y) y)) T T)
    ))
    (write-line (write-to-string 
        ((lambda (x y) (if x (not y) y)) T NIL)
    ))
    (write-line (write-to-string 
        ((lambda (x y) (if x (not y) y)) NIL T)
    ))
    (write-line (write-to-string 
        ((lambda (x y) (if x (not y) y)) NIL NIL)
    ))
)

(main)