(defstruct no
    n
    esq
    dir
)

(setq minhaArvore
    (make-no 
        :n 52
        :esq (make-no :n 32               ;pode omitir o NIL 
                      :esq (make-no :n 12 :esq NIL :dir NIL) 
                      :dir (make-no :n 35 :esq NIL :dir NIL)
             )
        :dir (make-no :n 56 
                      :esq (make-no :n 55 :esq NIL :dir NIL) 
                      :dir (make-no :n 64 :esq NIL :dir NIL)
             ) 
    )
)

(defun soma (arv)
    (if (null arv)
        0
        (+ 
            (no-n arv) 
            (soma (no-esq arv)) 
            (soma (no-dir arv))
        )
    )
)

(defun buscaElemento (arv x)
    (if (null arv)
        NIL
        (or 
            (= (no-n arv) x)
            (buscaElemento (no-esq arv) x) 
            (buscaElemento (no-dir arv) x)
        )
    )
)

(defun minimo (x y)
    (if (< x y)
        x
        y
    )
)

(setq INF 1000)

(defun minimoElemento (arv)
    (if (null arv)
        INF
        (minimo 
            (no-n arv) 
            (minimo 
                (minimoElemento (no-esq arv)) 
                (minimoElemento (no-dir arv))
            )
        )
    )
)

(defun incrementa (arv x)
    (if (not (null arv))
        (progn
            (setf (no-n arv) (+ (no-n arv) x))
            (incrementa (no-esq arv) x)
            (incrementa (no-dir arv) x)
        )
    )
)

;;; A 
(defun ocorrenciasElemento (arv x)
    (if (null arv)
        0
        (+ 
            (if (= (no-n arv) x)
                1
                0
            )
            (ocorrenciasElemento (no-esq arv) x)
            (ocorrenciasElemento (no-dir arv) x)
        )
    )
)

;;; B
(defun maioresQueElemento (arv x)
    (if (null arv)
        0
        (+ 
            (if (> (no-n arv) x)
                1
                0
            )
            (maioresQueElemento (no-esq arv) x)
            (maioresQueElemento (no-dir arv) x)
        )
    )
)

;;; D
(defun quantidade (arv)
    (if (null arv)
        0
        (+
            1
            (quantidade (no-esq arv))
            (quantidade (no-dir arv))
        )
    )
)

;;; C
(defun mediaElementos (arv)
    (/ (soma arv) (quantidade arv))
)

;;; F
(defun substituir (arv x y)
    (if (not (null arv))
        (progn
            (if (= (no-n arv) x)
                (setf (no-n arv) y)
            )
            (substituir (no-esq arv) x y)
            (substituir (no-dir arv) x y)
        )
    )
)

;;; G
(defun posordem (arv)
    (if (null arv)
        ()
        (concatenate
            'list
            (posordem (no-esq arv))
            (posordem (no-dir arv))
            (cons (no-n arv) ())
        )
    )
)

;;; H
(defun preordem (arv)
    (if (null arv)
        ()
        (concatenate
            'list
            (cons (no-n arv) (preordem (no-esq arv)))
            (preordem (no-dir arv))
        )
    )
)

;;; I
(defun emordem (arv)
    (if (null arv)
        ()
        (concatenate
            'list
            (emordem (no-esq arv))
            (cons (no-n arv) (emordem (no-dir arv)))
        )
    )
)

;;; E
(defun elementos (arv)
    (emordem arv)
)

;;; J
(defun subtraiParesImpares (arv)
    (if (null arv)
        0
        (+
            (if (= 0 (mod (no-n arv) 2))
                (no-n arv)
                (* -1 (no-n arv))
            )
            (subtraiParesImpares (no-esq arv))
            (subtraiParesImpares (no-dir arv))
        )
    )
)

;;; K
(defun novoNo (x)
    (make-no :n x)
)

(defun main()
    (write-line (write-to-string (soma minhaArvore)))
    (write-line (write-to-string (buscaElemento minhaArvore 35)))
    (write-line (write-to-string (buscaElemento minhaArvore 36)))
    (write-line (write-to-string (ocorrenciasElemento minhaArvore 36)))
    (write-line (write-to-string (maioresQueElemento minhaArvore 20)))
    (write-line (write-to-string (mediaElementos minhaArvore)))
    (write-line (write-to-string (preordem minhaArvore)))
    (write-line (write-to-string (emordem minhaArvore)))
    (write-line (write-to-string (posordem minhaArvore)))
    (write-line (write-to-string (minimoElemento minhaArvore)))
    (write-line (write-to-string (subtraiParesImpares minhaArvore)))
    (write-line (write-to-string (novoNo 14)))
    (write-line (write-to-string (substituir minhaArvore 35 11)))
    (write-line (write-to-string minhaArvore))
    (write-line (write-to-string (incrementa minhaArvore 2)))
    (write-line (write-to-string minhaArvore))
)

(main)