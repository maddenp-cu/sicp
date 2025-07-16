(define (double n) (* n 2))
(define (halve n) (/ n 2))

(define (even? n) (= (remainder n 2) 0))

(define (mult a b)
  (define (mult-iter x a b)
    (format #t "TICK~%")
    (cond ((= b 0) x)
          ((even? b) (mult-iter x (double a) (halve b)))
          (else (mult-iter (+ x a) a (- b 1)))))
  (mult-iter 0 a b))

(mult 2 4096)
