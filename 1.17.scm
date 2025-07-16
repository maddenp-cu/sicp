(define (double n) (* n 2))
(define (halve n) (/ n 2))

(define (mult a b)
  (define (even? n) (= (remainder n 2) 0))
  (format #t "TICK~%")
  (cond ((= b 1) a)
        ((even? b) (mult (double a) (halve b)))
        (else (+ a (mult a (- b 1))))))

(mult 2 1024)
