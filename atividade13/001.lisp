(defstruct ponto
    x
    y
)

(defun distancia (a b)
    (sqrt
        (+
            (expt (- (ponto-x a) (ponto-x b)) 2)
            (expt (- (ponto-y a) (ponto-y b)) 2)
        )
    )
)

(defun colineares (a b c)
    (= 0 (-
            (+ 
                (* (ponto-x a) (ponto-y b))
                (* (ponto-x b) (ponto-y c))
                (* (ponto-x c) (ponto-y a))
            )
            (+
                (* (ponto-x a) (ponto-y c))
                (* (ponto-x b) (ponto-y a))
                (* (ponto-x c) (ponto-y b))
            )
        )
    )
)

(defun formaTriangulo (a b c)
    (and 
        (> (+ (distancia a b) (distancia b c)) (distancia a c))
        (> (+ (distancia a b) (distancia a c)) (distancia b c))
        (> (+ (distancia a c) (distancia b c)) (distancia a b))
    )
)

(defun main()
    (write-line 
        (write-to-string
            (distancia (make-ponto :x 1 :y 0) (make-ponto :x 7 :y 0))
        )
    )

    (write-line 
        (write-to-string
            (colineares (make-ponto :x 1 :y 0) (make-ponto :x 2 :y 0) (make-ponto :x 3 :y 0))
        )
    )

    (write-line 
        (write-to-string
            (colineares (make-ponto :x 1 :y 1) (make-ponto :x 2 :y 0) (make-ponto :x -8 :y 0))
        )
    )

    (write-line 
        (write-to-string
            (formaTriangulo (make-ponto :x 1 :y 0) (make-ponto :x 2 :y 0) (make-ponto :x 3 :y 0))
        )
    )

    (write-line 
        (write-to-string
            (formaTriangulo (make-ponto :x 1 :y 1) (make-ponto :x 2 :y 0) (make-ponto :x -8 :y 0))
        )
    )
)

(main)
