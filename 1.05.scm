(define (p) (p))

(define (test x y)
  (if (= x 0) 0 y))

(test 0 (p))

;; applicative order: infinite loop
;; normal order: 0
